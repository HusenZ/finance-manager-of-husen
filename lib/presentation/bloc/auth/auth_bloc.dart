import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/repositories/auth_repository.dart';
import '../../../core/utils/app_logger.dart';
import 'auth_event.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository _authRepository;
  StreamSubscription? _authStateSubscription;

  AuthBloc({
    required AuthRepository authRepository,
  })  : _authRepository = authRepository,
        super(const AuthState.initial()) {
    on<SignUpRequested>(_onSignUpRequested);
    on<SignInRequested>(_onSignInRequested);
    on<SignInWithGoogleRequested>(_onSignInWithGoogleRequested);
    on<SignOutRequested>(_onSignOutRequested);
    on<ResetPasswordRequested>(_onResetPasswordRequested);
    on<UpdateProfileRequested>(_onUpdateProfileRequested);
    on<AuthStateChanged>(_onAuthStateChanged);

    _initializeAuthStateListener();
  }

  void _initializeAuthStateListener() {
    _authStateSubscription = _authRepository.authStateChanges.listen((user) {
      add(const AuthEvent.authStateChanged());
    });
  }

  Future<void> _onAuthStateChanged(
    AuthStateChanged event,
    Emitter<AuthState> emit,
  ) async {
    try {
      final result = await _authRepository.getCurrentUserProfile();

      result.fold(
        (error) {
          AppLogger.warning('Auth state check failed: $error');
          emit(const AuthState.unauthenticated());
        },
        (profile) {
          if (profile != null) {
            emit(AuthState.authenticated(user: profile));
          } else {
            emit(const AuthState.unauthenticated());
          }
        },
      );
    } catch (e) {
      AppLogger.error('Auth state change error', error: e);
      emit(const AuthState.unauthenticated());
    }
  }

  Future<void> _onSignUpRequested(
    SignUpRequested event,
    Emitter<AuthState> emit,
  ) async {
    try {
      emit(const AuthState.loading());

      final result = await _authRepository.signUp(
        email: event.email,
        password: event.password,
        name: event.name,
      );

      result.fold(
        (error) {
          AppLogger.error('Sign up failed: $error');
          emit(AuthState.error(message: error));
        },
        (profile) {
          AppLogger.info('Sign up successful: ${profile.email}');
          emit(AuthState.authenticated(user: profile));
        },
      );
    } catch (e) {
      AppLogger.error('Sign up error', error: e);
      emit(AuthState.error(message: 'An unexpected error occurred'));
    }
  }

  Future<void> _onSignInRequested(
    SignInRequested event,
    Emitter<AuthState> emit,
  ) async {
    try {
      emit(const AuthState.loading());

      final result = await _authRepository.signIn(
        email: event.email,
        password: event.password,
      );

      result.fold(
        (error) {
          AppLogger.error('Sign in failed: $error');
          emit(AuthState.error(message: error));
        },
        (profile) {
          AppLogger.info('Sign in successful: ${profile.email}');
          emit(AuthState.authenticated(user: profile));
        },
      );
    } catch (e) {
      AppLogger.error('Sign in error', error: e);
      emit(AuthState.error(message: 'An unexpected error occurred'));
    }
  }

  Future<void> _onSignInWithGoogleRequested(
    SignInWithGoogleRequested event,
    Emitter<AuthState> emit,
  ) async {
    try {
      emit(const AuthState.loading());

      final result = await _authRepository.signInWithGoogle();

      result.fold(
        (error) {
          AppLogger.error('Google sign in failed: $error');
          emit(AuthState.error(message: error));
        },
        (profile) {
          AppLogger.info('Google sign in successful: ${profile.email}');
          emit(AuthState.authenticated(user: profile));
        },
      );
    } catch (e) {
      AppLogger.error('Google sign in error', error: e);
      emit(AuthState.error(message: 'An unexpected error occurred'));
    }
  }

  Future<void> _onSignOutRequested(
    SignOutRequested event,
    Emitter<AuthState> emit,
  ) async {
    try {
      emit(const AuthState.loading());

      final result = await _authRepository.signOut();

      result.fold(
        (error) {
          AppLogger.error('Sign out failed: $error');
          emit(AuthState.error(message: error));
        },
        (_) {
          AppLogger.info('Sign out successful');
          emit(const AuthState.unauthenticated());
        },
      );
    } catch (e) {
      AppLogger.error('Sign out error', error: e);
      emit(AuthState.error(message: 'An unexpected error occurred'));
    }
  }

  Future<void> _onResetPasswordRequested(
    ResetPasswordRequested event,
    Emitter<AuthState> emit,
  ) async {
    try {
      emit(const AuthState.loading());

      final result = await _authRepository.resetPassword(email: event.email);

      result.fold(
        (error) {
          AppLogger.error('Password reset failed: $error');
          emit(AuthState.error(message: error));
        },
        (_) {
          AppLogger.info('Password reset email sent to: ${event.email}');
          emit(AuthState.passwordResetSent(email: event.email));
        },
      );
    } catch (e) {
      AppLogger.error('Password reset error', error: e);
      emit(AuthState.error(message: 'An unexpected error occurred'));
    }
  }

  Future<void> _onUpdateProfileRequested(
    UpdateProfileRequested event,
    Emitter<AuthState> emit,
  ) async {
    try {
      final currentState = state;
      if (currentState is! AuthAuthenticated) {
        emit(const AuthState.error(message: 'No user logged in'));
        return;
      }

      emit(const AuthState.loading());

      final updatedProfile = currentState.user.copyWith(
        name: event.name,
        profilePicture: event.profilePicture ?? currentState.user.profilePicture,
        currency: event.currency ?? currentState.user.currency,
      );

      final result = await _authRepository.updateUserProfile(
        profile: updatedProfile,
      );

      result.fold(
        (error) {
          AppLogger.error('Profile update failed: $error');
          emit(AuthState.error(message: error));
        },
        (profile) {
          AppLogger.info('Profile updated successfully');
          emit(AuthState.authenticated(user: profile));
        },
      );
    } catch (e) {
      AppLogger.error('Profile update error', error: e);
      emit(AuthState.error(message: 'An unexpected error occurred'));
    }
  }

  @override
  Future<void> close() {
    _authStateSubscription?.cancel();
    return super.close();
  }
}
