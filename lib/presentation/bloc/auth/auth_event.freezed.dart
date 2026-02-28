// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$AuthEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String email, String password, String name)
    signUpRequested,
    required TResult Function(String email, String password) signInRequested,
    required TResult Function() signInWithGoogleRequested,
    required TResult Function() signOutRequested,
    required TResult Function(String email) resetPasswordRequested,
    required TResult Function(
      String name,
      String? profilePicture,
      String? currency,
    )
    updateProfileRequested,
    required TResult Function() authStateChanged,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String email, String password, String name)?
    signUpRequested,
    TResult? Function(String email, String password)? signInRequested,
    TResult? Function()? signInWithGoogleRequested,
    TResult? Function()? signOutRequested,
    TResult? Function(String email)? resetPasswordRequested,
    TResult? Function(String name, String? profilePicture, String? currency)?
    updateProfileRequested,
    TResult? Function()? authStateChanged,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email, String password, String name)?
    signUpRequested,
    TResult Function(String email, String password)? signInRequested,
    TResult Function()? signInWithGoogleRequested,
    TResult Function()? signOutRequested,
    TResult Function(String email)? resetPasswordRequested,
    TResult Function(String name, String? profilePicture, String? currency)?
    updateProfileRequested,
    TResult Function()? authStateChanged,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SignUpRequested value) signUpRequested,
    required TResult Function(SignInRequested value) signInRequested,
    required TResult Function(SignInWithGoogleRequested value)
    signInWithGoogleRequested,
    required TResult Function(SignOutRequested value) signOutRequested,
    required TResult Function(ResetPasswordRequested value)
    resetPasswordRequested,
    required TResult Function(UpdateProfileRequested value)
    updateProfileRequested,
    required TResult Function(AuthStateChanged value) authStateChanged,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SignUpRequested value)? signUpRequested,
    TResult? Function(SignInRequested value)? signInRequested,
    TResult? Function(SignInWithGoogleRequested value)?
    signInWithGoogleRequested,
    TResult? Function(SignOutRequested value)? signOutRequested,
    TResult? Function(ResetPasswordRequested value)? resetPasswordRequested,
    TResult? Function(UpdateProfileRequested value)? updateProfileRequested,
    TResult? Function(AuthStateChanged value)? authStateChanged,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SignUpRequested value)? signUpRequested,
    TResult Function(SignInRequested value)? signInRequested,
    TResult Function(SignInWithGoogleRequested value)?
    signInWithGoogleRequested,
    TResult Function(SignOutRequested value)? signOutRequested,
    TResult Function(ResetPasswordRequested value)? resetPasswordRequested,
    TResult Function(UpdateProfileRequested value)? updateProfileRequested,
    TResult Function(AuthStateChanged value)? authStateChanged,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthEventCopyWith<$Res> {
  factory $AuthEventCopyWith(AuthEvent value, $Res Function(AuthEvent) then) =
      _$AuthEventCopyWithImpl<$Res, AuthEvent>;
}

/// @nodoc
class _$AuthEventCopyWithImpl<$Res, $Val extends AuthEvent>
    implements $AuthEventCopyWith<$Res> {
  _$AuthEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$SignUpRequestedImplCopyWith<$Res> {
  factory _$$SignUpRequestedImplCopyWith(
    _$SignUpRequestedImpl value,
    $Res Function(_$SignUpRequestedImpl) then,
  ) = __$$SignUpRequestedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String email, String password, String name});
}

/// @nodoc
class __$$SignUpRequestedImplCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$SignUpRequestedImpl>
    implements _$$SignUpRequestedImplCopyWith<$Res> {
  __$$SignUpRequestedImplCopyWithImpl(
    _$SignUpRequestedImpl _value,
    $Res Function(_$SignUpRequestedImpl) _then,
  ) : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? password = null,
    Object? name = null,
  }) {
    return _then(
      _$SignUpRequestedImpl(
        email: null == email
            ? _value.email
            : email // ignore: cast_nullable_to_non_nullable
                  as String,
        password: null == password
            ? _value.password
            : password // ignore: cast_nullable_to_non_nullable
                  as String,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$SignUpRequestedImpl implements SignUpRequested {
  const _$SignUpRequestedImpl({
    required this.email,
    required this.password,
    required this.name,
  });

  @override
  final String email;
  @override
  final String password;
  @override
  final String name;

  @override
  String toString() {
    return 'AuthEvent.signUpRequested(email: $email, password: $password, name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SignUpRequestedImpl &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.name, name) || other.name == name));
  }

  @override
  int get hashCode => Object.hash(runtimeType, email, password, name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SignUpRequestedImplCopyWith<_$SignUpRequestedImpl> get copyWith =>
      __$$SignUpRequestedImplCopyWithImpl<_$SignUpRequestedImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String email, String password, String name)
    signUpRequested,
    required TResult Function(String email, String password) signInRequested,
    required TResult Function() signInWithGoogleRequested,
    required TResult Function() signOutRequested,
    required TResult Function(String email) resetPasswordRequested,
    required TResult Function(
      String name,
      String? profilePicture,
      String? currency,
    )
    updateProfileRequested,
    required TResult Function() authStateChanged,
  }) {
    return signUpRequested(email, password, name);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String email, String password, String name)?
    signUpRequested,
    TResult? Function(String email, String password)? signInRequested,
    TResult? Function()? signInWithGoogleRequested,
    TResult? Function()? signOutRequested,
    TResult? Function(String email)? resetPasswordRequested,
    TResult? Function(String name, String? profilePicture, String? currency)?
    updateProfileRequested,
    TResult? Function()? authStateChanged,
  }) {
    return signUpRequested?.call(email, password, name);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email, String password, String name)?
    signUpRequested,
    TResult Function(String email, String password)? signInRequested,
    TResult Function()? signInWithGoogleRequested,
    TResult Function()? signOutRequested,
    TResult Function(String email)? resetPasswordRequested,
    TResult Function(String name, String? profilePicture, String? currency)?
    updateProfileRequested,
    TResult Function()? authStateChanged,
    required TResult orElse(),
  }) {
    if (signUpRequested != null) {
      return signUpRequested(email, password, name);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SignUpRequested value) signUpRequested,
    required TResult Function(SignInRequested value) signInRequested,
    required TResult Function(SignInWithGoogleRequested value)
    signInWithGoogleRequested,
    required TResult Function(SignOutRequested value) signOutRequested,
    required TResult Function(ResetPasswordRequested value)
    resetPasswordRequested,
    required TResult Function(UpdateProfileRequested value)
    updateProfileRequested,
    required TResult Function(AuthStateChanged value) authStateChanged,
  }) {
    return signUpRequested(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SignUpRequested value)? signUpRequested,
    TResult? Function(SignInRequested value)? signInRequested,
    TResult? Function(SignInWithGoogleRequested value)?
    signInWithGoogleRequested,
    TResult? Function(SignOutRequested value)? signOutRequested,
    TResult? Function(ResetPasswordRequested value)? resetPasswordRequested,
    TResult? Function(UpdateProfileRequested value)? updateProfileRequested,
    TResult? Function(AuthStateChanged value)? authStateChanged,
  }) {
    return signUpRequested?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SignUpRequested value)? signUpRequested,
    TResult Function(SignInRequested value)? signInRequested,
    TResult Function(SignInWithGoogleRequested value)?
    signInWithGoogleRequested,
    TResult Function(SignOutRequested value)? signOutRequested,
    TResult Function(ResetPasswordRequested value)? resetPasswordRequested,
    TResult Function(UpdateProfileRequested value)? updateProfileRequested,
    TResult Function(AuthStateChanged value)? authStateChanged,
    required TResult orElse(),
  }) {
    if (signUpRequested != null) {
      return signUpRequested(this);
    }
    return orElse();
  }
}

abstract class SignUpRequested implements AuthEvent {
  const factory SignUpRequested({
    required final String email,
    required final String password,
    required final String name,
  }) = _$SignUpRequestedImpl;

  String get email;
  String get password;
  String get name;
  @JsonKey(ignore: true)
  _$$SignUpRequestedImplCopyWith<_$SignUpRequestedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SignInRequestedImplCopyWith<$Res> {
  factory _$$SignInRequestedImplCopyWith(
    _$SignInRequestedImpl value,
    $Res Function(_$SignInRequestedImpl) then,
  ) = __$$SignInRequestedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String email, String password});
}

/// @nodoc
class __$$SignInRequestedImplCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$SignInRequestedImpl>
    implements _$$SignInRequestedImplCopyWith<$Res> {
  __$$SignInRequestedImplCopyWithImpl(
    _$SignInRequestedImpl _value,
    $Res Function(_$SignInRequestedImpl) _then,
  ) : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? email = null, Object? password = null}) {
    return _then(
      _$SignInRequestedImpl(
        email: null == email
            ? _value.email
            : email // ignore: cast_nullable_to_non_nullable
                  as String,
        password: null == password
            ? _value.password
            : password // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$SignInRequestedImpl implements SignInRequested {
  const _$SignInRequestedImpl({required this.email, required this.password});

  @override
  final String email;
  @override
  final String password;

  @override
  String toString() {
    return 'AuthEvent.signInRequested(email: $email, password: $password)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SignInRequestedImpl &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @override
  int get hashCode => Object.hash(runtimeType, email, password);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SignInRequestedImplCopyWith<_$SignInRequestedImpl> get copyWith =>
      __$$SignInRequestedImplCopyWithImpl<_$SignInRequestedImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String email, String password, String name)
    signUpRequested,
    required TResult Function(String email, String password) signInRequested,
    required TResult Function() signInWithGoogleRequested,
    required TResult Function() signOutRequested,
    required TResult Function(String email) resetPasswordRequested,
    required TResult Function(
      String name,
      String? profilePicture,
      String? currency,
    )
    updateProfileRequested,
    required TResult Function() authStateChanged,
  }) {
    return signInRequested(email, password);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String email, String password, String name)?
    signUpRequested,
    TResult? Function(String email, String password)? signInRequested,
    TResult? Function()? signInWithGoogleRequested,
    TResult? Function()? signOutRequested,
    TResult? Function(String email)? resetPasswordRequested,
    TResult? Function(String name, String? profilePicture, String? currency)?
    updateProfileRequested,
    TResult? Function()? authStateChanged,
  }) {
    return signInRequested?.call(email, password);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email, String password, String name)?
    signUpRequested,
    TResult Function(String email, String password)? signInRequested,
    TResult Function()? signInWithGoogleRequested,
    TResult Function()? signOutRequested,
    TResult Function(String email)? resetPasswordRequested,
    TResult Function(String name, String? profilePicture, String? currency)?
    updateProfileRequested,
    TResult Function()? authStateChanged,
    required TResult orElse(),
  }) {
    if (signInRequested != null) {
      return signInRequested(email, password);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SignUpRequested value) signUpRequested,
    required TResult Function(SignInRequested value) signInRequested,
    required TResult Function(SignInWithGoogleRequested value)
    signInWithGoogleRequested,
    required TResult Function(SignOutRequested value) signOutRequested,
    required TResult Function(ResetPasswordRequested value)
    resetPasswordRequested,
    required TResult Function(UpdateProfileRequested value)
    updateProfileRequested,
    required TResult Function(AuthStateChanged value) authStateChanged,
  }) {
    return signInRequested(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SignUpRequested value)? signUpRequested,
    TResult? Function(SignInRequested value)? signInRequested,
    TResult? Function(SignInWithGoogleRequested value)?
    signInWithGoogleRequested,
    TResult? Function(SignOutRequested value)? signOutRequested,
    TResult? Function(ResetPasswordRequested value)? resetPasswordRequested,
    TResult? Function(UpdateProfileRequested value)? updateProfileRequested,
    TResult? Function(AuthStateChanged value)? authStateChanged,
  }) {
    return signInRequested?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SignUpRequested value)? signUpRequested,
    TResult Function(SignInRequested value)? signInRequested,
    TResult Function(SignInWithGoogleRequested value)?
    signInWithGoogleRequested,
    TResult Function(SignOutRequested value)? signOutRequested,
    TResult Function(ResetPasswordRequested value)? resetPasswordRequested,
    TResult Function(UpdateProfileRequested value)? updateProfileRequested,
    TResult Function(AuthStateChanged value)? authStateChanged,
    required TResult orElse(),
  }) {
    if (signInRequested != null) {
      return signInRequested(this);
    }
    return orElse();
  }
}

abstract class SignInRequested implements AuthEvent {
  const factory SignInRequested({
    required final String email,
    required final String password,
  }) = _$SignInRequestedImpl;

  String get email;
  String get password;
  @JsonKey(ignore: true)
  _$$SignInRequestedImplCopyWith<_$SignInRequestedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SignInWithGoogleRequestedImplCopyWith<$Res> {
  factory _$$SignInWithGoogleRequestedImplCopyWith(
    _$SignInWithGoogleRequestedImpl value,
    $Res Function(_$SignInWithGoogleRequestedImpl) then,
  ) = __$$SignInWithGoogleRequestedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SignInWithGoogleRequestedImplCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$SignInWithGoogleRequestedImpl>
    implements _$$SignInWithGoogleRequestedImplCopyWith<$Res> {
  __$$SignInWithGoogleRequestedImplCopyWithImpl(
    _$SignInWithGoogleRequestedImpl _value,
    $Res Function(_$SignInWithGoogleRequestedImpl) _then,
  ) : super(_value, _then);
}

/// @nodoc

class _$SignInWithGoogleRequestedImpl implements SignInWithGoogleRequested {
  const _$SignInWithGoogleRequestedImpl();

  @override
  String toString() {
    return 'AuthEvent.signInWithGoogleRequested()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SignInWithGoogleRequestedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String email, String password, String name)
    signUpRequested,
    required TResult Function(String email, String password) signInRequested,
    required TResult Function() signInWithGoogleRequested,
    required TResult Function() signOutRequested,
    required TResult Function(String email) resetPasswordRequested,
    required TResult Function(
      String name,
      String? profilePicture,
      String? currency,
    )
    updateProfileRequested,
    required TResult Function() authStateChanged,
  }) {
    return signInWithGoogleRequested();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String email, String password, String name)?
    signUpRequested,
    TResult? Function(String email, String password)? signInRequested,
    TResult? Function()? signInWithGoogleRequested,
    TResult? Function()? signOutRequested,
    TResult? Function(String email)? resetPasswordRequested,
    TResult? Function(String name, String? profilePicture, String? currency)?
    updateProfileRequested,
    TResult? Function()? authStateChanged,
  }) {
    return signInWithGoogleRequested?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email, String password, String name)?
    signUpRequested,
    TResult Function(String email, String password)? signInRequested,
    TResult Function()? signInWithGoogleRequested,
    TResult Function()? signOutRequested,
    TResult Function(String email)? resetPasswordRequested,
    TResult Function(String name, String? profilePicture, String? currency)?
    updateProfileRequested,
    TResult Function()? authStateChanged,
    required TResult orElse(),
  }) {
    if (signInWithGoogleRequested != null) {
      return signInWithGoogleRequested();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SignUpRequested value) signUpRequested,
    required TResult Function(SignInRequested value) signInRequested,
    required TResult Function(SignInWithGoogleRequested value)
    signInWithGoogleRequested,
    required TResult Function(SignOutRequested value) signOutRequested,
    required TResult Function(ResetPasswordRequested value)
    resetPasswordRequested,
    required TResult Function(UpdateProfileRequested value)
    updateProfileRequested,
    required TResult Function(AuthStateChanged value) authStateChanged,
  }) {
    return signInWithGoogleRequested(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SignUpRequested value)? signUpRequested,
    TResult? Function(SignInRequested value)? signInRequested,
    TResult? Function(SignInWithGoogleRequested value)?
    signInWithGoogleRequested,
    TResult? Function(SignOutRequested value)? signOutRequested,
    TResult? Function(ResetPasswordRequested value)? resetPasswordRequested,
    TResult? Function(UpdateProfileRequested value)? updateProfileRequested,
    TResult? Function(AuthStateChanged value)? authStateChanged,
  }) {
    return signInWithGoogleRequested?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SignUpRequested value)? signUpRequested,
    TResult Function(SignInRequested value)? signInRequested,
    TResult Function(SignInWithGoogleRequested value)?
    signInWithGoogleRequested,
    TResult Function(SignOutRequested value)? signOutRequested,
    TResult Function(ResetPasswordRequested value)? resetPasswordRequested,
    TResult Function(UpdateProfileRequested value)? updateProfileRequested,
    TResult Function(AuthStateChanged value)? authStateChanged,
    required TResult orElse(),
  }) {
    if (signInWithGoogleRequested != null) {
      return signInWithGoogleRequested(this);
    }
    return orElse();
  }
}

abstract class SignInWithGoogleRequested implements AuthEvent {
  const factory SignInWithGoogleRequested() = _$SignInWithGoogleRequestedImpl;
}

/// @nodoc
abstract class _$$SignOutRequestedImplCopyWith<$Res> {
  factory _$$SignOutRequestedImplCopyWith(
    _$SignOutRequestedImpl value,
    $Res Function(_$SignOutRequestedImpl) then,
  ) = __$$SignOutRequestedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SignOutRequestedImplCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$SignOutRequestedImpl>
    implements _$$SignOutRequestedImplCopyWith<$Res> {
  __$$SignOutRequestedImplCopyWithImpl(
    _$SignOutRequestedImpl _value,
    $Res Function(_$SignOutRequestedImpl) _then,
  ) : super(_value, _then);
}

/// @nodoc

class _$SignOutRequestedImpl implements SignOutRequested {
  const _$SignOutRequestedImpl();

  @override
  String toString() {
    return 'AuthEvent.signOutRequested()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SignOutRequestedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String email, String password, String name)
    signUpRequested,
    required TResult Function(String email, String password) signInRequested,
    required TResult Function() signInWithGoogleRequested,
    required TResult Function() signOutRequested,
    required TResult Function(String email) resetPasswordRequested,
    required TResult Function(
      String name,
      String? profilePicture,
      String? currency,
    )
    updateProfileRequested,
    required TResult Function() authStateChanged,
  }) {
    return signOutRequested();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String email, String password, String name)?
    signUpRequested,
    TResult? Function(String email, String password)? signInRequested,
    TResult? Function()? signInWithGoogleRequested,
    TResult? Function()? signOutRequested,
    TResult? Function(String email)? resetPasswordRequested,
    TResult? Function(String name, String? profilePicture, String? currency)?
    updateProfileRequested,
    TResult? Function()? authStateChanged,
  }) {
    return signOutRequested?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email, String password, String name)?
    signUpRequested,
    TResult Function(String email, String password)? signInRequested,
    TResult Function()? signInWithGoogleRequested,
    TResult Function()? signOutRequested,
    TResult Function(String email)? resetPasswordRequested,
    TResult Function(String name, String? profilePicture, String? currency)?
    updateProfileRequested,
    TResult Function()? authStateChanged,
    required TResult orElse(),
  }) {
    if (signOutRequested != null) {
      return signOutRequested();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SignUpRequested value) signUpRequested,
    required TResult Function(SignInRequested value) signInRequested,
    required TResult Function(SignInWithGoogleRequested value)
    signInWithGoogleRequested,
    required TResult Function(SignOutRequested value) signOutRequested,
    required TResult Function(ResetPasswordRequested value)
    resetPasswordRequested,
    required TResult Function(UpdateProfileRequested value)
    updateProfileRequested,
    required TResult Function(AuthStateChanged value) authStateChanged,
  }) {
    return signOutRequested(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SignUpRequested value)? signUpRequested,
    TResult? Function(SignInRequested value)? signInRequested,
    TResult? Function(SignInWithGoogleRequested value)?
    signInWithGoogleRequested,
    TResult? Function(SignOutRequested value)? signOutRequested,
    TResult? Function(ResetPasswordRequested value)? resetPasswordRequested,
    TResult? Function(UpdateProfileRequested value)? updateProfileRequested,
    TResult? Function(AuthStateChanged value)? authStateChanged,
  }) {
    return signOutRequested?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SignUpRequested value)? signUpRequested,
    TResult Function(SignInRequested value)? signInRequested,
    TResult Function(SignInWithGoogleRequested value)?
    signInWithGoogleRequested,
    TResult Function(SignOutRequested value)? signOutRequested,
    TResult Function(ResetPasswordRequested value)? resetPasswordRequested,
    TResult Function(UpdateProfileRequested value)? updateProfileRequested,
    TResult Function(AuthStateChanged value)? authStateChanged,
    required TResult orElse(),
  }) {
    if (signOutRequested != null) {
      return signOutRequested(this);
    }
    return orElse();
  }
}

abstract class SignOutRequested implements AuthEvent {
  const factory SignOutRequested() = _$SignOutRequestedImpl;
}

/// @nodoc
abstract class _$$ResetPasswordRequestedImplCopyWith<$Res> {
  factory _$$ResetPasswordRequestedImplCopyWith(
    _$ResetPasswordRequestedImpl value,
    $Res Function(_$ResetPasswordRequestedImpl) then,
  ) = __$$ResetPasswordRequestedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String email});
}

/// @nodoc
class __$$ResetPasswordRequestedImplCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$ResetPasswordRequestedImpl>
    implements _$$ResetPasswordRequestedImplCopyWith<$Res> {
  __$$ResetPasswordRequestedImplCopyWithImpl(
    _$ResetPasswordRequestedImpl _value,
    $Res Function(_$ResetPasswordRequestedImpl) _then,
  ) : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? email = null}) {
    return _then(
      _$ResetPasswordRequestedImpl(
        email: null == email
            ? _value.email
            : email // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$ResetPasswordRequestedImpl implements ResetPasswordRequested {
  const _$ResetPasswordRequestedImpl({required this.email});

  @override
  final String email;

  @override
  String toString() {
    return 'AuthEvent.resetPasswordRequested(email: $email)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResetPasswordRequestedImpl &&
            (identical(other.email, email) || other.email == email));
  }

  @override
  int get hashCode => Object.hash(runtimeType, email);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ResetPasswordRequestedImplCopyWith<_$ResetPasswordRequestedImpl>
  get copyWith =>
      __$$ResetPasswordRequestedImplCopyWithImpl<_$ResetPasswordRequestedImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String email, String password, String name)
    signUpRequested,
    required TResult Function(String email, String password) signInRequested,
    required TResult Function() signInWithGoogleRequested,
    required TResult Function() signOutRequested,
    required TResult Function(String email) resetPasswordRequested,
    required TResult Function(
      String name,
      String? profilePicture,
      String? currency,
    )
    updateProfileRequested,
    required TResult Function() authStateChanged,
  }) {
    return resetPasswordRequested(email);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String email, String password, String name)?
    signUpRequested,
    TResult? Function(String email, String password)? signInRequested,
    TResult? Function()? signInWithGoogleRequested,
    TResult? Function()? signOutRequested,
    TResult? Function(String email)? resetPasswordRequested,
    TResult? Function(String name, String? profilePicture, String? currency)?
    updateProfileRequested,
    TResult? Function()? authStateChanged,
  }) {
    return resetPasswordRequested?.call(email);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email, String password, String name)?
    signUpRequested,
    TResult Function(String email, String password)? signInRequested,
    TResult Function()? signInWithGoogleRequested,
    TResult Function()? signOutRequested,
    TResult Function(String email)? resetPasswordRequested,
    TResult Function(String name, String? profilePicture, String? currency)?
    updateProfileRequested,
    TResult Function()? authStateChanged,
    required TResult orElse(),
  }) {
    if (resetPasswordRequested != null) {
      return resetPasswordRequested(email);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SignUpRequested value) signUpRequested,
    required TResult Function(SignInRequested value) signInRequested,
    required TResult Function(SignInWithGoogleRequested value)
    signInWithGoogleRequested,
    required TResult Function(SignOutRequested value) signOutRequested,
    required TResult Function(ResetPasswordRequested value)
    resetPasswordRequested,
    required TResult Function(UpdateProfileRequested value)
    updateProfileRequested,
    required TResult Function(AuthStateChanged value) authStateChanged,
  }) {
    return resetPasswordRequested(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SignUpRequested value)? signUpRequested,
    TResult? Function(SignInRequested value)? signInRequested,
    TResult? Function(SignInWithGoogleRequested value)?
    signInWithGoogleRequested,
    TResult? Function(SignOutRequested value)? signOutRequested,
    TResult? Function(ResetPasswordRequested value)? resetPasswordRequested,
    TResult? Function(UpdateProfileRequested value)? updateProfileRequested,
    TResult? Function(AuthStateChanged value)? authStateChanged,
  }) {
    return resetPasswordRequested?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SignUpRequested value)? signUpRequested,
    TResult Function(SignInRequested value)? signInRequested,
    TResult Function(SignInWithGoogleRequested value)?
    signInWithGoogleRequested,
    TResult Function(SignOutRequested value)? signOutRequested,
    TResult Function(ResetPasswordRequested value)? resetPasswordRequested,
    TResult Function(UpdateProfileRequested value)? updateProfileRequested,
    TResult Function(AuthStateChanged value)? authStateChanged,
    required TResult orElse(),
  }) {
    if (resetPasswordRequested != null) {
      return resetPasswordRequested(this);
    }
    return orElse();
  }
}

abstract class ResetPasswordRequested implements AuthEvent {
  const factory ResetPasswordRequested({required final String email}) =
      _$ResetPasswordRequestedImpl;

  String get email;
  @JsonKey(ignore: true)
  _$$ResetPasswordRequestedImplCopyWith<_$ResetPasswordRequestedImpl>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UpdateProfileRequestedImplCopyWith<$Res> {
  factory _$$UpdateProfileRequestedImplCopyWith(
    _$UpdateProfileRequestedImpl value,
    $Res Function(_$UpdateProfileRequestedImpl) then,
  ) = __$$UpdateProfileRequestedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String name, String? profilePicture, String? currency});
}

/// @nodoc
class __$$UpdateProfileRequestedImplCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$UpdateProfileRequestedImpl>
    implements _$$UpdateProfileRequestedImplCopyWith<$Res> {
  __$$UpdateProfileRequestedImplCopyWithImpl(
    _$UpdateProfileRequestedImpl _value,
    $Res Function(_$UpdateProfileRequestedImpl) _then,
  ) : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? profilePicture = freezed,
    Object? currency = freezed,
  }) {
    return _then(
      _$UpdateProfileRequestedImpl(
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        profilePicture: freezed == profilePicture
            ? _value.profilePicture
            : profilePicture // ignore: cast_nullable_to_non_nullable
                  as String?,
        currency: freezed == currency
            ? _value.currency
            : currency // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc

class _$UpdateProfileRequestedImpl implements UpdateProfileRequested {
  const _$UpdateProfileRequestedImpl({
    required this.name,
    this.profilePicture,
    this.currency,
  });

  @override
  final String name;
  @override
  final String? profilePicture;
  @override
  final String? currency;

  @override
  String toString() {
    return 'AuthEvent.updateProfileRequested(name: $name, profilePicture: $profilePicture, currency: $currency)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateProfileRequestedImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.profilePicture, profilePicture) ||
                other.profilePicture == profilePicture) &&
            (identical(other.currency, currency) ||
                other.currency == currency));
  }

  @override
  int get hashCode => Object.hash(runtimeType, name, profilePicture, currency);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateProfileRequestedImplCopyWith<_$UpdateProfileRequestedImpl>
  get copyWith =>
      __$$UpdateProfileRequestedImplCopyWithImpl<_$UpdateProfileRequestedImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String email, String password, String name)
    signUpRequested,
    required TResult Function(String email, String password) signInRequested,
    required TResult Function() signInWithGoogleRequested,
    required TResult Function() signOutRequested,
    required TResult Function(String email) resetPasswordRequested,
    required TResult Function(
      String name,
      String? profilePicture,
      String? currency,
    )
    updateProfileRequested,
    required TResult Function() authStateChanged,
  }) {
    return updateProfileRequested(name, profilePicture, currency);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String email, String password, String name)?
    signUpRequested,
    TResult? Function(String email, String password)? signInRequested,
    TResult? Function()? signInWithGoogleRequested,
    TResult? Function()? signOutRequested,
    TResult? Function(String email)? resetPasswordRequested,
    TResult? Function(String name, String? profilePicture, String? currency)?
    updateProfileRequested,
    TResult? Function()? authStateChanged,
  }) {
    return updateProfileRequested?.call(name, profilePicture, currency);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email, String password, String name)?
    signUpRequested,
    TResult Function(String email, String password)? signInRequested,
    TResult Function()? signInWithGoogleRequested,
    TResult Function()? signOutRequested,
    TResult Function(String email)? resetPasswordRequested,
    TResult Function(String name, String? profilePicture, String? currency)?
    updateProfileRequested,
    TResult Function()? authStateChanged,
    required TResult orElse(),
  }) {
    if (updateProfileRequested != null) {
      return updateProfileRequested(name, profilePicture, currency);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SignUpRequested value) signUpRequested,
    required TResult Function(SignInRequested value) signInRequested,
    required TResult Function(SignInWithGoogleRequested value)
    signInWithGoogleRequested,
    required TResult Function(SignOutRequested value) signOutRequested,
    required TResult Function(ResetPasswordRequested value)
    resetPasswordRequested,
    required TResult Function(UpdateProfileRequested value)
    updateProfileRequested,
    required TResult Function(AuthStateChanged value) authStateChanged,
  }) {
    return updateProfileRequested(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SignUpRequested value)? signUpRequested,
    TResult? Function(SignInRequested value)? signInRequested,
    TResult? Function(SignInWithGoogleRequested value)?
    signInWithGoogleRequested,
    TResult? Function(SignOutRequested value)? signOutRequested,
    TResult? Function(ResetPasswordRequested value)? resetPasswordRequested,
    TResult? Function(UpdateProfileRequested value)? updateProfileRequested,
    TResult? Function(AuthStateChanged value)? authStateChanged,
  }) {
    return updateProfileRequested?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SignUpRequested value)? signUpRequested,
    TResult Function(SignInRequested value)? signInRequested,
    TResult Function(SignInWithGoogleRequested value)?
    signInWithGoogleRequested,
    TResult Function(SignOutRequested value)? signOutRequested,
    TResult Function(ResetPasswordRequested value)? resetPasswordRequested,
    TResult Function(UpdateProfileRequested value)? updateProfileRequested,
    TResult Function(AuthStateChanged value)? authStateChanged,
    required TResult orElse(),
  }) {
    if (updateProfileRequested != null) {
      return updateProfileRequested(this);
    }
    return orElse();
  }
}

abstract class UpdateProfileRequested implements AuthEvent {
  const factory UpdateProfileRequested({
    required final String name,
    final String? profilePicture,
    final String? currency,
  }) = _$UpdateProfileRequestedImpl;

  String get name;
  String? get profilePicture;
  String? get currency;
  @JsonKey(ignore: true)
  _$$UpdateProfileRequestedImplCopyWith<_$UpdateProfileRequestedImpl>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AuthStateChangedImplCopyWith<$Res> {
  factory _$$AuthStateChangedImplCopyWith(
    _$AuthStateChangedImpl value,
    $Res Function(_$AuthStateChangedImpl) then,
  ) = __$$AuthStateChangedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AuthStateChangedImplCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$AuthStateChangedImpl>
    implements _$$AuthStateChangedImplCopyWith<$Res> {
  __$$AuthStateChangedImplCopyWithImpl(
    _$AuthStateChangedImpl _value,
    $Res Function(_$AuthStateChangedImpl) _then,
  ) : super(_value, _then);
}

/// @nodoc

class _$AuthStateChangedImpl implements AuthStateChanged {
  const _$AuthStateChangedImpl();

  @override
  String toString() {
    return 'AuthEvent.authStateChanged()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$AuthStateChangedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String email, String password, String name)
    signUpRequested,
    required TResult Function(String email, String password) signInRequested,
    required TResult Function() signInWithGoogleRequested,
    required TResult Function() signOutRequested,
    required TResult Function(String email) resetPasswordRequested,
    required TResult Function(
      String name,
      String? profilePicture,
      String? currency,
    )
    updateProfileRequested,
    required TResult Function() authStateChanged,
  }) {
    return authStateChanged();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String email, String password, String name)?
    signUpRequested,
    TResult? Function(String email, String password)? signInRequested,
    TResult? Function()? signInWithGoogleRequested,
    TResult? Function()? signOutRequested,
    TResult? Function(String email)? resetPasswordRequested,
    TResult? Function(String name, String? profilePicture, String? currency)?
    updateProfileRequested,
    TResult? Function()? authStateChanged,
  }) {
    return authStateChanged?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email, String password, String name)?
    signUpRequested,
    TResult Function(String email, String password)? signInRequested,
    TResult Function()? signInWithGoogleRequested,
    TResult Function()? signOutRequested,
    TResult Function(String email)? resetPasswordRequested,
    TResult Function(String name, String? profilePicture, String? currency)?
    updateProfileRequested,
    TResult Function()? authStateChanged,
    required TResult orElse(),
  }) {
    if (authStateChanged != null) {
      return authStateChanged();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SignUpRequested value) signUpRequested,
    required TResult Function(SignInRequested value) signInRequested,
    required TResult Function(SignInWithGoogleRequested value)
    signInWithGoogleRequested,
    required TResult Function(SignOutRequested value) signOutRequested,
    required TResult Function(ResetPasswordRequested value)
    resetPasswordRequested,
    required TResult Function(UpdateProfileRequested value)
    updateProfileRequested,
    required TResult Function(AuthStateChanged value) authStateChanged,
  }) {
    return authStateChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SignUpRequested value)? signUpRequested,
    TResult? Function(SignInRequested value)? signInRequested,
    TResult? Function(SignInWithGoogleRequested value)?
    signInWithGoogleRequested,
    TResult? Function(SignOutRequested value)? signOutRequested,
    TResult? Function(ResetPasswordRequested value)? resetPasswordRequested,
    TResult? Function(UpdateProfileRequested value)? updateProfileRequested,
    TResult? Function(AuthStateChanged value)? authStateChanged,
  }) {
    return authStateChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SignUpRequested value)? signUpRequested,
    TResult Function(SignInRequested value)? signInRequested,
    TResult Function(SignInWithGoogleRequested value)?
    signInWithGoogleRequested,
    TResult Function(SignOutRequested value)? signOutRequested,
    TResult Function(ResetPasswordRequested value)? resetPasswordRequested,
    TResult Function(UpdateProfileRequested value)? updateProfileRequested,
    TResult Function(AuthStateChanged value)? authStateChanged,
    required TResult orElse(),
  }) {
    if (authStateChanged != null) {
      return authStateChanged(this);
    }
    return orElse();
  }
}

abstract class AuthStateChanged implements AuthEvent {
  const factory AuthStateChanged() = _$AuthStateChangedImpl;
}
