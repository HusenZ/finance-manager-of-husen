// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'recurring_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$RecurringState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<RecurringTransaction> transactions) loaded,
    required TResult Function(String message) error,
    required TResult Function(String message) success,
    required TResult Function(List<RecurringTransaction> detectedTransactions)
    detected,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<RecurringTransaction> transactions)? loaded,
    TResult? Function(String message)? error,
    TResult? Function(String message)? success,
    TResult? Function(List<RecurringTransaction> detectedTransactions)?
    detected,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<RecurringTransaction> transactions)? loaded,
    TResult Function(String message)? error,
    TResult Function(String message)? success,
    TResult Function(List<RecurringTransaction> detectedTransactions)? detected,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RecurringInitial value) initial,
    required TResult Function(RecurringLoading value) loading,
    required TResult Function(RecurringLoaded value) loaded,
    required TResult Function(RecurringError value) error,
    required TResult Function(RecurringSuccess value) success,
    required TResult Function(RecurringDetected value) detected,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(RecurringInitial value)? initial,
    TResult? Function(RecurringLoading value)? loading,
    TResult? Function(RecurringLoaded value)? loaded,
    TResult? Function(RecurringError value)? error,
    TResult? Function(RecurringSuccess value)? success,
    TResult? Function(RecurringDetected value)? detected,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RecurringInitial value)? initial,
    TResult Function(RecurringLoading value)? loading,
    TResult Function(RecurringLoaded value)? loaded,
    TResult Function(RecurringError value)? error,
    TResult Function(RecurringSuccess value)? success,
    TResult Function(RecurringDetected value)? detected,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecurringStateCopyWith<$Res> {
  factory $RecurringStateCopyWith(
    RecurringState value,
    $Res Function(RecurringState) then,
  ) = _$RecurringStateCopyWithImpl<$Res, RecurringState>;
}

/// @nodoc
class _$RecurringStateCopyWithImpl<$Res, $Val extends RecurringState>
    implements $RecurringStateCopyWith<$Res> {
  _$RecurringStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$RecurringInitialImplCopyWith<$Res> {
  factory _$$RecurringInitialImplCopyWith(
    _$RecurringInitialImpl value,
    $Res Function(_$RecurringInitialImpl) then,
  ) = __$$RecurringInitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$RecurringInitialImplCopyWithImpl<$Res>
    extends _$RecurringStateCopyWithImpl<$Res, _$RecurringInitialImpl>
    implements _$$RecurringInitialImplCopyWith<$Res> {
  __$$RecurringInitialImplCopyWithImpl(
    _$RecurringInitialImpl _value,
    $Res Function(_$RecurringInitialImpl) _then,
  ) : super(_value, _then);
}

/// @nodoc

class _$RecurringInitialImpl implements RecurringInitial {
  const _$RecurringInitialImpl();

  @override
  String toString() {
    return 'RecurringState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$RecurringInitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<RecurringTransaction> transactions) loaded,
    required TResult Function(String message) error,
    required TResult Function(String message) success,
    required TResult Function(List<RecurringTransaction> detectedTransactions)
    detected,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<RecurringTransaction> transactions)? loaded,
    TResult? Function(String message)? error,
    TResult? Function(String message)? success,
    TResult? Function(List<RecurringTransaction> detectedTransactions)?
    detected,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<RecurringTransaction> transactions)? loaded,
    TResult Function(String message)? error,
    TResult Function(String message)? success,
    TResult Function(List<RecurringTransaction> detectedTransactions)? detected,
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
    required TResult Function(RecurringInitial value) initial,
    required TResult Function(RecurringLoading value) loading,
    required TResult Function(RecurringLoaded value) loaded,
    required TResult Function(RecurringError value) error,
    required TResult Function(RecurringSuccess value) success,
    required TResult Function(RecurringDetected value) detected,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(RecurringInitial value)? initial,
    TResult? Function(RecurringLoading value)? loading,
    TResult? Function(RecurringLoaded value)? loaded,
    TResult? Function(RecurringError value)? error,
    TResult? Function(RecurringSuccess value)? success,
    TResult? Function(RecurringDetected value)? detected,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RecurringInitial value)? initial,
    TResult Function(RecurringLoading value)? loading,
    TResult Function(RecurringLoaded value)? loaded,
    TResult Function(RecurringError value)? error,
    TResult Function(RecurringSuccess value)? success,
    TResult Function(RecurringDetected value)? detected,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class RecurringInitial implements RecurringState {
  const factory RecurringInitial() = _$RecurringInitialImpl;
}

/// @nodoc
abstract class _$$RecurringLoadingImplCopyWith<$Res> {
  factory _$$RecurringLoadingImplCopyWith(
    _$RecurringLoadingImpl value,
    $Res Function(_$RecurringLoadingImpl) then,
  ) = __$$RecurringLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$RecurringLoadingImplCopyWithImpl<$Res>
    extends _$RecurringStateCopyWithImpl<$Res, _$RecurringLoadingImpl>
    implements _$$RecurringLoadingImplCopyWith<$Res> {
  __$$RecurringLoadingImplCopyWithImpl(
    _$RecurringLoadingImpl _value,
    $Res Function(_$RecurringLoadingImpl) _then,
  ) : super(_value, _then);
}

/// @nodoc

class _$RecurringLoadingImpl implements RecurringLoading {
  const _$RecurringLoadingImpl();

  @override
  String toString() {
    return 'RecurringState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$RecurringLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<RecurringTransaction> transactions) loaded,
    required TResult Function(String message) error,
    required TResult Function(String message) success,
    required TResult Function(List<RecurringTransaction> detectedTransactions)
    detected,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<RecurringTransaction> transactions)? loaded,
    TResult? Function(String message)? error,
    TResult? Function(String message)? success,
    TResult? Function(List<RecurringTransaction> detectedTransactions)?
    detected,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<RecurringTransaction> transactions)? loaded,
    TResult Function(String message)? error,
    TResult Function(String message)? success,
    TResult Function(List<RecurringTransaction> detectedTransactions)? detected,
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
    required TResult Function(RecurringInitial value) initial,
    required TResult Function(RecurringLoading value) loading,
    required TResult Function(RecurringLoaded value) loaded,
    required TResult Function(RecurringError value) error,
    required TResult Function(RecurringSuccess value) success,
    required TResult Function(RecurringDetected value) detected,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(RecurringInitial value)? initial,
    TResult? Function(RecurringLoading value)? loading,
    TResult? Function(RecurringLoaded value)? loaded,
    TResult? Function(RecurringError value)? error,
    TResult? Function(RecurringSuccess value)? success,
    TResult? Function(RecurringDetected value)? detected,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RecurringInitial value)? initial,
    TResult Function(RecurringLoading value)? loading,
    TResult Function(RecurringLoaded value)? loaded,
    TResult Function(RecurringError value)? error,
    TResult Function(RecurringSuccess value)? success,
    TResult Function(RecurringDetected value)? detected,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class RecurringLoading implements RecurringState {
  const factory RecurringLoading() = _$RecurringLoadingImpl;
}

/// @nodoc
abstract class _$$RecurringLoadedImplCopyWith<$Res> {
  factory _$$RecurringLoadedImplCopyWith(
    _$RecurringLoadedImpl value,
    $Res Function(_$RecurringLoadedImpl) then,
  ) = __$$RecurringLoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<RecurringTransaction> transactions});
}

/// @nodoc
class __$$RecurringLoadedImplCopyWithImpl<$Res>
    extends _$RecurringStateCopyWithImpl<$Res, _$RecurringLoadedImpl>
    implements _$$RecurringLoadedImplCopyWith<$Res> {
  __$$RecurringLoadedImplCopyWithImpl(
    _$RecurringLoadedImpl _value,
    $Res Function(_$RecurringLoadedImpl) _then,
  ) : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? transactions = null}) {
    return _then(
      _$RecurringLoadedImpl(
        transactions: null == transactions
            ? _value._transactions
            : transactions // ignore: cast_nullable_to_non_nullable
                  as List<RecurringTransaction>,
      ),
    );
  }
}

/// @nodoc

class _$RecurringLoadedImpl implements RecurringLoaded {
  const _$RecurringLoadedImpl({
    required final List<RecurringTransaction> transactions,
  }) : _transactions = transactions;

  final List<RecurringTransaction> _transactions;
  @override
  List<RecurringTransaction> get transactions {
    if (_transactions is EqualUnmodifiableListView) return _transactions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_transactions);
  }

  @override
  String toString() {
    return 'RecurringState.loaded(transactions: $transactions)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RecurringLoadedImpl &&
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
  _$$RecurringLoadedImplCopyWith<_$RecurringLoadedImpl> get copyWith =>
      __$$RecurringLoadedImplCopyWithImpl<_$RecurringLoadedImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<RecurringTransaction> transactions) loaded,
    required TResult Function(String message) error,
    required TResult Function(String message) success,
    required TResult Function(List<RecurringTransaction> detectedTransactions)
    detected,
  }) {
    return loaded(transactions);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<RecurringTransaction> transactions)? loaded,
    TResult? Function(String message)? error,
    TResult? Function(String message)? success,
    TResult? Function(List<RecurringTransaction> detectedTransactions)?
    detected,
  }) {
    return loaded?.call(transactions);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<RecurringTransaction> transactions)? loaded,
    TResult Function(String message)? error,
    TResult Function(String message)? success,
    TResult Function(List<RecurringTransaction> detectedTransactions)? detected,
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
    required TResult Function(RecurringInitial value) initial,
    required TResult Function(RecurringLoading value) loading,
    required TResult Function(RecurringLoaded value) loaded,
    required TResult Function(RecurringError value) error,
    required TResult Function(RecurringSuccess value) success,
    required TResult Function(RecurringDetected value) detected,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(RecurringInitial value)? initial,
    TResult? Function(RecurringLoading value)? loading,
    TResult? Function(RecurringLoaded value)? loaded,
    TResult? Function(RecurringError value)? error,
    TResult? Function(RecurringSuccess value)? success,
    TResult? Function(RecurringDetected value)? detected,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RecurringInitial value)? initial,
    TResult Function(RecurringLoading value)? loading,
    TResult Function(RecurringLoaded value)? loaded,
    TResult Function(RecurringError value)? error,
    TResult Function(RecurringSuccess value)? success,
    TResult Function(RecurringDetected value)? detected,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class RecurringLoaded implements RecurringState {
  const factory RecurringLoaded({
    required final List<RecurringTransaction> transactions,
  }) = _$RecurringLoadedImpl;

  List<RecurringTransaction> get transactions;
  @JsonKey(ignore: true)
  _$$RecurringLoadedImplCopyWith<_$RecurringLoadedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RecurringErrorImplCopyWith<$Res> {
  factory _$$RecurringErrorImplCopyWith(
    _$RecurringErrorImpl value,
    $Res Function(_$RecurringErrorImpl) then,
  ) = __$$RecurringErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$RecurringErrorImplCopyWithImpl<$Res>
    extends _$RecurringStateCopyWithImpl<$Res, _$RecurringErrorImpl>
    implements _$$RecurringErrorImplCopyWith<$Res> {
  __$$RecurringErrorImplCopyWithImpl(
    _$RecurringErrorImpl _value,
    $Res Function(_$RecurringErrorImpl) _then,
  ) : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? message = null}) {
    return _then(
      _$RecurringErrorImpl(
        message: null == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$RecurringErrorImpl implements RecurringError {
  const _$RecurringErrorImpl({required this.message});

  @override
  final String message;

  @override
  String toString() {
    return 'RecurringState.error(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RecurringErrorImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RecurringErrorImplCopyWith<_$RecurringErrorImpl> get copyWith =>
      __$$RecurringErrorImplCopyWithImpl<_$RecurringErrorImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<RecurringTransaction> transactions) loaded,
    required TResult Function(String message) error,
    required TResult Function(String message) success,
    required TResult Function(List<RecurringTransaction> detectedTransactions)
    detected,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<RecurringTransaction> transactions)? loaded,
    TResult? Function(String message)? error,
    TResult? Function(String message)? success,
    TResult? Function(List<RecurringTransaction> detectedTransactions)?
    detected,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<RecurringTransaction> transactions)? loaded,
    TResult Function(String message)? error,
    TResult Function(String message)? success,
    TResult Function(List<RecurringTransaction> detectedTransactions)? detected,
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
    required TResult Function(RecurringInitial value) initial,
    required TResult Function(RecurringLoading value) loading,
    required TResult Function(RecurringLoaded value) loaded,
    required TResult Function(RecurringError value) error,
    required TResult Function(RecurringSuccess value) success,
    required TResult Function(RecurringDetected value) detected,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(RecurringInitial value)? initial,
    TResult? Function(RecurringLoading value)? loading,
    TResult? Function(RecurringLoaded value)? loaded,
    TResult? Function(RecurringError value)? error,
    TResult? Function(RecurringSuccess value)? success,
    TResult? Function(RecurringDetected value)? detected,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RecurringInitial value)? initial,
    TResult Function(RecurringLoading value)? loading,
    TResult Function(RecurringLoaded value)? loaded,
    TResult Function(RecurringError value)? error,
    TResult Function(RecurringSuccess value)? success,
    TResult Function(RecurringDetected value)? detected,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class RecurringError implements RecurringState {
  const factory RecurringError({required final String message}) =
      _$RecurringErrorImpl;

  String get message;
  @JsonKey(ignore: true)
  _$$RecurringErrorImplCopyWith<_$RecurringErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RecurringSuccessImplCopyWith<$Res> {
  factory _$$RecurringSuccessImplCopyWith(
    _$RecurringSuccessImpl value,
    $Res Function(_$RecurringSuccessImpl) then,
  ) = __$$RecurringSuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$RecurringSuccessImplCopyWithImpl<$Res>
    extends _$RecurringStateCopyWithImpl<$Res, _$RecurringSuccessImpl>
    implements _$$RecurringSuccessImplCopyWith<$Res> {
  __$$RecurringSuccessImplCopyWithImpl(
    _$RecurringSuccessImpl _value,
    $Res Function(_$RecurringSuccessImpl) _then,
  ) : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? message = null}) {
    return _then(
      _$RecurringSuccessImpl(
        message: null == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$RecurringSuccessImpl implements RecurringSuccess {
  const _$RecurringSuccessImpl({required this.message});

  @override
  final String message;

  @override
  String toString() {
    return 'RecurringState.success(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RecurringSuccessImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RecurringSuccessImplCopyWith<_$RecurringSuccessImpl> get copyWith =>
      __$$RecurringSuccessImplCopyWithImpl<_$RecurringSuccessImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<RecurringTransaction> transactions) loaded,
    required TResult Function(String message) error,
    required TResult Function(String message) success,
    required TResult Function(List<RecurringTransaction> detectedTransactions)
    detected,
  }) {
    return success(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<RecurringTransaction> transactions)? loaded,
    TResult? Function(String message)? error,
    TResult? Function(String message)? success,
    TResult? Function(List<RecurringTransaction> detectedTransactions)?
    detected,
  }) {
    return success?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<RecurringTransaction> transactions)? loaded,
    TResult Function(String message)? error,
    TResult Function(String message)? success,
    TResult Function(List<RecurringTransaction> detectedTransactions)? detected,
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
    required TResult Function(RecurringInitial value) initial,
    required TResult Function(RecurringLoading value) loading,
    required TResult Function(RecurringLoaded value) loaded,
    required TResult Function(RecurringError value) error,
    required TResult Function(RecurringSuccess value) success,
    required TResult Function(RecurringDetected value) detected,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(RecurringInitial value)? initial,
    TResult? Function(RecurringLoading value)? loading,
    TResult? Function(RecurringLoaded value)? loaded,
    TResult? Function(RecurringError value)? error,
    TResult? Function(RecurringSuccess value)? success,
    TResult? Function(RecurringDetected value)? detected,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RecurringInitial value)? initial,
    TResult Function(RecurringLoading value)? loading,
    TResult Function(RecurringLoaded value)? loaded,
    TResult Function(RecurringError value)? error,
    TResult Function(RecurringSuccess value)? success,
    TResult Function(RecurringDetected value)? detected,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class RecurringSuccess implements RecurringState {
  const factory RecurringSuccess({required final String message}) =
      _$RecurringSuccessImpl;

  String get message;
  @JsonKey(ignore: true)
  _$$RecurringSuccessImplCopyWith<_$RecurringSuccessImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RecurringDetectedImplCopyWith<$Res> {
  factory _$$RecurringDetectedImplCopyWith(
    _$RecurringDetectedImpl value,
    $Res Function(_$RecurringDetectedImpl) then,
  ) = __$$RecurringDetectedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<RecurringTransaction> detectedTransactions});
}

/// @nodoc
class __$$RecurringDetectedImplCopyWithImpl<$Res>
    extends _$RecurringStateCopyWithImpl<$Res, _$RecurringDetectedImpl>
    implements _$$RecurringDetectedImplCopyWith<$Res> {
  __$$RecurringDetectedImplCopyWithImpl(
    _$RecurringDetectedImpl _value,
    $Res Function(_$RecurringDetectedImpl) _then,
  ) : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? detectedTransactions = null}) {
    return _then(
      _$RecurringDetectedImpl(
        detectedTransactions: null == detectedTransactions
            ? _value._detectedTransactions
            : detectedTransactions // ignore: cast_nullable_to_non_nullable
                  as List<RecurringTransaction>,
      ),
    );
  }
}

/// @nodoc

class _$RecurringDetectedImpl implements RecurringDetected {
  const _$RecurringDetectedImpl({
    required final List<RecurringTransaction> detectedTransactions,
  }) : _detectedTransactions = detectedTransactions;

  final List<RecurringTransaction> _detectedTransactions;
  @override
  List<RecurringTransaction> get detectedTransactions {
    if (_detectedTransactions is EqualUnmodifiableListView)
      return _detectedTransactions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_detectedTransactions);
  }

  @override
  String toString() {
    return 'RecurringState.detected(detectedTransactions: $detectedTransactions)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RecurringDetectedImpl &&
            const DeepCollectionEquality().equals(
              other._detectedTransactions,
              _detectedTransactions,
            ));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_detectedTransactions),
  );

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RecurringDetectedImplCopyWith<_$RecurringDetectedImpl> get copyWith =>
      __$$RecurringDetectedImplCopyWithImpl<_$RecurringDetectedImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<RecurringTransaction> transactions) loaded,
    required TResult Function(String message) error,
    required TResult Function(String message) success,
    required TResult Function(List<RecurringTransaction> detectedTransactions)
    detected,
  }) {
    return detected(detectedTransactions);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<RecurringTransaction> transactions)? loaded,
    TResult? Function(String message)? error,
    TResult? Function(String message)? success,
    TResult? Function(List<RecurringTransaction> detectedTransactions)?
    detected,
  }) {
    return detected?.call(detectedTransactions);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<RecurringTransaction> transactions)? loaded,
    TResult Function(String message)? error,
    TResult Function(String message)? success,
    TResult Function(List<RecurringTransaction> detectedTransactions)? detected,
    required TResult orElse(),
  }) {
    if (detected != null) {
      return detected(detectedTransactions);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RecurringInitial value) initial,
    required TResult Function(RecurringLoading value) loading,
    required TResult Function(RecurringLoaded value) loaded,
    required TResult Function(RecurringError value) error,
    required TResult Function(RecurringSuccess value) success,
    required TResult Function(RecurringDetected value) detected,
  }) {
    return detected(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(RecurringInitial value)? initial,
    TResult? Function(RecurringLoading value)? loading,
    TResult? Function(RecurringLoaded value)? loaded,
    TResult? Function(RecurringError value)? error,
    TResult? Function(RecurringSuccess value)? success,
    TResult? Function(RecurringDetected value)? detected,
  }) {
    return detected?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RecurringInitial value)? initial,
    TResult Function(RecurringLoading value)? loading,
    TResult Function(RecurringLoaded value)? loaded,
    TResult Function(RecurringError value)? error,
    TResult Function(RecurringSuccess value)? success,
    TResult Function(RecurringDetected value)? detected,
    required TResult orElse(),
  }) {
    if (detected != null) {
      return detected(this);
    }
    return orElse();
  }
}

abstract class RecurringDetected implements RecurringState {
  const factory RecurringDetected({
    required final List<RecurringTransaction> detectedTransactions,
  }) = _$RecurringDetectedImpl;

  List<RecurringTransaction> get detectedTransactions;
  @JsonKey(ignore: true)
  _$$RecurringDetectedImplCopyWith<_$RecurringDetectedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
