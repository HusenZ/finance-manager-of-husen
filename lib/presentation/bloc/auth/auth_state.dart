import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../data/models/user_profile.dart';

part 'auth_state.freezed.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState.initial() = AuthInitial;

  const factory AuthState.loading() = AuthLoading;

  const factory AuthState.authenticated({required UserProfile user}) =
      AuthAuthenticated;

  const factory AuthState.unauthenticated() = AuthUnauthenticated;

  const factory AuthState.error({required String message}) = AuthError;

  const factory AuthState.passwordResetSent({required String email}) =
      AuthPasswordResetSent;
}
