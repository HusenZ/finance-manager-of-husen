import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../core/secrets.dart';
import '../core/utils/app_logger.dart';

class AuthService {
  AuthService({GoogleSignIn? googleSignIn})
    : _googleSignIn = googleSignIn ?? GoogleSignIn.instance;

  final GoogleSignIn _googleSignIn;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  User? get currentUser => _auth.currentUser;
  String? get currentUserId => _auth.currentUser?.uid;
  Stream<User?> get authStateChanges => _auth.authStateChanges();

  Future<void> _initializeSubscriptionDoc(String uid) async {
    final isOwner = uid == Secrets.ownerUid;
    final tier = isOwner ? 'premium' : 'free';

    try {
      await _firestore.collection('users').doc(uid).set({
        'subscription': {
          'tier': tier,
          'billingCycle': null,
          'razorpaySubscriptionId': null,
          'status': 'active',
          'currentPeriodEnd': null,
          'aiMessagesUsed': 0,
          'aiMessagesResetDate': Timestamp.now(),
          'isOwner': isOwner,
          'lastSyncedAt': null,
        },
        'profile': {
          'email': _auth.currentUser?.email,
          'displayName': _auth.currentUser?.displayName,
          'avatarUrl': _auth.currentUser?.photoURL,
          'isOwner': isOwner,
          'createdAt': Timestamp.now(),
        },
      }, SetOptions(merge: true));
    } on FirebaseException catch (error, stackTrace) {
      if (error.code != 'permission-denied') {
        rethrow;
      }
      // Never block auth if Firestore rules are not deployed yet.
      AppLogger.warning(
        'Profile/subscription bootstrap skipped due to Firestore permissions.',
      );
      AppLogger.debug(stackTrace.toString());
    }
  }

  Future<Either<String, User>> signUpWithEmail({
    required String email,
    required String password,
  }) async {
    try {
      final response = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      final user = response.user;
      if (user == null) return const Left('Failed to sign up user');

      await _initializeSubscriptionDoc(user.uid);
      return Right(user);
    } on FirebaseAuthException catch (e) {
      return Left(e.message ?? 'Sign up failed');
    } catch (e, stackTrace) {
      AppLogger.error(
        'Unexpected error during sign up',
        error: e,
        stackTrace: stackTrace,
      );
      return const Left('An unexpected error occurred');
    }
  }

  Future<Either<String, User>> signInWithEmail({
    required String email,
    required String password,
  }) async {
    try {
      final response = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      final user = response.user;
      if (user == null) return const Left('Failed to sign in user');
      return Right(user);
    } on FirebaseAuthException catch (e) {
      return Left(e.message ?? 'Sign in failed');
    } catch (e, stackTrace) {
      AppLogger.error(
        'Unexpected error during sign in',
        error: e,
        stackTrace: stackTrace,
      );
      return const Left('An unexpected error occurred');
    }
  }

  Future<Either<String, User>> signInWithGoogle() async {
    try {
      final googleUser = await _googleSignIn.authenticate();

      final googleAuth = googleUser.authentication;
      final credential = GoogleAuthProvider.credential(
        idToken: googleAuth.idToken,
      );

      final userCredential = await _auth.signInWithCredential(credential);
      final user = userCredential.user;
      if (user == null) return const Left('Google sign in failed');

      await _initializeSubscriptionDoc(user.uid);
      return Right(user);
    } on FirebaseAuthException catch (e) {
      return Left(e.message ?? 'Google sign in failed');
    } on GoogleSignInException catch (e, stackTrace) {
      AppLogger.error(
        'Google sign in platform error',
        error: e,
        stackTrace: stackTrace,
      );
      return Left(e.description ?? 'Google sign in failed');
    } catch (e, stackTrace) {
      AppLogger.error(
        'Unexpected error during Google sign in',
        error: e,
        stackTrace: stackTrace,
      );
      return const Left('An unexpected error occurred');
    }
  }

  Future<Either<String, void>> resetPassword({required String email}) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
      return const Right(null);
    } on FirebaseAuthException catch (e) {
      return Left(e.message ?? 'Failed to send reset email');
    } catch (e, stackTrace) {
      AppLogger.error(
        'Unexpected error during password reset',
        error: e,
        stackTrace: stackTrace,
      );
      return const Left('An unexpected error occurred');
    }
  }

  Future<Either<String, void>> signOut() async {
    try {
      await Future.wait([_auth.signOut(), _googleSignIn.signOut()]);
      return const Right(null);
    } catch (e, stackTrace) {
      AppLogger.error('Sign out failed', error: e, stackTrace: stackTrace);
      return const Left('Failed to sign out');
    }
  }

  Future<Either<String, void>> deleteAccount() async {
    return const Left('Delete account should be handled manually by the user');
  }

  Future<Either<String, User>> signUpWithEmailPassword({
    required String email,
    required String password,
    required String name,
  }) => signUpWithEmail(email: email, password: password);

  Future<Either<String, User>> signInWithEmailPassword({
    required String email,
    required String password,
  }) => signInWithEmail(email: email, password: password);
}
