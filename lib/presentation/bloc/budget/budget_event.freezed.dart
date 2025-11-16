// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'budget_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$BudgetEvent {
  String get userId => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String userId) loadBudgets,
    required TResult Function(String userId, DateTime month)
        loadBudgetsForMonth,
    required TResult Function(
            String userId, String category, double limit, DateTime month)
        createBudget,
    required TResult Function(String id, String userId, String category,
            double limit, String month, double spent, DateTime createdAt)
        updateBudget,
    required TResult Function(String userId, String budgetId) deleteBudget,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String userId)? loadBudgets,
    TResult? Function(String userId, DateTime month)? loadBudgetsForMonth,
    TResult? Function(
            String userId, String category, double limit, DateTime month)?
        createBudget,
    TResult? Function(String id, String userId, String category, double limit,
            String month, double spent, DateTime createdAt)?
        updateBudget,
    TResult? Function(String userId, String budgetId)? deleteBudget,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String userId)? loadBudgets,
    TResult Function(String userId, DateTime month)? loadBudgetsForMonth,
    TResult Function(
            String userId, String category, double limit, DateTime month)?
        createBudget,
    TResult Function(String id, String userId, String category, double limit,
            String month, double spent, DateTime createdAt)?
        updateBudget,
    TResult Function(String userId, String budgetId)? deleteBudget,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadBudgets value) loadBudgets,
    required TResult Function(LoadBudgetsForMonth value) loadBudgetsForMonth,
    required TResult Function(CreateBudget value) createBudget,
    required TResult Function(UpdateBudget value) updateBudget,
    required TResult Function(DeleteBudget value) deleteBudget,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadBudgets value)? loadBudgets,
    TResult? Function(LoadBudgetsForMonth value)? loadBudgetsForMonth,
    TResult? Function(CreateBudget value)? createBudget,
    TResult? Function(UpdateBudget value)? updateBudget,
    TResult? Function(DeleteBudget value)? deleteBudget,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadBudgets value)? loadBudgets,
    TResult Function(LoadBudgetsForMonth value)? loadBudgetsForMonth,
    TResult Function(CreateBudget value)? createBudget,
    TResult Function(UpdateBudget value)? updateBudget,
    TResult Function(DeleteBudget value)? deleteBudget,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BudgetEventCopyWith<BudgetEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BudgetEventCopyWith<$Res> {
  factory $BudgetEventCopyWith(
          BudgetEvent value, $Res Function(BudgetEvent) then) =
      _$BudgetEventCopyWithImpl<$Res, BudgetEvent>;
  @useResult
  $Res call({String userId});
}

/// @nodoc
class _$BudgetEventCopyWithImpl<$Res, $Val extends BudgetEvent>
    implements $BudgetEventCopyWith<$Res> {
  _$BudgetEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
  }) {
    return _then(_value.copyWith(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LoadBudgetsImplCopyWith<$Res>
    implements $BudgetEventCopyWith<$Res> {
  factory _$$LoadBudgetsImplCopyWith(
          _$LoadBudgetsImpl value, $Res Function(_$LoadBudgetsImpl) then) =
      __$$LoadBudgetsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String userId});
}

/// @nodoc
class __$$LoadBudgetsImplCopyWithImpl<$Res>
    extends _$BudgetEventCopyWithImpl<$Res, _$LoadBudgetsImpl>
    implements _$$LoadBudgetsImplCopyWith<$Res> {
  __$$LoadBudgetsImplCopyWithImpl(
      _$LoadBudgetsImpl _value, $Res Function(_$LoadBudgetsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
  }) {
    return _then(_$LoadBudgetsImpl(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$LoadBudgetsImpl implements LoadBudgets {
  const _$LoadBudgetsImpl({required this.userId});

  @override
  final String userId;

  @override
  String toString() {
    return 'BudgetEvent.loadBudgets(userId: $userId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadBudgetsImpl &&
            (identical(other.userId, userId) || other.userId == userId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, userId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadBudgetsImplCopyWith<_$LoadBudgetsImpl> get copyWith =>
      __$$LoadBudgetsImplCopyWithImpl<_$LoadBudgetsImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String userId) loadBudgets,
    required TResult Function(String userId, DateTime month)
        loadBudgetsForMonth,
    required TResult Function(
            String userId, String category, double limit, DateTime month)
        createBudget,
    required TResult Function(String id, String userId, String category,
            double limit, String month, double spent, DateTime createdAt)
        updateBudget,
    required TResult Function(String userId, String budgetId) deleteBudget,
  }) {
    return loadBudgets(userId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String userId)? loadBudgets,
    TResult? Function(String userId, DateTime month)? loadBudgetsForMonth,
    TResult? Function(
            String userId, String category, double limit, DateTime month)?
        createBudget,
    TResult? Function(String id, String userId, String category, double limit,
            String month, double spent, DateTime createdAt)?
        updateBudget,
    TResult? Function(String userId, String budgetId)? deleteBudget,
  }) {
    return loadBudgets?.call(userId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String userId)? loadBudgets,
    TResult Function(String userId, DateTime month)? loadBudgetsForMonth,
    TResult Function(
            String userId, String category, double limit, DateTime month)?
        createBudget,
    TResult Function(String id, String userId, String category, double limit,
            String month, double spent, DateTime createdAt)?
        updateBudget,
    TResult Function(String userId, String budgetId)? deleteBudget,
    required TResult orElse(),
  }) {
    if (loadBudgets != null) {
      return loadBudgets(userId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadBudgets value) loadBudgets,
    required TResult Function(LoadBudgetsForMonth value) loadBudgetsForMonth,
    required TResult Function(CreateBudget value) createBudget,
    required TResult Function(UpdateBudget value) updateBudget,
    required TResult Function(DeleteBudget value) deleteBudget,
  }) {
    return loadBudgets(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadBudgets value)? loadBudgets,
    TResult? Function(LoadBudgetsForMonth value)? loadBudgetsForMonth,
    TResult? Function(CreateBudget value)? createBudget,
    TResult? Function(UpdateBudget value)? updateBudget,
    TResult? Function(DeleteBudget value)? deleteBudget,
  }) {
    return loadBudgets?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadBudgets value)? loadBudgets,
    TResult Function(LoadBudgetsForMonth value)? loadBudgetsForMonth,
    TResult Function(CreateBudget value)? createBudget,
    TResult Function(UpdateBudget value)? updateBudget,
    TResult Function(DeleteBudget value)? deleteBudget,
    required TResult orElse(),
  }) {
    if (loadBudgets != null) {
      return loadBudgets(this);
    }
    return orElse();
  }
}

abstract class LoadBudgets implements BudgetEvent {
  const factory LoadBudgets({required final String userId}) = _$LoadBudgetsImpl;

  @override
  String get userId;
  @override
  @JsonKey(ignore: true)
  _$$LoadBudgetsImplCopyWith<_$LoadBudgetsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadBudgetsForMonthImplCopyWith<$Res>
    implements $BudgetEventCopyWith<$Res> {
  factory _$$LoadBudgetsForMonthImplCopyWith(_$LoadBudgetsForMonthImpl value,
          $Res Function(_$LoadBudgetsForMonthImpl) then) =
      __$$LoadBudgetsForMonthImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String userId, DateTime month});
}

/// @nodoc
class __$$LoadBudgetsForMonthImplCopyWithImpl<$Res>
    extends _$BudgetEventCopyWithImpl<$Res, _$LoadBudgetsForMonthImpl>
    implements _$$LoadBudgetsForMonthImplCopyWith<$Res> {
  __$$LoadBudgetsForMonthImplCopyWithImpl(_$LoadBudgetsForMonthImpl _value,
      $Res Function(_$LoadBudgetsForMonthImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? month = null,
  }) {
    return _then(_$LoadBudgetsForMonthImpl(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      month: null == month
          ? _value.month
          : month // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

class _$LoadBudgetsForMonthImpl implements LoadBudgetsForMonth {
  const _$LoadBudgetsForMonthImpl({required this.userId, required this.month});

  @override
  final String userId;
  @override
  final DateTime month;

  @override
  String toString() {
    return 'BudgetEvent.loadBudgetsForMonth(userId: $userId, month: $month)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadBudgetsForMonthImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.month, month) || other.month == month));
  }

  @override
  int get hashCode => Object.hash(runtimeType, userId, month);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadBudgetsForMonthImplCopyWith<_$LoadBudgetsForMonthImpl> get copyWith =>
      __$$LoadBudgetsForMonthImplCopyWithImpl<_$LoadBudgetsForMonthImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String userId) loadBudgets,
    required TResult Function(String userId, DateTime month)
        loadBudgetsForMonth,
    required TResult Function(
            String userId, String category, double limit, DateTime month)
        createBudget,
    required TResult Function(String id, String userId, String category,
            double limit, String month, double spent, DateTime createdAt)
        updateBudget,
    required TResult Function(String userId, String budgetId) deleteBudget,
  }) {
    return loadBudgetsForMonth(userId, month);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String userId)? loadBudgets,
    TResult? Function(String userId, DateTime month)? loadBudgetsForMonth,
    TResult? Function(
            String userId, String category, double limit, DateTime month)?
        createBudget,
    TResult? Function(String id, String userId, String category, double limit,
            String month, double spent, DateTime createdAt)?
        updateBudget,
    TResult? Function(String userId, String budgetId)? deleteBudget,
  }) {
    return loadBudgetsForMonth?.call(userId, month);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String userId)? loadBudgets,
    TResult Function(String userId, DateTime month)? loadBudgetsForMonth,
    TResult Function(
            String userId, String category, double limit, DateTime month)?
        createBudget,
    TResult Function(String id, String userId, String category, double limit,
            String month, double spent, DateTime createdAt)?
        updateBudget,
    TResult Function(String userId, String budgetId)? deleteBudget,
    required TResult orElse(),
  }) {
    if (loadBudgetsForMonth != null) {
      return loadBudgetsForMonth(userId, month);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadBudgets value) loadBudgets,
    required TResult Function(LoadBudgetsForMonth value) loadBudgetsForMonth,
    required TResult Function(CreateBudget value) createBudget,
    required TResult Function(UpdateBudget value) updateBudget,
    required TResult Function(DeleteBudget value) deleteBudget,
  }) {
    return loadBudgetsForMonth(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadBudgets value)? loadBudgets,
    TResult? Function(LoadBudgetsForMonth value)? loadBudgetsForMonth,
    TResult? Function(CreateBudget value)? createBudget,
    TResult? Function(UpdateBudget value)? updateBudget,
    TResult? Function(DeleteBudget value)? deleteBudget,
  }) {
    return loadBudgetsForMonth?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadBudgets value)? loadBudgets,
    TResult Function(LoadBudgetsForMonth value)? loadBudgetsForMonth,
    TResult Function(CreateBudget value)? createBudget,
    TResult Function(UpdateBudget value)? updateBudget,
    TResult Function(DeleteBudget value)? deleteBudget,
    required TResult orElse(),
  }) {
    if (loadBudgetsForMonth != null) {
      return loadBudgetsForMonth(this);
    }
    return orElse();
  }
}

abstract class LoadBudgetsForMonth implements BudgetEvent {
  const factory LoadBudgetsForMonth(
      {required final String userId,
      required final DateTime month}) = _$LoadBudgetsForMonthImpl;

  @override
  String get userId;
  DateTime get month;
  @override
  @JsonKey(ignore: true)
  _$$LoadBudgetsForMonthImplCopyWith<_$LoadBudgetsForMonthImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CreateBudgetImplCopyWith<$Res>
    implements $BudgetEventCopyWith<$Res> {
  factory _$$CreateBudgetImplCopyWith(
          _$CreateBudgetImpl value, $Res Function(_$CreateBudgetImpl) then) =
      __$$CreateBudgetImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String userId, String category, double limit, DateTime month});
}

/// @nodoc
class __$$CreateBudgetImplCopyWithImpl<$Res>
    extends _$BudgetEventCopyWithImpl<$Res, _$CreateBudgetImpl>
    implements _$$CreateBudgetImplCopyWith<$Res> {
  __$$CreateBudgetImplCopyWithImpl(
      _$CreateBudgetImpl _value, $Res Function(_$CreateBudgetImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? category = null,
    Object? limit = null,
    Object? month = null,
  }) {
    return _then(_$CreateBudgetImpl(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      limit: null == limit
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as double,
      month: null == month
          ? _value.month
          : month // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

class _$CreateBudgetImpl implements CreateBudget {
  const _$CreateBudgetImpl(
      {required this.userId,
      required this.category,
      required this.limit,
      required this.month});

  @override
  final String userId;
  @override
  final String category;
  @override
  final double limit;
  @override
  final DateTime month;

  @override
  String toString() {
    return 'BudgetEvent.createBudget(userId: $userId, category: $category, limit: $limit, month: $month)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateBudgetImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.limit, limit) || other.limit == limit) &&
            (identical(other.month, month) || other.month == month));
  }

  @override
  int get hashCode => Object.hash(runtimeType, userId, category, limit, month);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateBudgetImplCopyWith<_$CreateBudgetImpl> get copyWith =>
      __$$CreateBudgetImplCopyWithImpl<_$CreateBudgetImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String userId) loadBudgets,
    required TResult Function(String userId, DateTime month)
        loadBudgetsForMonth,
    required TResult Function(
            String userId, String category, double limit, DateTime month)
        createBudget,
    required TResult Function(String id, String userId, String category,
            double limit, String month, double spent, DateTime createdAt)
        updateBudget,
    required TResult Function(String userId, String budgetId) deleteBudget,
  }) {
    return createBudget(userId, category, limit, month);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String userId)? loadBudgets,
    TResult? Function(String userId, DateTime month)? loadBudgetsForMonth,
    TResult? Function(
            String userId, String category, double limit, DateTime month)?
        createBudget,
    TResult? Function(String id, String userId, String category, double limit,
            String month, double spent, DateTime createdAt)?
        updateBudget,
    TResult? Function(String userId, String budgetId)? deleteBudget,
  }) {
    return createBudget?.call(userId, category, limit, month);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String userId)? loadBudgets,
    TResult Function(String userId, DateTime month)? loadBudgetsForMonth,
    TResult Function(
            String userId, String category, double limit, DateTime month)?
        createBudget,
    TResult Function(String id, String userId, String category, double limit,
            String month, double spent, DateTime createdAt)?
        updateBudget,
    TResult Function(String userId, String budgetId)? deleteBudget,
    required TResult orElse(),
  }) {
    if (createBudget != null) {
      return createBudget(userId, category, limit, month);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadBudgets value) loadBudgets,
    required TResult Function(LoadBudgetsForMonth value) loadBudgetsForMonth,
    required TResult Function(CreateBudget value) createBudget,
    required TResult Function(UpdateBudget value) updateBudget,
    required TResult Function(DeleteBudget value) deleteBudget,
  }) {
    return createBudget(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadBudgets value)? loadBudgets,
    TResult? Function(LoadBudgetsForMonth value)? loadBudgetsForMonth,
    TResult? Function(CreateBudget value)? createBudget,
    TResult? Function(UpdateBudget value)? updateBudget,
    TResult? Function(DeleteBudget value)? deleteBudget,
  }) {
    return createBudget?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadBudgets value)? loadBudgets,
    TResult Function(LoadBudgetsForMonth value)? loadBudgetsForMonth,
    TResult Function(CreateBudget value)? createBudget,
    TResult Function(UpdateBudget value)? updateBudget,
    TResult Function(DeleteBudget value)? deleteBudget,
    required TResult orElse(),
  }) {
    if (createBudget != null) {
      return createBudget(this);
    }
    return orElse();
  }
}

abstract class CreateBudget implements BudgetEvent {
  const factory CreateBudget(
      {required final String userId,
      required final String category,
      required final double limit,
      required final DateTime month}) = _$CreateBudgetImpl;

  @override
  String get userId;
  String get category;
  double get limit;
  DateTime get month;
  @override
  @JsonKey(ignore: true)
  _$$CreateBudgetImplCopyWith<_$CreateBudgetImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UpdateBudgetImplCopyWith<$Res>
    implements $BudgetEventCopyWith<$Res> {
  factory _$$UpdateBudgetImplCopyWith(
          _$UpdateBudgetImpl value, $Res Function(_$UpdateBudgetImpl) then) =
      __$$UpdateBudgetImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String userId,
      String category,
      double limit,
      String month,
      double spent,
      DateTime createdAt});
}

/// @nodoc
class __$$UpdateBudgetImplCopyWithImpl<$Res>
    extends _$BudgetEventCopyWithImpl<$Res, _$UpdateBudgetImpl>
    implements _$$UpdateBudgetImplCopyWith<$Res> {
  __$$UpdateBudgetImplCopyWithImpl(
      _$UpdateBudgetImpl _value, $Res Function(_$UpdateBudgetImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? category = null,
    Object? limit = null,
    Object? month = null,
    Object? spent = null,
    Object? createdAt = null,
  }) {
    return _then(_$UpdateBudgetImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      limit: null == limit
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as double,
      month: null == month
          ? _value.month
          : month // ignore: cast_nullable_to_non_nullable
              as String,
      spent: null == spent
          ? _value.spent
          : spent // ignore: cast_nullable_to_non_nullable
              as double,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

class _$UpdateBudgetImpl implements UpdateBudget {
  const _$UpdateBudgetImpl(
      {required this.id,
      required this.userId,
      required this.category,
      required this.limit,
      required this.month,
      required this.spent,
      required this.createdAt});

  @override
  final String id;
  @override
  final String userId;
  @override
  final String category;
  @override
  final double limit;
  @override
  final String month;
  @override
  final double spent;
  @override
  final DateTime createdAt;

  @override
  String toString() {
    return 'BudgetEvent.updateBudget(id: $id, userId: $userId, category: $category, limit: $limit, month: $month, spent: $spent, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateBudgetImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.limit, limit) || other.limit == limit) &&
            (identical(other.month, month) || other.month == month) &&
            (identical(other.spent, spent) || other.spent == spent) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, id, userId, category, limit, month, spent, createdAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateBudgetImplCopyWith<_$UpdateBudgetImpl> get copyWith =>
      __$$UpdateBudgetImplCopyWithImpl<_$UpdateBudgetImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String userId) loadBudgets,
    required TResult Function(String userId, DateTime month)
        loadBudgetsForMonth,
    required TResult Function(
            String userId, String category, double limit, DateTime month)
        createBudget,
    required TResult Function(String id, String userId, String category,
            double limit, String month, double spent, DateTime createdAt)
        updateBudget,
    required TResult Function(String userId, String budgetId) deleteBudget,
  }) {
    return updateBudget(id, userId, category, limit, month, spent, createdAt);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String userId)? loadBudgets,
    TResult? Function(String userId, DateTime month)? loadBudgetsForMonth,
    TResult? Function(
            String userId, String category, double limit, DateTime month)?
        createBudget,
    TResult? Function(String id, String userId, String category, double limit,
            String month, double spent, DateTime createdAt)?
        updateBudget,
    TResult? Function(String userId, String budgetId)? deleteBudget,
  }) {
    return updateBudget?.call(
        id, userId, category, limit, month, spent, createdAt);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String userId)? loadBudgets,
    TResult Function(String userId, DateTime month)? loadBudgetsForMonth,
    TResult Function(
            String userId, String category, double limit, DateTime month)?
        createBudget,
    TResult Function(String id, String userId, String category, double limit,
            String month, double spent, DateTime createdAt)?
        updateBudget,
    TResult Function(String userId, String budgetId)? deleteBudget,
    required TResult orElse(),
  }) {
    if (updateBudget != null) {
      return updateBudget(id, userId, category, limit, month, spent, createdAt);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadBudgets value) loadBudgets,
    required TResult Function(LoadBudgetsForMonth value) loadBudgetsForMonth,
    required TResult Function(CreateBudget value) createBudget,
    required TResult Function(UpdateBudget value) updateBudget,
    required TResult Function(DeleteBudget value) deleteBudget,
  }) {
    return updateBudget(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadBudgets value)? loadBudgets,
    TResult? Function(LoadBudgetsForMonth value)? loadBudgetsForMonth,
    TResult? Function(CreateBudget value)? createBudget,
    TResult? Function(UpdateBudget value)? updateBudget,
    TResult? Function(DeleteBudget value)? deleteBudget,
  }) {
    return updateBudget?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadBudgets value)? loadBudgets,
    TResult Function(LoadBudgetsForMonth value)? loadBudgetsForMonth,
    TResult Function(CreateBudget value)? createBudget,
    TResult Function(UpdateBudget value)? updateBudget,
    TResult Function(DeleteBudget value)? deleteBudget,
    required TResult orElse(),
  }) {
    if (updateBudget != null) {
      return updateBudget(this);
    }
    return orElse();
  }
}

abstract class UpdateBudget implements BudgetEvent {
  const factory UpdateBudget(
      {required final String id,
      required final String userId,
      required final String category,
      required final double limit,
      required final String month,
      required final double spent,
      required final DateTime createdAt}) = _$UpdateBudgetImpl;

  String get id;
  @override
  String get userId;
  String get category;
  double get limit;
  String get month;
  double get spent;
  DateTime get createdAt;
  @override
  @JsonKey(ignore: true)
  _$$UpdateBudgetImplCopyWith<_$UpdateBudgetImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DeleteBudgetImplCopyWith<$Res>
    implements $BudgetEventCopyWith<$Res> {
  factory _$$DeleteBudgetImplCopyWith(
          _$DeleteBudgetImpl value, $Res Function(_$DeleteBudgetImpl) then) =
      __$$DeleteBudgetImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String userId, String budgetId});
}

/// @nodoc
class __$$DeleteBudgetImplCopyWithImpl<$Res>
    extends _$BudgetEventCopyWithImpl<$Res, _$DeleteBudgetImpl>
    implements _$$DeleteBudgetImplCopyWith<$Res> {
  __$$DeleteBudgetImplCopyWithImpl(
      _$DeleteBudgetImpl _value, $Res Function(_$DeleteBudgetImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? budgetId = null,
  }) {
    return _then(_$DeleteBudgetImpl(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      budgetId: null == budgetId
          ? _value.budgetId
          : budgetId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$DeleteBudgetImpl implements DeleteBudget {
  const _$DeleteBudgetImpl({required this.userId, required this.budgetId});

  @override
  final String userId;
  @override
  final String budgetId;

  @override
  String toString() {
    return 'BudgetEvent.deleteBudget(userId: $userId, budgetId: $budgetId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeleteBudgetImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.budgetId, budgetId) ||
                other.budgetId == budgetId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, userId, budgetId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DeleteBudgetImplCopyWith<_$DeleteBudgetImpl> get copyWith =>
      __$$DeleteBudgetImplCopyWithImpl<_$DeleteBudgetImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String userId) loadBudgets,
    required TResult Function(String userId, DateTime month)
        loadBudgetsForMonth,
    required TResult Function(
            String userId, String category, double limit, DateTime month)
        createBudget,
    required TResult Function(String id, String userId, String category,
            double limit, String month, double spent, DateTime createdAt)
        updateBudget,
    required TResult Function(String userId, String budgetId) deleteBudget,
  }) {
    return deleteBudget(userId, budgetId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String userId)? loadBudgets,
    TResult? Function(String userId, DateTime month)? loadBudgetsForMonth,
    TResult? Function(
            String userId, String category, double limit, DateTime month)?
        createBudget,
    TResult? Function(String id, String userId, String category, double limit,
            String month, double spent, DateTime createdAt)?
        updateBudget,
    TResult? Function(String userId, String budgetId)? deleteBudget,
  }) {
    return deleteBudget?.call(userId, budgetId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String userId)? loadBudgets,
    TResult Function(String userId, DateTime month)? loadBudgetsForMonth,
    TResult Function(
            String userId, String category, double limit, DateTime month)?
        createBudget,
    TResult Function(String id, String userId, String category, double limit,
            String month, double spent, DateTime createdAt)?
        updateBudget,
    TResult Function(String userId, String budgetId)? deleteBudget,
    required TResult orElse(),
  }) {
    if (deleteBudget != null) {
      return deleteBudget(userId, budgetId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadBudgets value) loadBudgets,
    required TResult Function(LoadBudgetsForMonth value) loadBudgetsForMonth,
    required TResult Function(CreateBudget value) createBudget,
    required TResult Function(UpdateBudget value) updateBudget,
    required TResult Function(DeleteBudget value) deleteBudget,
  }) {
    return deleteBudget(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadBudgets value)? loadBudgets,
    TResult? Function(LoadBudgetsForMonth value)? loadBudgetsForMonth,
    TResult? Function(CreateBudget value)? createBudget,
    TResult? Function(UpdateBudget value)? updateBudget,
    TResult? Function(DeleteBudget value)? deleteBudget,
  }) {
    return deleteBudget?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadBudgets value)? loadBudgets,
    TResult Function(LoadBudgetsForMonth value)? loadBudgetsForMonth,
    TResult Function(CreateBudget value)? createBudget,
    TResult Function(UpdateBudget value)? updateBudget,
    TResult Function(DeleteBudget value)? deleteBudget,
    required TResult orElse(),
  }) {
    if (deleteBudget != null) {
      return deleteBudget(this);
    }
    return orElse();
  }
}

abstract class DeleteBudget implements BudgetEvent {
  const factory DeleteBudget(
      {required final String userId,
      required final String budgetId}) = _$DeleteBudgetImpl;

  @override
  String get userId;
  String get budgetId;
  @override
  @JsonKey(ignore: true)
  _$$DeleteBudgetImplCopyWith<_$DeleteBudgetImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
