// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transaction_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$TransactionState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Transaction> transactions) loaded,
    required TResult Function(String message) error,
    required TResult Function(String message) success,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Transaction> transactions)? loaded,
    TResult? Function(String message)? error,
    TResult? Function(String message)? success,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Transaction> transactions)? loaded,
    TResult Function(String message)? error,
    TResult Function(String message)? success,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TransactionInitial value) initial,
    required TResult Function(TransactionLoading value) loading,
    required TResult Function(TransactionLoaded value) loaded,
    required TResult Function(TransactionError value) error,
    required TResult Function(TransactionSuccess value) success,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TransactionInitial value)? initial,
    TResult? Function(TransactionLoading value)? loading,
    TResult? Function(TransactionLoaded value)? loaded,
    TResult? Function(TransactionError value)? error,
    TResult? Function(TransactionSuccess value)? success,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TransactionInitial value)? initial,
    TResult Function(TransactionLoading value)? loading,
    TResult Function(TransactionLoaded value)? loaded,
    TResult Function(TransactionError value)? error,
    TResult Function(TransactionSuccess value)? success,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransactionStateCopyWith<$Res> {
  factory $TransactionStateCopyWith(
    TransactionState value,
    $Res Function(TransactionState) then,
  ) = _$TransactionStateCopyWithImpl<$Res, TransactionState>;
}

/// @nodoc
class _$TransactionStateCopyWithImpl<$Res, $Val extends TransactionState>
    implements $TransactionStateCopyWith<$Res> {
  _$TransactionStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$TransactionInitialImplCopyWith<$Res> {
  factory _$$TransactionInitialImplCopyWith(
    _$TransactionInitialImpl value,
    $Res Function(_$TransactionInitialImpl) then,
  ) = __$$TransactionInitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$TransactionInitialImplCopyWithImpl<$Res>
    extends _$TransactionStateCopyWithImpl<$Res, _$TransactionInitialImpl>
    implements _$$TransactionInitialImplCopyWith<$Res> {
  __$$TransactionInitialImplCopyWithImpl(
    _$TransactionInitialImpl _value,
    $Res Function(_$TransactionInitialImpl) _then,
  ) : super(_value, _then);
}

/// @nodoc

class _$TransactionInitialImpl implements TransactionInitial {
  const _$TransactionInitialImpl();

  @override
  String toString() {
    return 'TransactionState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$TransactionInitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Transaction> transactions) loaded,
    required TResult Function(String message) error,
    required TResult Function(String message) success,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Transaction> transactions)? loaded,
    TResult? Function(String message)? error,
    TResult? Function(String message)? success,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Transaction> transactions)? loaded,
    TResult Function(String message)? error,
    TResult Function(String message)? success,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TransactionInitial value) initial,
    required TResult Function(TransactionLoading value) loading,
    required TResult Function(TransactionLoaded value) loaded,
    required TResult Function(TransactionError value) error,
    required TResult Function(TransactionSuccess value) success,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TransactionInitial value)? initial,
    TResult? Function(TransactionLoading value)? loading,
    TResult? Function(TransactionLoaded value)? loaded,
    TResult? Function(TransactionError value)? error,
    TResult? Function(TransactionSuccess value)? success,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TransactionInitial value)? initial,
    TResult Function(TransactionLoading value)? loading,
    TResult Function(TransactionLoaded value)? loaded,
    TResult Function(TransactionError value)? error,
    TResult Function(TransactionSuccess value)? success,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class TransactionInitial implements TransactionState {
  const factory TransactionInitial() = _$TransactionInitialImpl;
}

/// @nodoc
abstract class _$$TransactionLoadingImplCopyWith<$Res> {
  factory _$$TransactionLoadingImplCopyWith(
    _$TransactionLoadingImpl value,
    $Res Function(_$TransactionLoadingImpl) then,
  ) = __$$TransactionLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$TransactionLoadingImplCopyWithImpl<$Res>
    extends _$TransactionStateCopyWithImpl<$Res, _$TransactionLoadingImpl>
    implements _$$TransactionLoadingImplCopyWith<$Res> {
  __$$TransactionLoadingImplCopyWithImpl(
    _$TransactionLoadingImpl _value,
    $Res Function(_$TransactionLoadingImpl) _then,
  ) : super(_value, _then);
}

/// @nodoc

class _$TransactionLoadingImpl implements TransactionLoading {
  const _$TransactionLoadingImpl();

  @override
  String toString() {
    return 'TransactionState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$TransactionLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Transaction> transactions) loaded,
    required TResult Function(String message) error,
    required TResult Function(String message) success,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Transaction> transactions)? loaded,
    TResult? Function(String message)? error,
    TResult? Function(String message)? success,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Transaction> transactions)? loaded,
    TResult Function(String message)? error,
    TResult Function(String message)? success,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TransactionInitial value) initial,
    required TResult Function(TransactionLoading value) loading,
    required TResult Function(TransactionLoaded value) loaded,
    required TResult Function(TransactionError value) error,
    required TResult Function(TransactionSuccess value) success,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TransactionInitial value)? initial,
    TResult? Function(TransactionLoading value)? loading,
    TResult? Function(TransactionLoaded value)? loaded,
    TResult? Function(TransactionError value)? error,
    TResult? Function(TransactionSuccess value)? success,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TransactionInitial value)? initial,
    TResult Function(TransactionLoading value)? loading,
    TResult Function(TransactionLoaded value)? loaded,
    TResult Function(TransactionError value)? error,
    TResult Function(TransactionSuccess value)? success,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class TransactionLoading implements TransactionState {
  const factory TransactionLoading() = _$TransactionLoadingImpl;
}

/// @nodoc
abstract class _$$TransactionLoadedImplCopyWith<$Res> {
  factory _$$TransactionLoadedImplCopyWith(
    _$TransactionLoadedImpl value,
    $Res Function(_$TransactionLoadedImpl) then,
  ) = __$$TransactionLoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<Transaction> transactions});
}

/// @nodoc
class __$$TransactionLoadedImplCopyWithImpl<$Res>
    extends _$TransactionStateCopyWithImpl<$Res, _$TransactionLoadedImpl>
    implements _$$TransactionLoadedImplCopyWith<$Res> {
  __$$TransactionLoadedImplCopyWithImpl(
    _$TransactionLoadedImpl _value,
    $Res Function(_$TransactionLoadedImpl) _then,
  ) : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? transactions = null}) {
    return _then(
      _$TransactionLoadedImpl(
        transactions: null == transactions
            ? _value._transactions
            : transactions // ignore: cast_nullable_to_non_nullable
                  as List<Transaction>,
      ),
    );
  }
}

/// @nodoc

class _$TransactionLoadedImpl implements TransactionLoaded {
  const _$TransactionLoadedImpl({required final List<Transaction> transactions})
    : _transactions = transactions;

  final List<Transaction> _transactions;
  @override
  List<Transaction> get transactions {
    if (_transactions is EqualUnmodifiableListView) return _transactions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_transactions);
  }

  @override
  String toString() {
    return 'TransactionState.loaded(transactions: $transactions)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TransactionLoadedImpl &&
            const DeepCollectionEquality().equals(
              other._transactions,
              _transactions,
            ));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_transactions),
  );

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TransactionLoadedImplCopyWith<_$TransactionLoadedImpl> get copyWith =>
      __$$TransactionLoadedImplCopyWithImpl<_$TransactionLoadedImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Transaction> transactions) loaded,
    required TResult Function(String message) error,
    required TResult Function(String message) success,
  }) {
    return loaded(transactions);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Transaction> transactions)? loaded,
    TResult? Function(String message)? error,
    TResult? Function(String message)? success,
  }) {
    return loaded?.call(transactions);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Transaction> transactions)? loaded,
    TResult Function(String message)? error,
    TResult Function(String message)? success,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(transactions);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TransactionInitial value) initial,
    required TResult Function(TransactionLoading value) loading,
    required TResult Function(TransactionLoaded value) loaded,
    required TResult Function(TransactionError value) error,
    required TResult Function(TransactionSuccess value) success,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TransactionInitial value)? initial,
    TResult? Function(TransactionLoading value)? loading,
    TResult? Function(TransactionLoaded value)? loaded,
    TResult? Function(TransactionError value)? error,
    TResult? Function(TransactionSuccess value)? success,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TransactionInitial value)? initial,
    TResult Function(TransactionLoading value)? loading,
    TResult Function(TransactionLoaded value)? loaded,
    TResult Function(TransactionError value)? error,
    TResult Function(TransactionSuccess value)? success,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class TransactionLoaded implements TransactionState {
  const factory TransactionLoaded({
    required final List<Transaction> transactions,
  }) = _$TransactionLoadedImpl;

  List<Transaction> get transactions;
  @JsonKey(ignore: true)
  _$$TransactionLoadedImplCopyWith<_$TransactionLoadedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$TransactionErrorImplCopyWith<$Res> {
  factory _$$TransactionErrorImplCopyWith(
    _$TransactionErrorImpl value,
    $Res Function(_$TransactionErrorImpl) then,
  ) = __$$TransactionErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$TransactionErrorImplCopyWithImpl<$Res>
    extends _$TransactionStateCopyWithImpl<$Res, _$TransactionErrorImpl>
    implements _$$TransactionErrorImplCopyWith<$Res> {
  __$$TransactionErrorImplCopyWithImpl(
    _$TransactionErrorImpl _value,
    $Res Function(_$TransactionErrorImpl) _then,
  ) : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? message = null}) {
    return _then(
      _$TransactionErrorImpl(
        message: null == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$TransactionErrorImpl implements TransactionError {
  const _$TransactionErrorImpl({required this.message});

  @override
  final String message;

  @override
  String toString() {
    return 'TransactionState.error(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TransactionErrorImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TransactionErrorImplCopyWith<_$TransactionErrorImpl> get copyWith =>
      __$$TransactionErrorImplCopyWithImpl<_$TransactionErrorImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Transaction> transactions) loaded,
    required TResult Function(String message) error,
    required TResult Function(String message) success,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Transaction> transactions)? loaded,
    TResult? Function(String message)? error,
    TResult? Function(String message)? success,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Transaction> transactions)? loaded,
    TResult Function(String message)? error,
    TResult Function(String message)? success,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TransactionInitial value) initial,
    required TResult Function(TransactionLoading value) loading,
    required TResult Function(TransactionLoaded value) loaded,
    required TResult Function(TransactionError value) error,
    required TResult Function(TransactionSuccess value) success,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TransactionInitial value)? initial,
    TResult? Function(TransactionLoading value)? loading,
    TResult? Function(TransactionLoaded value)? loaded,
    TResult? Function(TransactionError value)? error,
    TResult? Function(TransactionSuccess value)? success,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TransactionInitial value)? initial,
    TResult Function(TransactionLoading value)? loading,
    TResult Function(TransactionLoaded value)? loaded,
    TResult Function(TransactionError value)? error,
    TResult Function(TransactionSuccess value)? success,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class TransactionError implements TransactionState {
  const factory TransactionError({required final String message}) =
      _$TransactionErrorImpl;

  String get message;
  @JsonKey(ignore: true)
  _$$TransactionErrorImplCopyWith<_$TransactionErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$TransactionSuccessImplCopyWith<$Res> {
  factory _$$TransactionSuccessImplCopyWith(
    _$TransactionSuccessImpl value,
    $Res Function(_$TransactionSuccessImpl) then,
  ) = __$$TransactionSuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$TransactionSuccessImplCopyWithImpl<$Res>
    extends _$TransactionStateCopyWithImpl<$Res, _$TransactionSuccessImpl>
    implements _$$TransactionSuccessImplCopyWith<$Res> {
  __$$TransactionSuccessImplCopyWithImpl(
    _$TransactionSuccessImpl _value,
    $Res Function(_$TransactionSuccessImpl) _then,
  ) : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? message = null}) {
    return _then(
      _$TransactionSuccessImpl(
        message: null == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$TransactionSuccessImpl implements TransactionSuccess {
  const _$TransactionSuccessImpl({required this.message});

  @override
  final String message;

  @override
  String toString() {
    return 'TransactionState.success(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TransactionSuccessImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TransactionSuccessImplCopyWith<_$TransactionSuccessImpl> get copyWith =>
      __$$TransactionSuccessImplCopyWithImpl<_$TransactionSuccessImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Transaction> transactions) loaded,
    required TResult Function(String message) error,
    required TResult Function(String message) success,
  }) {
    return success(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Transaction> transactions)? loaded,
    TResult? Function(String message)? error,
    TResult? Function(String message)? success,
  }) {
    return success?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Transaction> transactions)? loaded,
    TResult Function(String message)? error,
    TResult Function(String message)? success,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TransactionInitial value) initial,
    required TResult Function(TransactionLoading value) loading,
    required TResult Function(TransactionLoaded value) loaded,
    required TResult Function(TransactionError value) error,
    required TResult Function(TransactionSuccess value) success,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TransactionInitial value)? initial,
    TResult? Function(TransactionLoading value)? loading,
    TResult? Function(TransactionLoaded value)? loaded,
    TResult? Function(TransactionError value)? error,
    TResult? Function(TransactionSuccess value)? success,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TransactionInitial value)? initial,
    TResult Function(TransactionLoading value)? loading,
    TResult Function(TransactionLoaded value)? loaded,
    TResult Function(TransactionError value)? error,
    TResult Function(TransactionSuccess value)? success,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class TransactionSuccess implements TransactionState {
  const factory TransactionSuccess({required final String message}) =
      _$TransactionSuccessImpl;

  String get message;
  @JsonKey(ignore: true)
  _$$TransactionSuccessImplCopyWith<_$TransactionSuccessImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
