import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_event.freezed.dart';

@freezed
class AuthEvent with _$AuthEvent {
  const factory AuthEvent.signUpRequested({
    required String email,
    required String password,
    required String name,
  }) = SignUpRequested;

  const factory AuthEvent.signInRequested({
    required String email,
    required String password,
  }) = SignInRequested;

  const factory AuthEvent.signInWithGoogleRequested() = SignInWithGoogleRequested;

  const factory AuthEvent.signOutRequested() = SignOutRequested;

  const factory AuthEvent.resetPasswordRequested({
    required String email,
  }) = ResetPasswordRequested;

  const factory AuthEvent.updateProfileRequested({
    required String name,
    String? profilePicture,
    String? currency,
  }) = UpdateProfileRequested;

  const factory AuthEvent.authStateChanged() = AuthStateChanged;
}
