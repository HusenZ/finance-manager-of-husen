// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'income_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$IncomeState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Income> incomes) loaded,
    required TResult Function(double total) totalCalculated,
    required TResult Function(String message) success,
    required TResult Function(String message) error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Income> incomes)? loaded,
    TResult? Function(double total)? totalCalculated,
    TResult? Function(String message)? success,
    TResult? Function(String message)? error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Income> incomes)? loaded,
    TResult Function(double total)? totalCalculated,
    TResult Function(String message)? success,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(IncomeInitial value) initial,
    required TResult Function(IncomeLoading value) loading,
    required TResult Function(IncomeLoaded value) loaded,
    required TResult Function(IncomeTotalCalculated value) totalCalculated,
    required TResult Function(IncomeSuccess value) success,
    required TResult Function(IncomeError value) error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(IncomeInitial value)? initial,
    TResult? Function(IncomeLoading value)? loading,
    TResult? Function(IncomeLoaded value)? loaded,
    TResult? Function(IncomeTotalCalculated value)? totalCalculated,
    TResult? Function(IncomeSuccess value)? success,
    TResult? Function(IncomeError value)? error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(IncomeInitial value)? initial,
    TResult Function(IncomeLoading value)? loading,
    TResult Function(IncomeLoaded value)? loaded,
    TResult Function(IncomeTotalCalculated value)? totalCalculated,
    TResult Function(IncomeSuccess value)? success,
    TResult Function(IncomeError value)? error,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IncomeStateCopyWith<$Res> {
  factory $IncomeStateCopyWith(
    IncomeState value,
    $Res Function(IncomeState) then,
  ) = _$IncomeStateCopyWithImpl<$Res, IncomeState>;
}

/// @nodoc
class _$IncomeStateCopyWithImpl<$Res, $Val extends IncomeState>
    implements $IncomeStateCopyWith<$Res> {
  _$IncomeStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$IncomeInitialImplCopyWith<$Res> {
  factory _$$IncomeInitialImplCopyWith(
    _$IncomeInitialImpl value,
    $Res Function(_$IncomeInitialImpl) then,
  ) = __$$IncomeInitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$IncomeInitialImplCopyWithImpl<$Res>
    extends _$IncomeStateCopyWithImpl<$Res, _$IncomeInitialImpl>
    implements _$$IncomeInitialImplCopyWith<$Res> {
  __$$IncomeInitialImplCopyWithImpl(
    _$IncomeInitialImpl _value,
    $Res Function(_$IncomeInitialImpl) _then,
  ) : super(_value, _then);
}

/// @nodoc

class _$IncomeInitialImpl implements IncomeInitial {
  const _$IncomeInitialImpl();

  @override
  String toString() {
    return 'IncomeState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$IncomeInitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Income> incomes) loaded,
    required TResult Function(double total) totalCalculated,
    required TResult Function(String message) success,
    required TResult Function(String message) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Income> incomes)? loaded,
    TResult? Function(double total)? totalCalculated,
    TResult? Function(String message)? success,
    TResult? Function(String message)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Income> incomes)? loaded,
    TResult Function(double total)? totalCalculated,
    TResult Function(String message)? success,
    TResult Function(String message)? error,
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
    required TResult Function(IncomeInitial value) initial,
    required TResult Function(IncomeLoading value) loading,
    required TResult Function(IncomeLoaded value) loaded,
    required TResult Function(IncomeTotalCalculated value) totalCalculated,
    required TResult Function(IncomeSuccess value) success,
    required TResult Function(IncomeError value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(IncomeInitial value)? initial,
    TResult? Function(IncomeLoading value)? loading,
    TResult? Function(IncomeLoaded value)? loaded,
    TResult? Function(IncomeTotalCalculated value)? totalCalculated,
    TResult? Function(IncomeSuccess value)? success,
    TResult? Function(IncomeError value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(IncomeInitial value)? initial,
    TResult Function(IncomeLoading value)? loading,
    TResult Function(IncomeLoaded value)? loaded,
    TResult Function(IncomeTotalCalculated value)? totalCalculated,
    TResult Function(IncomeSuccess value)? success,
    TResult Function(IncomeError value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class IncomeInitial implements IncomeState {
  const factory IncomeInitial() = _$IncomeInitialImpl;
}

/// @nodoc
abstract class _$$IncomeLoadingImplCopyWith<$Res> {
  factory _$$IncomeLoadingImplCopyWith(
    _$IncomeLoadingImpl value,
    $Res Function(_$IncomeLoadingImpl) then,
  ) = __$$IncomeLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$IncomeLoadingImplCopyWithImpl<$Res>
    extends _$IncomeStateCopyWithImpl<$Res, _$IncomeLoadingImpl>
    implements _$$IncomeLoadingImplCopyWith<$Res> {
  __$$IncomeLoadingImplCopyWithImpl(
    _$IncomeLoadingImpl _value,
    $Res Function(_$IncomeLoadingImpl) _then,
  ) : super(_value, _then);
}

/// @nodoc

class _$IncomeLoadingImpl implements IncomeLoading {
  const _$IncomeLoadingImpl();

  @override
  String toString() {
    return 'IncomeState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$IncomeLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Income> incomes) loaded,
    required TResult Function(double total) totalCalculated,
    required TResult Function(String message) success,
    required TResult Function(String message) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Income> incomes)? loaded,
    TResult? Function(double total)? totalCalculated,
    TResult? Function(String message)? success,
    TResult? Function(String message)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Income> incomes)? loaded,
    TResult Function(double total)? totalCalculated,
    TResult Function(String message)? success,
    TResult Function(String message)? error,
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
    required TResult Function(IncomeInitial value) initial,
    required TResult Function(IncomeLoading value) loading,
    required TResult Function(IncomeLoaded value) loaded,
    required TResult Function(IncomeTotalCalculated value) totalCalculated,
    required TResult Function(IncomeSuccess value) success,
    required TResult Function(IncomeError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(IncomeInitial value)? initial,
    TResult? Function(IncomeLoading value)? loading,
    TResult? Function(IncomeLoaded value)? loaded,
    TResult? Function(IncomeTotalCalculated value)? totalCalculated,
    TResult? Function(IncomeSuccess value)? success,
    TResult? Function(IncomeError value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(IncomeInitial value)? initial,
    TResult Function(IncomeLoading value)? loading,
    TResult Function(IncomeLoaded value)? loaded,
    TResult Function(IncomeTotalCalculated value)? totalCalculated,
    TResult Function(IncomeSuccess value)? success,
    TResult Function(IncomeError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class IncomeLoading implements IncomeState {
  const factory IncomeLoading() = _$IncomeLoadingImpl;
}

/// @nodoc
abstract class _$$IncomeLoadedImplCopyWith<$Res> {
  factory _$$IncomeLoadedImplCopyWith(
    _$IncomeLoadedImpl value,
    $Res Function(_$IncomeLoadedImpl) then,
  ) = __$$IncomeLoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<Income> incomes});
}

/// @nodoc
class __$$IncomeLoadedImplCopyWithImpl<$Res>
    extends _$IncomeStateCopyWithImpl<$Res, _$IncomeLoadedImpl>
    implements _$$IncomeLoadedImplCopyWith<$Res> {
  __$$IncomeLoadedImplCopyWithImpl(
    _$IncomeLoadedImpl _value,
    $Res Function(_$IncomeLoadedImpl) _then,
  ) : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? incomes = null}) {
    return _then(
      _$IncomeLoadedImpl(
        incomes: null == incomes
            ? _value._incomes
            : incomes // ignore: cast_nullable_to_non_nullable
                  as List<Income>,
      ),
    );
  }
}

/// @nodoc

class _$IncomeLoadedImpl implements IncomeLoaded {
  const _$IncomeLoadedImpl({required final List<Income> incomes})
    : _incomes = incomes;

  final List<Income> _incomes;
  @override
  List<Income> get incomes {
    if (_incomes is EqualUnmodifiableListView) return _incomes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_incomes);
  }

  @override
  String toString() {
    return 'IncomeState.loaded(incomes: $incomes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$IncomeLoadedImpl &&
            const DeepCollectionEquality().equals(other._incomes, _incomes));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_incomes));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$IncomeLoadedImplCopyWith<_$IncomeLoadedImpl> get copyWith =>
      __$$IncomeLoadedImplCopyWithImpl<_$IncomeLoadedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Income> incomes) loaded,
    required TResult Function(double total) totalCalculated,
    required TResult Function(String message) success,
    required TResult Function(String message) error,
  }) {
    return loaded(incomes);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Income> incomes)? loaded,
    TResult? Function(double total)? totalCalculated,
    TResult? Function(String message)? success,
    TResult? Function(String message)? error,
  }) {
    return loaded?.call(incomes);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Income> incomes)? loaded,
    TResult Function(double total)? totalCalculated,
    TResult Function(String message)? success,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(incomes);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(IncomeInitial value) initial,
    required TResult Function(IncomeLoading value) loading,
    required TResult Function(IncomeLoaded value) loaded,
    required TResult Function(IncomeTotalCalculated value) totalCalculated,
    required TResult Function(IncomeSuccess value) success,
    required TResult Function(IncomeError value) error,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(IncomeInitial value)? initial,
    TResult? Function(IncomeLoading value)? loading,
    TResult? Function(IncomeLoaded value)? loaded,
    TResult? Function(IncomeTotalCalculated value)? totalCalculated,
    TResult? Function(IncomeSuccess value)? success,
    TResult? Function(IncomeError value)? error,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(IncomeInitial value)? initial,
    TResult Function(IncomeLoading value)? loading,
    TResult Function(IncomeLoaded value)? loaded,
    TResult Function(IncomeTotalCalculated value)? totalCalculated,
    TResult Function(IncomeSuccess value)? success,
    TResult Function(IncomeError value)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class IncomeLoaded implements IncomeState {
  const factory IncomeLoaded({required final List<Income> incomes}) =
      _$IncomeLoadedImpl;

  List<Income> get incomes;
  @JsonKey(ignore: true)
  _$$IncomeLoadedImplCopyWith<_$IncomeLoadedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$IncomeTotalCalculatedImplCopyWith<$Res> {
  factory _$$IncomeTotalCalculatedImplCopyWith(
    _$IncomeTotalCalculatedImpl value,
    $Res Function(_$IncomeTotalCalculatedImpl) then,
  ) = __$$IncomeTotalCalculatedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({double total});
}

/// @nodoc
class __$$IncomeTotalCalculatedImplCopyWithImpl<$Res>
    extends _$IncomeStateCopyWithImpl<$Res, _$IncomeTotalCalculatedImpl>
    implements _$$IncomeTotalCalculatedImplCopyWith<$Res> {
  __$$IncomeTotalCalculatedImplCopyWithImpl(
    _$IncomeTotalCalculatedImpl _value,
    $Res Function(_$IncomeTotalCalculatedImpl) _then,
  ) : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? total = null}) {
    return _then(
      _$IncomeTotalCalculatedImpl(
        total: null == total
            ? _value.total
            : total // ignore: cast_nullable_to_non_nullable
                  as double,
      ),
    );
  }
}

/// @nodoc

class _$IncomeTotalCalculatedImpl implements IncomeTotalCalculated {
  const _$IncomeTotalCalculatedImpl({required this.total});

  @override
  final double total;

  @override
  String toString() {
    return 'IncomeState.totalCalculated(total: $total)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$IncomeTotalCalculatedImpl &&
            (identical(other.total, total) || other.total == total));
  }

  @override
  int get hashCode => Object.hash(runtimeType, total);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$IncomeTotalCalculatedImplCopyWith<_$IncomeTotalCalculatedImpl>
  get copyWith =>
      __$$IncomeTotalCalculatedImplCopyWithImpl<_$IncomeTotalCalculatedImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Income> incomes) loaded,
    required TResult Function(double total) totalCalculated,
    required TResult Function(String message) success,
    required TResult Function(String message) error,
  }) {
    return totalCalculated(total);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Income> incomes)? loaded,
    TResult? Function(double total)? totalCalculated,
    TResult? Function(String message)? success,
    TResult? Function(String message)? error,
  }) {
    return totalCalculated?.call(total);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Income> incomes)? loaded,
    TResult Function(double total)? totalCalculated,
    TResult Function(String message)? success,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (totalCalculated != null) {
      return totalCalculated(total);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(IncomeInitial value) initial,
    required TResult Function(IncomeLoading value) loading,
    required TResult Function(IncomeLoaded value) loaded,
    required TResult Function(IncomeTotalCalculated value) totalCalculated,
    required TResult Function(IncomeSuccess value) success,
    required TResult Function(IncomeError value) error,
  }) {
    return totalCalculated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(IncomeInitial value)? initial,
    TResult? Function(IncomeLoading value)? loading,
    TResult? Function(IncomeLoaded value)? loaded,
    TResult? Function(IncomeTotalCalculated value)? totalCalculated,
    TResult? Function(IncomeSuccess value)? success,
    TResult? Function(IncomeError value)? error,
  }) {
    return totalCalculated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(IncomeInitial value)? initial,
    TResult Function(IncomeLoading value)? loading,
    TResult Function(IncomeLoaded value)? loaded,
    TResult Function(IncomeTotalCalculated value)? totalCalculated,
    TResult Function(IncomeSuccess value)? success,
    TResult Function(IncomeError value)? error,
    required TResult orElse(),
  }) {
    if (totalCalculated != null) {
      return totalCalculated(this);
    }
    return orElse();
  }
}

abstract class IncomeTotalCalculated implements IncomeState {
  const factory IncomeTotalCalculated({required final double total}) =
      _$IncomeTotalCalculatedImpl;

  double get total;
  @JsonKey(ignore: true)
  _$$IncomeTotalCalculatedImplCopyWith<_$IncomeTotalCalculatedImpl>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$IncomeSuccessImplCopyWith<$Res> {
  factory _$$IncomeSuccessImplCopyWith(
    _$IncomeSuccessImpl value,
    $Res Function(_$IncomeSuccessImpl) then,
  ) = __$$IncomeSuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$IncomeSuccessImplCopyWithImpl<$Res>
    extends _$IncomeStateCopyWithImpl<$Res, _$IncomeSuccessImpl>
    implements _$$IncomeSuccessImplCopyWith<$Res> {
  __$$IncomeSuccessImplCopyWithImpl(
    _$IncomeSuccessImpl _value,
    $Res Function(_$IncomeSuccessImpl) _then,
  ) : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? message = null}) {
    return _then(
      _$IncomeSuccessImpl(
        message: null == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$IncomeSuccessImpl implements IncomeSuccess {
  const _$IncomeSuccessImpl({required this.message});

  @override
  final String message;

  @override
  String toString() {
    return 'IncomeState.success(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$IncomeSuccessImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$IncomeSuccessImplCopyWith<_$IncomeSuccessImpl> get copyWith =>
      __$$IncomeSuccessImplCopyWithImpl<_$IncomeSuccessImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Income> incomes) loaded,
    required TResult Function(double total) totalCalculated,
    required TResult Function(String message) success,
    required TResult Function(String message) error,
  }) {
    return success(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Income> incomes)? loaded,
    TResult? Function(double total)? totalCalculated,
    TResult? Function(String message)? success,
    TResult? Function(String message)? error,
  }) {
    return success?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Income> incomes)? loaded,
    TResult Function(double total)? totalCalculated,
    TResult Function(String message)? success,
    TResult Function(String message)? error,
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
    required TResult Function(IncomeInitial value) initial,
    required TResult Function(IncomeLoading value) loading,
    required TResult Function(IncomeLoaded value) loaded,
    required TResult Function(IncomeTotalCalculated value) totalCalculated,
    required TResult Function(IncomeSuccess value) success,
    required TResult Function(IncomeError value) error,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(IncomeInitial value)? initial,
    TResult? Function(IncomeLoading value)? loading,
    TResult? Function(IncomeLoaded value)? loaded,
    TResult? Function(IncomeTotalCalculated value)? totalCalculated,
    TResult? Function(IncomeSuccess value)? success,
    TResult? Function(IncomeError value)? error,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(IncomeInitial value)? initial,
    TResult Function(IncomeLoading value)? loading,
    TResult Function(IncomeLoaded value)? loaded,
    TResult Function(IncomeTotalCalculated value)? totalCalculated,
    TResult Function(IncomeSuccess value)? success,
    TResult Function(IncomeError value)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class IncomeSuccess implements IncomeState {
  const factory IncomeSuccess({required final String message}) =
      _$IncomeSuccessImpl;

  String get message;
  @JsonKey(ignore: true)
  _$$IncomeSuccessImplCopyWith<_$IncomeSuccessImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$IncomeErrorImplCopyWith<$Res> {
  factory _$$IncomeErrorImplCopyWith(
    _$IncomeErrorImpl value,
    $Res Function(_$IncomeErrorImpl) then,
  ) = __$$IncomeErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$IncomeErrorImplCopyWithImpl<$Res>
    extends _$IncomeStateCopyWithImpl<$Res, _$IncomeErrorImpl>
    implements _$$IncomeErrorImplCopyWith<$Res> {
  __$$IncomeErrorImplCopyWithImpl(
    _$IncomeErrorImpl _value,
    $Res Function(_$IncomeErrorImpl) _then,
  ) : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? message = null}) {
    return _then(
      _$IncomeErrorImpl(
        message: null == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$IncomeErrorImpl implements IncomeError {
  const _$IncomeErrorImpl({required this.message});

  @override
  final String message;

  @override
  String toString() {
    return 'IncomeState.error(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$IncomeErrorImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$IncomeErrorImplCopyWith<_$IncomeErrorImpl> get copyWith =>
      __$$IncomeErrorImplCopyWithImpl<_$IncomeErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Income> incomes) loaded,
    required TResult Function(double total) totalCalculated,
    required TResult Function(String message) success,
    required TResult Function(String message) error,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Income> incomes)? loaded,
    TResult? Function(double total)? totalCalculated,
    TResult? Function(String message)? success,
    TResult? Function(String message)? error,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Income> incomes)? loaded,
    TResult Function(double total)? totalCalculated,
    TResult Function(String message)? success,
    TResult Function(String message)? error,
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
    required TResult Function(IncomeInitial value) initial,
    required TResult Function(IncomeLoading value) loading,
    required TResult Function(IncomeLoaded value) loaded,
    required TResult Function(IncomeTotalCalculated value) totalCalculated,
    required TResult Function(IncomeSuccess value) success,
    required TResult Function(IncomeError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(IncomeInitial value)? initial,
    TResult? Function(IncomeLoading value)? loading,
    TResult? Function(IncomeLoaded value)? loaded,
    TResult? Function(IncomeTotalCalculated value)? totalCalculated,
    TResult? Function(IncomeSuccess value)? success,
    TResult? Function(IncomeError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(IncomeInitial value)? initial,
    TResult Function(IncomeLoading value)? loading,
    TResult Function(IncomeLoaded value)? loaded,
    TResult Function(IncomeTotalCalculated value)? totalCalculated,
    TResult Function(IncomeSuccess value)? success,
    TResult Function(IncomeError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class IncomeError implements IncomeState {
  const factory IncomeError({required final String message}) =
      _$IncomeErrorImpl;

  String get message;
  @JsonKey(ignore: true)
  _$$IncomeErrorImplCopyWith<_$IncomeErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
