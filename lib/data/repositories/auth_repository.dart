import 'package:firebase_auth/firebase_auth.dart';
import 'package:dartz/dartz.dart';
import '../services/auth_service.dart';
import '../services/firebase_service.dart';
import '../services/hive_service.dart';
import '../models/user_profile.dart';
import '../../core/utils/app_logger.dart';

class AuthRepository {
  final AuthService _authService;
  final FirebaseService _firebaseService;
  final HiveService _hiveService;

  AuthRepository({
    required AuthService authService,
    required FirebaseService firebaseService,
    required HiveService hiveService,
  })  : _authService = authService,
        _firebaseService = firebaseService,
        _hiveService = hiveService;

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

      return result.fold(
        (error) => Left(error),
        (user) async {
          final profile = UserProfile(
            id: user.uid,
            email: user.email ?? email,
            name: name,
            profilePicture: user.photoURL,
            currency: 'INR',
            createdAt: DateTime.now(),
          );

          await _firebaseService.saveUserProfile(profile);
          await _hiveService.saveUserProfile(profile);

          AppLogger.info('User profile created: ${profile.email}');
          return Right(profile);
        },
      );
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

      return result.fold(
        (error) => Left(error),
        (user) async {
          return await _loadUserProfile(user.uid);
        },
      );
    } catch (e, stackTrace) {
      AppLogger.error('Sign in failed', error: e, stackTrace: stackTrace);
      return Left('Sign in failed: ${e.toString()}');
    }
  }

  Future<Either<String, UserProfile>> signInWithGoogle() async {
    try {
      final result = await _authService.signInWithGoogle();

      return result.fold(
        (error) => Left(error),
        (user) async {
          final profileResult = await _firebaseService.getUserProfile(user.uid);

          return profileResult.fold(
            (error) async {
              // Profile doesn't exist, create new one
              final profile = UserProfile(
                id: user.uid,
                email: user.email ?? '',
                name: user.displayName ?? '',
                profilePicture: user.photoURL,
                currency: 'INR',
                createdAt: DateTime.now(),
              );

              await _firebaseService.saveUserProfile(profile);
              await _hiveService.saveUserProfile(profile);

              AppLogger.info('New Google user profile created: ${profile.email}');
              return Right(profile);
            },
            (profile) async {
              await _hiveService.saveUserProfile(profile);
              AppLogger.info('Existing Google user signed in: ${profile.email}');
              return Right(profile);
            },
          );
        },
      );
    } catch (e, stackTrace) {
      AppLogger.error('Google sign in failed', error: e, stackTrace: stackTrace);
      return Left('Google sign in failed: ${e.toString()}');
    }
  }

  Future<Either<String, UserProfile>> _loadUserProfile(String userId) async {
    try {
      // Try to get from cache first
      final cachedProfile = await _hiveService.getUserProfile();
      if (cachedProfile != null && cachedProfile.id == userId) {
        AppLogger.debug('Loaded user profile from cache');
        return Right(cachedProfile);
      }

      // Load from Firestore
      final result = await _firebaseService.getUserProfile(userId);
      return result.fold(
        (error) => Left(error),
        (profile) async {
          await _hiveService.saveUserProfile(profile);
          AppLogger.debug('Loaded user profile from Firestore');
          return Right(profile);
        },
      );
    } catch (e, stackTrace) {
      AppLogger.error('Failed to load user profile', error: e, stackTrace: stackTrace);
      return Left('Failed to load profile: ${e.toString()}');
    }
  }

  Future<Either<String, void>> resetPassword({required String email}) async {
    try {
      return await _authService.resetPassword(email: email);
    } catch (e, stackTrace) {
      AppLogger.error('Password reset failed', error: e, stackTrace: stackTrace);
      return Left('Password reset failed: ${e.toString()}');
    }
  }

  Future<Either<String, void>> signOut() async {
    try {
      await _hiveService.clearAllData();
      return await _authService.signOut();
    } catch (e, stackTrace) {
      AppLogger.error('Sign out failed', error: e, stackTrace: stackTrace);
      return Left('Sign out failed: ${e.toString()}');
    }
  }

  Future<Either<String, UserProfile>> updateUserProfile({
    required UserProfile profile,
  }) async {
    try {
      final updatedProfile = profile.copyWith(
        updatedAt: DateTime.now(),
      );

      final result = await _firebaseService.saveUserProfile(updatedProfile);
      return result.fold(
        (error) => Left(error),
        (_) async {
          await _hiveService.saveUserProfile(updatedProfile);
          AppLogger.info('User profile updated: ${updatedProfile.email}');
          return Right(updatedProfile);
        },
      );
    } catch (e, stackTrace) {
      AppLogger.error('Failed to update profile', error: e, stackTrace: stackTrace);
      return Left('Failed to update profile: ${e.toString()}');
    }
  }

  Future<Either<String, UserProfile?>> getCurrentUserProfile() async {
    try {
      if (currentUserId == null) {
        return const Right(null);
      }
      return await _loadUserProfile(currentUserId!);
    } catch (e, stackTrace) {
      AppLogger.error('Failed to get current user profile', error: e, stackTrace: stackTrace);
      return Left('Failed to get profile: ${e.toString()}');
    }
  }
}
