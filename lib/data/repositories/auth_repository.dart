import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../core/utils/app_logger.dart';
import '../../services/auth_service.dart';
import '../../services/subscription_service.dart';
import '../models/user_profile.dart';
import '../services/firebase_service.dart';
import '../services/hive_service.dart';

class AuthRepository {
  final AuthService _authService;
  final FirebaseService _firebaseService;
  final HiveService _hiveService;
  final SubscriptionService _subscriptionService;

  AuthRepository({
    required AuthService authService,
    required FirebaseService firebaseService,
    required HiveService hiveService,
    required SubscriptionService subscriptionService,
  }) : _authService = authService,
       _firebaseService = firebaseService,
       _hiveService = hiveService,
       _subscriptionService = subscriptionService;

  Stream<User?> get authStateChanges => _authService.authStateChanges;
  User? get currentUser => _authService.currentUser;
  String? get currentUserId => _authService.currentUserId;

  Future<Either<String, UserProfile>> signUp({
    required String email,
    required String password,
    required String name,
  }) async {
    try {
      final result = await _authService.signUpWithEmailPassword(
        email: email,
        password: password,
        name: name,
      );

      return result.fold((error) => Left(error), (user) async {
        final profileResult = await _ensureUserProfile(
          user: user,
          preferredName: name,
          fallbackEmail: email,
        );

        return profileResult.fold((err) => Left(err), (profile) async {
          await _subscriptionService.initializeUserSubscription(user.uid);
          await _subscriptionService.evaluateOwnerAccess(user.uid);
          await _subscriptionService.refresh();
          return Right(profile);
        });
      });
    } catch (e, stackTrace) {
      AppLogger.error('Sign up failed', error: e, stackTrace: stackTrace);
      return Left('Sign up failed: ${e.toString()}');
    }
  }

  Future<Either<String, UserProfile>> signIn({
    required String email,
    required String password,
  }) async {
    try {
      final result = await _authService.signInWithEmailPassword(
        email: email,
        password: password,
      );

      return result.fold((error) => Left(error), (user) async {
        final profileResult = await _ensureUserProfile(user: user);
        return profileResult.fold((err) => Left(err), (profile) async {
          await _subscriptionService.initializeUserSubscription(user.uid);
          await _subscriptionService.evaluateOwnerAccess(user.uid);
          await _subscriptionService.refresh();
          return Right(profile);
        });
      });
    } catch (e, stackTrace) {
      AppLogger.error('Sign in failed', error: e, stackTrace: stackTrace);
      return Left('Sign in failed: ${e.toString()}');
    }
  }

  Future<Either<String, UserProfile>> signInWithGoogle() async {
    try {
      final result = await _authService.signInWithGoogle();

      return result.fold((error) => Left(error), (user) async {
        final profileResult = await _ensureUserProfile(user: user);
        return profileResult.fold((err) => Left(err), (profile) async {
          await _subscriptionService.initializeUserSubscription(user.uid);
          await _subscriptionService.evaluateOwnerAccess(user.uid);
          await _subscriptionService.refresh();
          return Right(profile);
        });
      });
    } catch (e, stackTrace) {
      AppLogger.error(
        'Google sign in failed',
        error: e,
        stackTrace: stackTrace,
      );
      return Left('Google sign in failed: ${e.toString()}');
    }
  }

  Future<Either<String, UserProfile>> _loadUserProfile(String userId) async {
    try {
      final cachedProfile = await _hiveService.getUserProfile();
      if (cachedProfile != null && cachedProfile.id == userId) {
        return Right(cachedProfile);
      }

      final result = await _firebaseService.getUserProfile(userId);
      return result.fold((error) => Left(error), (profile) async {
        await _hiveService.saveUserProfile(profile);
        return Right(profile);
      });
    } catch (e, stackTrace) {
      AppLogger.error(
        'Failed to load user profile',
        error: e,
        stackTrace: stackTrace,
      );
      return Left('Failed to load profile: ${e.toString()}');
    }
  }

  Future<Either<String, UserProfile>> _ensureUserProfile({
    required User user,
    String? preferredName,
    String? fallbackEmail,
  }) async {
    final existing = await _loadUserProfile(user.uid);
    return existing.fold(
      (error) async {
        if (!error.toLowerCase().contains('not found')) {
          return Left(error);
        }

        final profile = UserProfile(
          id: user.uid,
          email: user.email ?? fallbackEmail ?? '',
          name: preferredName ?? user.displayName ?? 'User',
          profilePicture: user.photoURL,
          currency: 'INR',
          createdAt: DateTime.now(),
        );

        final saveResult = await _firebaseService.saveUserProfile(profile);
        return saveResult.fold((saveError) => Left(saveError), (_) async {
          await _hiveService.saveUserProfile(profile);
          return Right(profile);
        });
      },
      (profile) async {
        await _hiveService.saveUserProfile(profile);
        return Right(profile);
      },
    );
  }

  Future<Either<String, void>> resetPassword({required String email}) async {
    return _authService.resetPassword(email: email);
  }

  Future<Either<String, void>> signOut() async {
    await _hiveService.clearAllData();
    return _authService.signOut();
  }

  Future<Either<String, UserProfile>> updateUserProfile({
    required UserProfile profile,
  }) async {
    final updatedProfile = profile.copyWith(updatedAt: DateTime.now());
    final result = await _firebaseService.saveUserProfile(updatedProfile);

    return result.fold((error) => Left(error), (_) async {
      await _hiveService.saveUserProfile(updatedProfile);
      return Right(updatedProfile);
    });
  }

  Future<Either<String, UserProfile?>> getCurrentUserProfile() async {
    if (currentUserId == null) {
      return const Right(null);
    }
    return _loadUserProfile(currentUserId!);
  }
}
