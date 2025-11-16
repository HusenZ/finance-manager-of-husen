import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:dartz/dartz.dart';
import '../../core/utils/app_logger.dart';

class AuthService {
  final FirebaseAuth _firebaseAuth;
  final GoogleSignIn _googleSignIn;

  AuthService({
    FirebaseAuth? firebaseAuth,
    GoogleSignIn? googleSignIn,
  })  : _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance,
        _googleSignIn = googleSignIn ?? GoogleSignIn();

  User? get currentUser => _firebaseAuth.currentUser;
  String? get currentUserId => _firebaseAuth.currentUser?.uid;
  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();

  Future<Either<String, User>> signUpWithEmailPassword({
    required String email,
    required String password,
    required String name,
  }) async {
    try {
      final UserCredential userCredential =
          await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (userCredential.user != null) {
        await userCredential.user!.updateDisplayName(name);
        await userCredential.user!.reload();
        final updatedUser = _firebaseAuth.currentUser;

        if (updatedUser != null) {
          AppLogger.info('User signed up successfully: ${updatedUser.email}');
          return Right(updatedUser);
        }
      }

      return const Left('Failed to create user');
    } on FirebaseAuthException catch (e) {
      AppLogger.error('Sign up failed', error: e);
      return Left(_getFirebaseAuthErrorMessage(e));
    } catch (e, stackTrace) {
      AppLogger.error('Unexpected error during sign up', error: e, stackTrace: stackTrace);
      return const Left('An unexpected error occurred');
    }
  }

  Future<Either<String, User>> signInWithEmailPassword({
    required String email,
    required String password,
  }) async {
    try {
      final UserCredential userCredential =
          await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (userCredential.user != null) {
        AppLogger.info('User signed in successfully: ${userCredential.user!.email}');
        return Right(userCredential.user!);
      }

      return const Left('Sign in failed');
    } on FirebaseAuthException catch (e) {
      AppLogger.error('Sign in failed', error: e);
      return Left(_getFirebaseAuthErrorMessage(e));
    } catch (e, stackTrace) {
      AppLogger.error('Unexpected error during sign in', error: e, stackTrace: stackTrace);
      return const Left('An unexpected error occurred');
    }
  }

  Future<Either<String, User>> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

      if (googleUser == null) {
        return const Left('Google sign in cancelled');
      }

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final UserCredential userCredential =
          await _firebaseAuth.signInWithCredential(credential);

      if (userCredential.user != null) {
        AppLogger.info('User signed in with Google: ${userCredential.user!.email}');
        return Right(userCredential.user!);
      }

      return const Left('Google sign in failed');
    } on FirebaseAuthException catch (e) {
      AppLogger.error('Google sign in failed', error: e);
      return Left(_getFirebaseAuthErrorMessage(e));
    } catch (e, stackTrace) {
      AppLogger.error('Unexpected error during Google sign in', error: e, stackTrace: stackTrace);
      return const Left('An unexpected error occurred');
    }
  }

  Future<Either<String, void>> resetPassword({required String email}) async {
    try {
      await _firebaseAuth.sendPasswordResetEmail(email: email);
      AppLogger.info('Password reset email sent to: $email');
      return const Right(null);
    } on FirebaseAuthException catch (e) {
      AppLogger.error('Password reset failed', error: e);
      return Left(_getFirebaseAuthErrorMessage(e));
    } catch (e, stackTrace) {
      AppLogger.error('Unexpected error during password reset', error: e, stackTrace: stackTrace);
      return const Left('An unexpected error occurred');
    }
  }

  Future<Either<String, void>> signOut() async {
    try {
      await Future.wait([
        _firebaseAuth.signOut(),
        _googleSignIn.signOut(),
      ]);
      AppLogger.info('User signed out successfully');
      return const Right(null);
    } catch (e, stackTrace) {
      AppLogger.error('Sign out failed', error: e, stackTrace: stackTrace);
      return const Left('Failed to sign out');
    }
  }

  Future<Either<String, void>> deleteAccount() async {
    try {
      final user = _firebaseAuth.currentUser;
      if (user == null) {
        return const Left('No user signed in');
      }

      await user.delete();
      AppLogger.info('User account deleted');
      return const Right(null);
    } on FirebaseAuthException catch (e) {
      AppLogger.error('Account deletion failed', error: e);
      return Left(_getFirebaseAuthErrorMessage(e));
    } catch (e, stackTrace) {
      AppLogger.error('Unexpected error during account deletion', error: e, stackTrace: stackTrace);
      return const Left('An unexpected error occurred');
    }
  }

  String _getFirebaseAuthErrorMessage(FirebaseAuthException e) {
    switch (e.code) {
      case 'weak-password':
        return 'The password is too weak';
      case 'email-already-in-use':
        return 'An account already exists with this email';
      case 'invalid-email':
        return 'The email address is invalid';
      case 'user-disabled':
        return 'This user account has been disabled';
      case 'user-not-found':
        return 'No account found with this email';
      case 'wrong-password':
        return 'Incorrect password';
      case 'too-many-requests':
        return 'Too many attempts. Please try again later';
      case 'operation-not-allowed':
        return 'This sign-in method is not enabled';
      case 'requires-recent-login':
        return 'Please sign in again to complete this action';
      default:
        return e.message ?? 'Authentication failed';
    }
  }
}
