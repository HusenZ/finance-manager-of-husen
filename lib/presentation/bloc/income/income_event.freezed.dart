// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'income_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$IncomeEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String userId) loadIncomes,
    required TResult Function(String userId, DateTime month)
        loadIncomesForMonth,
    required TResult Function(
            String userId,
            double amount,
            String source,
            String description,
            DateTime date,
            String? notes,
            bool isRecurring,
            String? recurrenceFrequency)
        createIncome,
    required TResult Function(Income income) updateIncome,
    required TResult Function(String userId, String incomeId) deleteIncome,
    required TResult Function(String userId, String query) searchIncomes,
    required TResult Function(String userId, String source) filterBySource,
    required TResult Function(String userId) getRecurringIncomes,
    required TResult Function(String userId, DateTime month)
        getTotalIncomeForMonth,
    required TResult Function(String userId) syncIncomes,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String userId)? loadIncomes,
    TResult? Function(String userId, DateTime month)? loadIncomesForMonth,
    TResult? Function(
            String userId,
            double amount,
            String source,
            String description,
            DateTime date,
            String? notes,
            bool isRecurring,
            String? recurrenceFrequency)?
        createIncome,
    TResult? Function(Income income)? updateIncome,
    TResult? Function(String userId, String incomeId)? deleteIncome,
    TResult? Function(String userId, String query)? searchIncomes,
    TResult? Function(String userId, String source)? filterBySource,
    TResult? Function(String userId)? getRecurringIncomes,
    TResult? Function(String userId, DateTime month)? getTotalIncomeForMonth,
    TResult? Function(String userId)? syncIncomes,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String userId)? loadIncomes,
    TResult Function(String userId, DateTime month)? loadIncomesForMonth,
    TResult Function(
            String userId,
            double amount,
            String source,
            String description,
            DateTime date,
            String? notes,
            bool isRecurring,
            String? recurrenceFrequency)?
        createIncome,
    TResult Function(Income income)? updateIncome,
    TResult Function(String userId, String incomeId)? deleteIncome,
    TResult Function(String userId, String query)? searchIncomes,
    TResult Function(String userId, String source)? filterBySource,
    TResult Function(String userId)? getRecurringIncomes,
    TResult Function(String userId, DateTime month)? getTotalIncomeForMonth,
    TResult Function(String userId)? syncIncomes,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadIncomesEvent value) loadIncomes,
    required TResult Function(LoadIncomesForMonthEvent value)
        loadIncomesForMonth,
    required TResult Function(CreateIncomeEvent value) createIncome,
    required TResult Function(UpdateIncomeEvent value) updateIncome,
    required TResult Function(DeleteIncomeEvent value) deleteIncome,
    required TResult Function(SearchIncomesEvent value) searchIncomes,
    required TResult Function(FilterBySourceEvent value) filterBySource,
    required TResult Function(GetRecurringIncomesEvent value)
        getRecurringIncomes,
    required TResult Function(GetTotalIncomeForMonthEvent value)
        getTotalIncomeForMonth,
    required TResult Function(SyncIncomesEvent value) syncIncomes,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadIncomesEvent value)? loadIncomes,
    TResult? Function(LoadIncomesForMonthEvent value)? loadIncomesForMonth,
    TResult? Function(CreateIncomeEvent value)? createIncome,
    TResult? Function(UpdateIncomeEvent value)? updateIncome,
    TResult? Function(DeleteIncomeEvent value)? deleteIncome,
    TResult? Function(SearchIncomesEvent value)? searchIncomes,
    TResult? Function(FilterBySourceEvent value)? filterBySource,
    TResult? Function(GetRecurringIncomesEvent value)? getRecurringIncomes,
    TResult? Function(GetTotalIncomeForMonthEvent value)?
        getTotalIncomeForMonth,
    TResult? Function(SyncIncomesEvent value)? syncIncomes,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadIncomesEvent value)? loadIncomes,
    TResult Function(LoadIncomesForMonthEvent value)? loadIncomesForMonth,
    TResult Function(CreateIncomeEvent value)? createIncome,
    TResult Function(UpdateIncomeEvent value)? updateIncome,
    TResult Function(DeleteIncomeEvent value)? deleteIncome,
    TResult Function(SearchIncomesEvent value)? searchIncomes,
    TResult Function(FilterBySourceEvent value)? filterBySource,
    TResult Function(GetRecurringIncomesEvent value)? getRecurringIncomes,
    TResult Function(GetTotalIncomeForMonthEvent value)? getTotalIncomeForMonth,
    TResult Function(SyncIncomesEvent value)? syncIncomes,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IncomeEventCopyWith<$Res> {
  factory $IncomeEventCopyWith(
          IncomeEvent value, $Res Function(IncomeEvent) then) =
      _$IncomeEventCopyWithImpl<$Res, IncomeEvent>;
}

/// @nodoc
class _$IncomeEventCopyWithImpl<$Res, $Val extends IncomeEvent>
    implements $IncomeEventCopyWith<$Res> {
  _$IncomeEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$LoadIncomesEventImplCopyWith<$Res> {
  factory _$$LoadIncomesEventImplCopyWith(_$LoadIncomesEventImpl value,
          $Res Function(_$LoadIncomesEventImpl) then) =
      __$$LoadIncomesEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String userId});
}

/// @nodoc
class __$$LoadIncomesEventImplCopyWithImpl<$Res>
    extends _$IncomeEventCopyWithImpl<$Res, _$LoadIncomesEventImpl>
    implements _$$LoadIncomesEventImplCopyWith<$Res> {
  __$$LoadIncomesEventImplCopyWithImpl(_$LoadIncomesEventImpl _value,
      $Res Function(_$LoadIncomesEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
  }) {
    return _then(_$LoadIncomesEventImpl(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$LoadIncomesEventImpl implements LoadIncomesEvent {
  const _$LoadIncomesEventImpl({required this.userId});

  @override
  final String userId;

  @override
  String toString() {
    return 'IncomeEvent.loadIncomes(userId: $userId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadIncomesEventImpl &&
            (identical(other.userId, userId) || other.userId == userId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, userId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadIncomesEventImplCopyWith<_$LoadIncomesEventImpl> get copyWith =>
      __$$LoadIncomesEventImplCopyWithImpl<_$LoadIncomesEventImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String userId) loadIncomes,
    required TResult Function(String userId, DateTime month)
        loadIncomesForMonth,
    required TResult Function(
            String userId,
            double amount,
            String source,
            String description,
            DateTime date,
            String? notes,
            bool isRecurring,
            String? recurrenceFrequency)
        createIncome,
    required TResult Function(Income income) updateIncome,
    required TResult Function(String userId, String incomeId) deleteIncome,
    required TResult Function(String userId, String query) searchIncomes,
    required TResult Function(String userId, String source) filterBySource,
    required TResult Function(String userId) getRecurringIncomes,
    required TResult Function(String userId, DateTime month)
        getTotalIncomeForMonth,
    required TResult Function(String userId) syncIncomes,
  }) {
    return loadIncomes(userId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String userId)? loadIncomes,
    TResult? Function(String userId, DateTime month)? loadIncomesForMonth,
    TResult? Function(
            String userId,
            double amount,
            String source,
            String description,
            DateTime date,
            String? notes,
            bool isRecurring,
            String? recurrenceFrequency)?
        createIncome,
    TResult? Function(Income income)? updateIncome,
    TResult? Function(String userId, String incomeId)? deleteIncome,
    TResult? Function(String userId, String query)? searchIncomes,
    TResult? Function(String userId, String source)? filterBySource,
    TResult? Function(String userId)? getRecurringIncomes,
    TResult? Function(String userId, DateTime month)? getTotalIncomeForMonth,
    TResult? Function(String userId)? syncIncomes,
  }) {
    return loadIncomes?.call(userId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String userId)? loadIncomes,
    TResult Function(String userId, DateTime month)? loadIncomesForMonth,
    TResult Function(
            String userId,
            double amount,
            String source,
            String description,
            DateTime date,
            String? notes,
            bool isRecurring,
            String? recurrenceFrequency)?
        createIncome,
    TResult Function(Income income)? updateIncome,
    TResult Function(String userId, String incomeId)? deleteIncome,
    TResult Function(String userId, String query)? searchIncomes,
    TResult Function(String userId, String source)? filterBySource,
    TResult Function(String userId)? getRecurringIncomes,
    TResult Function(String userId, DateTime month)? getTotalIncomeForMonth,
    TResult Function(String userId)? syncIncomes,
    required TResult orElse(),
  }) {
    if (loadIncomes != null) {
      return loadIncomes(userId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadIncomesEvent value) loadIncomes,
    required TResult Function(LoadIncomesForMonthEvent value)
        loadIncomesForMonth,
    required TResult Function(CreateIncomeEvent value) createIncome,
    required TResult Function(UpdateIncomeEvent value) updateIncome,
    required TResult Function(DeleteIncomeEvent value) deleteIncome,
    required TResult Function(SearchIncomesEvent value) searchIncomes,
    required TResult Function(FilterBySourceEvent value) filterBySource,
    required TResult Function(GetRecurringIncomesEvent value)
        getRecurringIncomes,
    required TResult Function(GetTotalIncomeForMonthEvent value)
        getTotalIncomeForMonth,
    required TResult Function(SyncIncomesEvent value) syncIncomes,
  }) {
    return loadIncomes(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadIncomesEvent value)? loadIncomes,
    TResult? Function(LoadIncomesForMonthEvent value)? loadIncomesForMonth,
    TResult? Function(CreateIncomeEvent value)? createIncome,
    TResult? Function(UpdateIncomeEvent value)? updateIncome,
    TResult? Function(DeleteIncomeEvent value)? deleteIncome,
    TResult? Function(SearchIncomesEvent value)? searchIncomes,
    TResult? Function(FilterBySourceEvent value)? filterBySource,
    TResult? Function(GetRecurringIncomesEvent value)? getRecurringIncomes,
    TResult? Function(GetTotalIncomeForMonthEvent value)?
        getTotalIncomeForMonth,
    TResult? Function(SyncIncomesEvent value)? syncIncomes,
  }) {
    return loadIncomes?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadIncomesEvent value)? loadIncomes,
    TResult Function(LoadIncomesForMonthEvent value)? loadIncomesForMonth,
    TResult Function(CreateIncomeEvent value)? createIncome,
    TResult Function(UpdateIncomeEvent value)? updateIncome,
    TResult Function(DeleteIncomeEvent value)? deleteIncome,
    TResult Function(SearchIncomesEvent value)? searchIncomes,
    TResult Function(FilterBySourceEvent value)? filterBySource,
    TResult Function(GetRecurringIncomesEvent value)? getRecurringIncomes,
    TResult Function(GetTotalIncomeForMonthEvent value)? getTotalIncomeForMonth,
    TResult Function(SyncIncomesEvent value)? syncIncomes,
    required TResult orElse(),
  }) {
    if (loadIncomes != null) {
      return loadIncomes(this);
    }
    return orElse();
  }
}

abstract class LoadIncomesEvent implements IncomeEvent {
  const factory LoadIncomesEvent({required final String userId}) =
      _$LoadIncomesEventImpl;

  String get userId;
  @JsonKey(ignore: true)
  _$$LoadIncomesEventImplCopyWith<_$LoadIncomesEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadIncomesForMonthEventImplCopyWith<$Res> {
  factory _$$LoadIncomesForMonthEventImplCopyWith(
          _$LoadIncomesForMonthEventImpl value,
          $Res Function(_$LoadIncomesForMonthEventImpl) then) =
      __$$LoadIncomesForMonthEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String userId, DateTime month});
}

/// @nodoc
class __$$LoadIncomesForMonthEventImplCopyWithImpl<$Res>
    extends _$IncomeEventCopyWithImpl<$Res, _$LoadIncomesForMonthEventImpl>
    implements _$$LoadIncomesForMonthEventImplCopyWith<$Res> {
  __$$LoadIncomesForMonthEventImplCopyWithImpl(
      _$LoadIncomesForMonthEventImpl _value,
      $Res Function(_$LoadIncomesForMonthEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? month = null,
  }) {
    return _then(_$LoadIncomesForMonthEventImpl(
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

class _$LoadIncomesForMonthEventImpl implements LoadIncomesForMonthEvent {
  const _$LoadIncomesForMonthEventImpl(
      {required this.userId, required this.month});

  @override
  final String userId;
  @override
  final DateTime month;

  @override
  String toString() {
    return 'IncomeEvent.loadIncomesForMonth(userId: $userId, month: $month)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadIncomesForMonthEventImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.month, month) || other.month == month));
  }

  @override
  int get hashCode => Object.hash(runtimeType, userId, month);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadIncomesForMonthEventImplCopyWith<_$LoadIncomesForMonthEventImpl>
      get copyWith => __$$LoadIncomesForMonthEventImplCopyWithImpl<
          _$LoadIncomesForMonthEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String userId) loadIncomes,
    required TResult Function(String userId, DateTime month)
        loadIncomesForMonth,
    required TResult Function(
            String userId,
            double amount,
            String source,
            String description,
            DateTime date,
            String? notes,
            bool isRecurring,
            String? recurrenceFrequency)
        createIncome,
    required TResult Function(Income income) updateIncome,
    required TResult Function(String userId, String incomeId) deleteIncome,
    required TResult Function(String userId, String query) searchIncomes,
    required TResult Function(String userId, String source) filterBySource,
    required TResult Function(String userId) getRecurringIncomes,
    required TResult Function(String userId, DateTime month)
        getTotalIncomeForMonth,
    required TResult Function(String userId) syncIncomes,
  }) {
    return loadIncomesForMonth(userId, month);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String userId)? loadIncomes,
    TResult? Function(String userId, DateTime month)? loadIncomesForMonth,
    TResult? Function(
            String userId,
            double amount,
            String source,
            String description,
            DateTime date,
            String? notes,
            bool isRecurring,
            String? recurrenceFrequency)?
        createIncome,
    TResult? Function(Income income)? updateIncome,
    TResult? Function(String userId, String incomeId)? deleteIncome,
    TResult? Function(String userId, String query)? searchIncomes,
    TResult? Function(String userId, String source)? filterBySource,
    TResult? Function(String userId)? getRecurringIncomes,
    TResult? Function(String userId, DateTime month)? getTotalIncomeForMonth,
    TResult? Function(String userId)? syncIncomes,
  }) {
    return loadIncomesForMonth?.call(userId, month);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String userId)? loadIncomes,
    TResult Function(String userId, DateTime month)? loadIncomesForMonth,
    TResult Function(
            String userId,
            double amount,
            String source,
            String description,
            DateTime date,
            String? notes,
            bool isRecurring,
            String? recurrenceFrequency)?
        createIncome,
    TResult Function(Income income)? updateIncome,
    TResult Function(String userId, String incomeId)? deleteIncome,
    TResult Function(String userId, String query)? searchIncomes,
    TResult Function(String userId, String source)? filterBySource,
    TResult Function(String userId)? getRecurringIncomes,
    TResult Function(String userId, DateTime month)? getTotalIncomeForMonth,
    TResult Function(String userId)? syncIncomes,
    required TResult orElse(),
  }) {
    if (loadIncomesForMonth != null) {
      return loadIncomesForMonth(userId, month);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadIncomesEvent value) loadIncomes,
    required TResult Function(LoadIncomesForMonthEvent value)
        loadIncomesForMonth,
    required TResult Function(CreateIncomeEvent value) createIncome,
    required TResult Function(UpdateIncomeEvent value) updateIncome,
    required TResult Function(DeleteIncomeEvent value) deleteIncome,
    required TResult Function(SearchIncomesEvent value) searchIncomes,
    required TResult Function(FilterBySourceEvent value) filterBySource,
    required TResult Function(GetRecurringIncomesEvent value)
        getRecurringIncomes,
    required TResult Function(GetTotalIncomeForMonthEvent value)
        getTotalIncomeForMonth,
    required TResult Function(SyncIncomesEvent value) syncIncomes,
  }) {
    return loadIncomesForMonth(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadIncomesEvent value)? loadIncomes,
    TResult? Function(LoadIncomesForMonthEvent value)? loadIncomesForMonth,
    TResult? Function(CreateIncomeEvent value)? createIncome,
    TResult? Function(UpdateIncomeEvent value)? updateIncome,
    TResult? Function(DeleteIncomeEvent value)? deleteIncome,
    TResult? Function(SearchIncomesEvent value)? searchIncomes,
    TResult? Function(FilterBySourceEvent value)? filterBySource,
    TResult? Function(GetRecurringIncomesEvent value)? getRecurringIncomes,
    TResult? Function(GetTotalIncomeForMonthEvent value)?
        getTotalIncomeForMonth,
    TResult? Function(SyncIncomesEvent value)? syncIncomes,
  }) {
    return loadIncomesForMonth?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadIncomesEvent value)? loadIncomes,
    TResult Function(LoadIncomesForMonthEvent value)? loadIncomesForMonth,
    TResult Function(CreateIncomeEvent value)? createIncome,
    TResult Function(UpdateIncomeEvent value)? updateIncome,
    TResult Function(DeleteIncomeEvent value)? deleteIncome,
    TResult Function(SearchIncomesEvent value)? searchIncomes,
    TResult Function(FilterBySourceEvent value)? filterBySource,
    TResult Function(GetRecurringIncomesEvent value)? getRecurringIncomes,
    TResult Function(GetTotalIncomeForMonthEvent value)? getTotalIncomeForMonth,
    TResult Function(SyncIncomesEvent value)? syncIncomes,
    required TResult orElse(),
  }) {
    if (loadIncomesForMonth != null) {
      return loadIncomesForMonth(this);
    }
    return orElse();
  }
}

abstract class LoadIncomesForMonthEvent implements IncomeEvent {
  const factory LoadIncomesForMonthEvent(
      {required final String userId,
      required final DateTime month}) = _$LoadIncomesForMonthEventImpl;

  String get userId;
  DateTime get month;
  @JsonKey(ignore: true)
  _$$LoadIncomesForMonthEventImplCopyWith<_$LoadIncomesForMonthEventImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CreateIncomeEventImplCopyWith<$Res> {
  factory _$$CreateIncomeEventImplCopyWith(_$CreateIncomeEventImpl value,
          $Res Function(_$CreateIncomeEventImpl) then) =
      __$$CreateIncomeEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {String userId,
      double amount,
      String source,
      String description,
      DateTime date,
      String? notes,
      bool isRecurring,
      String? recurrenceFrequency});
}

/// @nodoc
class __$$CreateIncomeEventImplCopyWithImpl<$Res>
    extends _$IncomeEventCopyWithImpl<$Res, _$CreateIncomeEventImpl>
    implements _$$CreateIncomeEventImplCopyWith<$Res> {
  __$$CreateIncomeEventImplCopyWithImpl(_$CreateIncomeEventImpl _value,
      $Res Function(_$CreateIncomeEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? amount = null,
    Object? source = null,
    Object? description = null,
    Object? date = null,
    Object? notes = freezed,
    Object? isRecurring = null,
    Object? recurrenceFrequency = freezed,
  }) {
    return _then(_$CreateIncomeEventImpl(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      source: null == source
          ? _value.source
          : source // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      isRecurring: null == isRecurring
          ? _value.isRecurring
          : isRecurring // ignore: cast_nullable_to_non_nullable
              as bool,
      recurrenceFrequency: freezed == recurrenceFrequency
          ? _value.recurrenceFrequency
          : recurrenceFrequency // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$CreateIncomeEventImpl implements CreateIncomeEvent {
  const _$CreateIncomeEventImpl(
      {required this.userId,
      required this.amount,
      required this.source,
      required this.description,
      required this.date,
      this.notes,
      this.isRecurring = false,
      this.recurrenceFrequency});

  @override
  final String userId;
  @override
  final double amount;
  @override
  final String source;
  @override
  final String description;
  @override
  final DateTime date;
  @override
  final String? notes;
  @override
  @JsonKey()
  final bool isRecurring;
  @override
  final String? recurrenceFrequency;

  @override
  String toString() {
    return 'IncomeEvent.createIncome(userId: $userId, amount: $amount, source: $source, description: $description, date: $date, notes: $notes, isRecurring: $isRecurring, recurrenceFrequency: $recurrenceFrequency)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateIncomeEventImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.source, source) || other.source == source) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            (identical(other.isRecurring, isRecurring) ||
                other.isRecurring == isRecurring) &&
            (identical(other.recurrenceFrequency, recurrenceFrequency) ||
                other.recurrenceFrequency == recurrenceFrequency));
  }

  @override
  int get hashCode => Object.hash(runtimeType, userId, amount, source,
      description, date, notes, isRecurring, recurrenceFrequency);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateIncomeEventImplCopyWith<_$CreateIncomeEventImpl> get copyWith =>
      __$$CreateIncomeEventImplCopyWithImpl<_$CreateIncomeEventImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String userId) loadIncomes,
    required TResult Function(String userId, DateTime month)
        loadIncomesForMonth,
    required TResult Function(
            String userId,
            double amount,
            String source,
            String description,
            DateTime date,
            String? notes,
            bool isRecurring,
            String? recurrenceFrequency)
        createIncome,
    required TResult Function(Income income) updateIncome,
    required TResult Function(String userId, String incomeId) deleteIncome,
    required TResult Function(String userId, String query) searchIncomes,
    required TResult Function(String userId, String source) filterBySource,
    required TResult Function(String userId) getRecurringIncomes,
    required TResult Function(String userId, DateTime month)
        getTotalIncomeForMonth,
    required TResult Function(String userId) syncIncomes,
  }) {
    return createIncome(userId, amount, source, description, date, notes,
        isRecurring, recurrenceFrequency);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String userId)? loadIncomes,
    TResult? Function(String userId, DateTime month)? loadIncomesForMonth,
    TResult? Function(
            String userId,
            double amount,
            String source,
            String description,
            DateTime date,
            String? notes,
            bool isRecurring,
            String? recurrenceFrequency)?
        createIncome,
    TResult? Function(Income income)? updateIncome,
    TResult? Function(String userId, String incomeId)? deleteIncome,
    TResult? Function(String userId, String query)? searchIncomes,
    TResult? Function(String userId, String source)? filterBySource,
    TResult? Function(String userId)? getRecurringIncomes,
    TResult? Function(String userId, DateTime month)? getTotalIncomeForMonth,
    TResult? Function(String userId)? syncIncomes,
  }) {
    return createIncome?.call(userId, amount, source, description, date, notes,
        isRecurring, recurrenceFrequency);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String userId)? loadIncomes,
    TResult Function(String userId, DateTime month)? loadIncomesForMonth,
    TResult Function(
            String userId,
            double amount,
            String source,
            String description,
            DateTime date,
            String? notes,
            bool isRecurring,
            String? recurrenceFrequency)?
        createIncome,
    TResult Function(Income income)? updateIncome,
    TResult Function(String userId, String incomeId)? deleteIncome,
    TResult Function(String userId, String query)? searchIncomes,
    TResult Function(String userId, String source)? filterBySource,
    TResult Function(String userId)? getRecurringIncomes,
    TResult Function(String userId, DateTime month)? getTotalIncomeForMonth,
    TResult Function(String userId)? syncIncomes,
    required TResult orElse(),
  }) {
    if (createIncome != null) {
      return createIncome(userId, amount, source, description, date, notes,
          isRecurring, recurrenceFrequency);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadIncomesEvent value) loadIncomes,
    required TResult Function(LoadIncomesForMonthEvent value)
        loadIncomesForMonth,
    required TResult Function(CreateIncomeEvent value) createIncome,
    required TResult Function(UpdateIncomeEvent value) updateIncome,
    required TResult Function(DeleteIncomeEvent value) deleteIncome,
    required TResult Function(SearchIncomesEvent value) searchIncomes,
    required TResult Function(FilterBySourceEvent value) filterBySource,
    required TResult Function(GetRecurringIncomesEvent value)
        getRecurringIncomes,
    required TResult Function(GetTotalIncomeForMonthEvent value)
        getTotalIncomeForMonth,
    required TResult Function(SyncIncomesEvent value) syncIncomes,
  }) {
    return createIncome(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadIncomesEvent value)? loadIncomes,
    TResult? Function(LoadIncomesForMonthEvent value)? loadIncomesForMonth,
    TResult? Function(CreateIncomeEvent value)? createIncome,
    TResult? Function(UpdateIncomeEvent value)? updateIncome,
    TResult? Function(DeleteIncomeEvent value)? deleteIncome,
    TResult? Function(SearchIncomesEvent value)? searchIncomes,
    TResult? Function(FilterBySourceEvent value)? filterBySource,
    TResult? Function(GetRecurringIncomesEvent value)? getRecurringIncomes,
    TResult? Function(GetTotalIncomeForMonthEvent value)?
        getTotalIncomeForMonth,
    TResult? Function(SyncIncomesEvent value)? syncIncomes,
  }) {
    return createIncome?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadIncomesEvent value)? loadIncomes,
    TResult Function(LoadIncomesForMonthEvent value)? loadIncomesForMonth,
    TResult Function(CreateIncomeEvent value)? createIncome,
    TResult Function(UpdateIncomeEvent value)? updateIncome,
    TResult Function(DeleteIncomeEvent value)? deleteIncome,
    TResult Function(SearchIncomesEvent value)? searchIncomes,
    TResult Function(FilterBySourceEvent value)? filterBySource,
    TResult Function(GetRecurringIncomesEvent value)? getRecurringIncomes,
    TResult Function(GetTotalIncomeForMonthEvent value)? getTotalIncomeForMonth,
    TResult Function(SyncIncomesEvent value)? syncIncomes,
    required TResult orElse(),
  }) {
    if (createIncome != null) {
      return createIncome(this);
    }
    return orElse();
  }
}

abstract class CreateIncomeEvent implements IncomeEvent {
  const factory CreateIncomeEvent(
      {required final String userId,
      required final double amount,
      required final String source,
      required final String description,
      required final DateTime date,
      final String? notes,
      final bool isRecurring,
      final String? recurrenceFrequency}) = _$CreateIncomeEventImpl;

  String get userId;
  double get amount;
  String get source;
  String get description;
  DateTime get date;
  String? get notes;
  bool get isRecurring;
  String? get recurrenceFrequency;
  @JsonKey(ignore: true)
  _$$CreateIncomeEventImplCopyWith<_$CreateIncomeEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UpdateIncomeEventImplCopyWith<$Res> {
  factory _$$UpdateIncomeEventImplCopyWith(_$UpdateIncomeEventImpl value,
          $Res Function(_$UpdateIncomeEventImpl) then) =
      __$$UpdateIncomeEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Income income});

  $IncomeCopyWith<$Res> get income;
}

/// @nodoc
class __$$UpdateIncomeEventImplCopyWithImpl<$Res>
    extends _$IncomeEventCopyWithImpl<$Res, _$UpdateIncomeEventImpl>
    implements _$$UpdateIncomeEventImplCopyWith<$Res> {
  __$$UpdateIncomeEventImplCopyWithImpl(_$UpdateIncomeEventImpl _value,
      $Res Function(_$UpdateIncomeEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? income = null,
  }) {
    return _then(_$UpdateIncomeEventImpl(
      income: null == income
          ? _value.income
          : income // ignore: cast_nullable_to_non_nullable
              as Income,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $IncomeCopyWith<$Res> get income {
    return $IncomeCopyWith<$Res>(_value.income, (value) {
      return _then(_value.copyWith(income: value));
    });
  }
}

/// @nodoc

class _$UpdateIncomeEventImpl implements UpdateIncomeEvent {
  const _$UpdateIncomeEventImpl({required this.income});

  @override
  final Income income;

  @override
  String toString() {
    return 'IncomeEvent.updateIncome(income: $income)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateIncomeEventImpl &&
            (identical(other.income, income) || other.income == income));
  }

  @override
  int get hashCode => Object.hash(runtimeType, income);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateIncomeEventImplCopyWith<_$UpdateIncomeEventImpl> get copyWith =>
      __$$UpdateIncomeEventImplCopyWithImpl<_$UpdateIncomeEventImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String userId) loadIncomes,
    required TResult Function(String userId, DateTime month)
        loadIncomesForMonth,
    required TResult Function(
            String userId,
            double amount,
            String source,
            String description,
            DateTime date,
            String? notes,
            bool isRecurring,
            String? recurrenceFrequency)
        createIncome,
    required TResult Function(Income income) updateIncome,
    required TResult Function(String userId, String incomeId) deleteIncome,
    required TResult Function(String userId, String query) searchIncomes,
    required TResult Function(String userId, String source) filterBySource,
    required TResult Function(String userId) getRecurringIncomes,
    required TResult Function(String userId, DateTime month)
        getTotalIncomeForMonth,
    required TResult Function(String userId) syncIncomes,
  }) {
    return updateIncome(income);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String userId)? loadIncomes,
    TResult? Function(String userId, DateTime month)? loadIncomesForMonth,
    TResult? Function(
            String userId,
            double amount,
            String source,
            String description,
            DateTime date,
            String? notes,
            bool isRecurring,
            String? recurrenceFrequency)?
        createIncome,
    TResult? Function(Income income)? updateIncome,
    TResult? Function(String userId, String incomeId)? deleteIncome,
    TResult? Function(String userId, String query)? searchIncomes,
    TResult? Function(String userId, String source)? filterBySource,
    TResult? Function(String userId)? getRecurringIncomes,
    TResult? Function(String userId, DateTime month)? getTotalIncomeForMonth,
    TResult? Function(String userId)? syncIncomes,
  }) {
    return updateIncome?.call(income);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String userId)? loadIncomes,
    TResult Function(String userId, DateTime month)? loadIncomesForMonth,
    TResult Function(
            String userId,
            double amount,
            String source,
            String description,
            DateTime date,
            String? notes,
            bool isRecurring,
            String? recurrenceFrequency)?
        createIncome,
    TResult Function(Income income)? updateIncome,
    TResult Function(String userId, String incomeId)? deleteIncome,
    TResult Function(String userId, String query)? searchIncomes,
    TResult Function(String userId, String source)? filterBySource,
    TResult Function(String userId)? getRecurringIncomes,
    TResult Function(String userId, DateTime month)? getTotalIncomeForMonth,
    TResult Function(String userId)? syncIncomes,
    required TResult orElse(),
  }) {
    if (updateIncome != null) {
      return updateIncome(income);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadIncomesEvent value) loadIncomes,
    required TResult Function(LoadIncomesForMonthEvent value)
        loadIncomesForMonth,
    required TResult Function(CreateIncomeEvent value) createIncome,
    required TResult Function(UpdateIncomeEvent value) updateIncome,
    required TResult Function(DeleteIncomeEvent value) deleteIncome,
    required TResult Function(SearchIncomesEvent value) searchIncomes,
    required TResult Function(FilterBySourceEvent value) filterBySource,
    required TResult Function(GetRecurringIncomesEvent value)
        getRecurringIncomes,
    required TResult Function(GetTotalIncomeForMonthEvent value)
        getTotalIncomeForMonth,
    required TResult Function(SyncIncomesEvent value) syncIncomes,
  }) {
    return updateIncome(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadIncomesEvent value)? loadIncomes,
    TResult? Function(LoadIncomesForMonthEvent value)? loadIncomesForMonth,
    TResult? Function(CreateIncomeEvent value)? createIncome,
    TResult? Function(UpdateIncomeEvent value)? updateIncome,
    TResult? Function(DeleteIncomeEvent value)? deleteIncome,
    TResult? Function(SearchIncomesEvent value)? searchIncomes,
    TResult? Function(FilterBySourceEvent value)? filterBySource,
    TResult? Function(GetRecurringIncomesEvent value)? getRecurringIncomes,
    TResult? Function(GetTotalIncomeForMonthEvent value)?
        getTotalIncomeForMonth,
    TResult? Function(SyncIncomesEvent value)? syncIncomes,
  }) {
    return updateIncome?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadIncomesEvent value)? loadIncomes,
    TResult Function(LoadIncomesForMonthEvent value)? loadIncomesForMonth,
    TResult Function(CreateIncomeEvent value)? createIncome,
    TResult Function(UpdateIncomeEvent value)? updateIncome,
    TResult Function(DeleteIncomeEvent value)? deleteIncome,
    TResult Function(SearchIncomesEvent value)? searchIncomes,
    TResult Function(FilterBySourceEvent value)? filterBySource,
    TResult Function(GetRecurringIncomesEvent value)? getRecurringIncomes,
    TResult Function(GetTotalIncomeForMonthEvent value)? getTotalIncomeForMonth,
    TResult Function(SyncIncomesEvent value)? syncIncomes,
    required TResult orElse(),
  }) {
    if (updateIncome != null) {
      return updateIncome(this);
    }
    return orElse();
  }
}

abstract class UpdateIncomeEvent implements IncomeEvent {
  const factory UpdateIncomeEvent({required final Income income}) =
      _$UpdateIncomeEventImpl;

  Income get income;
  @JsonKey(ignore: true)
  _$$UpdateIncomeEventImplCopyWith<_$UpdateIncomeEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DeleteIncomeEventImplCopyWith<$Res> {
  factory _$$DeleteIncomeEventImplCopyWith(_$DeleteIncomeEventImpl value,
          $Res Function(_$DeleteIncomeEventImpl) then) =
      __$$DeleteIncomeEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String userId, String incomeId});
}

/// @nodoc
class __$$DeleteIncomeEventImplCopyWithImpl<$Res>
    extends _$IncomeEventCopyWithImpl<$Res, _$DeleteIncomeEventImpl>
    implements _$$DeleteIncomeEventImplCopyWith<$Res> {
  __$$DeleteIncomeEventImplCopyWithImpl(_$DeleteIncomeEventImpl _value,
      $Res Function(_$DeleteIncomeEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? incomeId = null,
  }) {
    return _then(_$DeleteIncomeEventImpl(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      incomeId: null == incomeId
          ? _value.incomeId
          : incomeId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$DeleteIncomeEventImpl implements DeleteIncomeEvent {
  const _$DeleteIncomeEventImpl({required this.userId, required this.incomeId});

  @override
  final String userId;
  @override
  final String incomeId;

  @override
  String toString() {
    return 'IncomeEvent.deleteIncome(userId: $userId, incomeId: $incomeId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeleteIncomeEventImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.incomeId, incomeId) ||
                other.incomeId == incomeId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, userId, incomeId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DeleteIncomeEventImplCopyWith<_$DeleteIncomeEventImpl> get copyWith =>
      __$$DeleteIncomeEventImplCopyWithImpl<_$DeleteIncomeEventImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String userId) loadIncomes,
    required TResult Function(String userId, DateTime month)
        loadIncomesForMonth,
    required TResult Function(
            String userId,
            double amount,
            String source,
            String description,
            DateTime date,
            String? notes,
            bool isRecurring,
            String? recurrenceFrequency)
        createIncome,
    required TResult Function(Income income) updateIncome,
    required TResult Function(String userId, String incomeId) deleteIncome,
    required TResult Function(String userId, String query) searchIncomes,
    required TResult Function(String userId, String source) filterBySource,
    required TResult Function(String userId) getRecurringIncomes,
    required TResult Function(String userId, DateTime month)
        getTotalIncomeForMonth,
    required TResult Function(String userId) syncIncomes,
  }) {
    return deleteIncome(userId, incomeId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String userId)? loadIncomes,
    TResult? Function(String userId, DateTime month)? loadIncomesForMonth,
    TResult? Function(
            String userId,
            double amount,
            String source,
            String description,
            DateTime date,
            String? notes,
            bool isRecurring,
            String? recurrenceFrequency)?
        createIncome,
    TResult? Function(Income income)? updateIncome,
    TResult? Function(String userId, String incomeId)? deleteIncome,
    TResult? Function(String userId, String query)? searchIncomes,
    TResult? Function(String userId, String source)? filterBySource,
    TResult? Function(String userId)? getRecurringIncomes,
    TResult? Function(String userId, DateTime month)? getTotalIncomeForMonth,
    TResult? Function(String userId)? syncIncomes,
  }) {
    return deleteIncome?.call(userId, incomeId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String userId)? loadIncomes,
    TResult Function(String userId, DateTime month)? loadIncomesForMonth,
    TResult Function(
            String userId,
            double amount,
            String source,
            String description,
            DateTime date,
            String? notes,
            bool isRecurring,
            String? recurrenceFrequency)?
        createIncome,
    TResult Function(Income income)? updateIncome,
    TResult Function(String userId, String incomeId)? deleteIncome,
    TResult Function(String userId, String query)? searchIncomes,
    TResult Function(String userId, String source)? filterBySource,
    TResult Function(String userId)? getRecurringIncomes,
    TResult Function(String userId, DateTime month)? getTotalIncomeForMonth,
    TResult Function(String userId)? syncIncomes,
    required TResult orElse(),
  }) {
    if (deleteIncome != null) {
      return deleteIncome(userId, incomeId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadIncomesEvent value) loadIncomes,
    required TResult Function(LoadIncomesForMonthEvent value)
        loadIncomesForMonth,
    required TResult Function(CreateIncomeEvent value) createIncome,
    required TResult Function(UpdateIncomeEvent value) updateIncome,
    required TResult Function(DeleteIncomeEvent value) deleteIncome,
    required TResult Function(SearchIncomesEvent value) searchIncomes,
    required TResult Function(FilterBySourceEvent value) filterBySource,
    required TResult Function(GetRecurringIncomesEvent value)
        getRecurringIncomes,
    required TResult Function(GetTotalIncomeForMonthEvent value)
        getTotalIncomeForMonth,
    required TResult Function(SyncIncomesEvent value) syncIncomes,
  }) {
    return deleteIncome(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadIncomesEvent value)? loadIncomes,
    TResult? Function(LoadIncomesForMonthEvent value)? loadIncomesForMonth,
    TResult? Function(CreateIncomeEvent value)? createIncome,
    TResult? Function(UpdateIncomeEvent value)? updateIncome,
    TResult? Function(DeleteIncomeEvent value)? deleteIncome,
    TResult? Function(SearchIncomesEvent value)? searchIncomes,
    TResult? Function(FilterBySourceEvent value)? filterBySource,
    TResult? Function(GetRecurringIncomesEvent value)? getRecurringIncomes,
    TResult? Function(GetTotalIncomeForMonthEvent value)?
        getTotalIncomeForMonth,
    TResult? Function(SyncIncomesEvent value)? syncIncomes,
  }) {
    return deleteIncome?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadIncomesEvent value)? loadIncomes,
    TResult Function(LoadIncomesForMonthEvent value)? loadIncomesForMonth,
    TResult Function(CreateIncomeEvent value)? createIncome,
    TResult Function(UpdateIncomeEvent value)? updateIncome,
    TResult Function(DeleteIncomeEvent value)? deleteIncome,
    TResult Function(SearchIncomesEvent value)? searchIncomes,
    TResult Function(FilterBySourceEvent value)? filterBySource,
    TResult Function(GetRecurringIncomesEvent value)? getRecurringIncomes,
    TResult Function(GetTotalIncomeForMonthEvent value)? getTotalIncomeForMonth,
    TResult Function(SyncIncomesEvent value)? syncIncomes,
    required TResult orElse(),
  }) {
    if (deleteIncome != null) {
      return deleteIncome(this);
    }
    return orElse();
  }
}

abstract class DeleteIncomeEvent implements IncomeEvent {
  const factory DeleteIncomeEvent(
      {required final String userId,
      required final String incomeId}) = _$DeleteIncomeEventImpl;

  String get userId;
  String get incomeId;
  @JsonKey(ignore: true)
  _$$DeleteIncomeEventImplCopyWith<_$DeleteIncomeEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SearchIncomesEventImplCopyWith<$Res> {
  factory _$$SearchIncomesEventImplCopyWith(_$SearchIncomesEventImpl value,
          $Res Function(_$SearchIncomesEventImpl) then) =
      __$$SearchIncomesEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String userId, String query});
}

/// @nodoc
class __$$SearchIncomesEventImplCopyWithImpl<$Res>
    extends _$IncomeEventCopyWithImpl<$Res, _$SearchIncomesEventImpl>
    implements _$$SearchIncomesEventImplCopyWith<$Res> {
  __$$SearchIncomesEventImplCopyWithImpl(_$SearchIncomesEventImpl _value,
      $Res Function(_$SearchIncomesEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? query = null,
  }) {
    return _then(_$SearchIncomesEventImpl(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      query: null == query
          ? _value.query
          : query // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SearchIncomesEventImpl implements SearchIncomesEvent {
  const _$SearchIncomesEventImpl({required this.userId, required this.query});

  @override
  final String userId;
  @override
  final String query;

  @override
  String toString() {
    return 'IncomeEvent.searchIncomes(userId: $userId, query: $query)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchIncomesEventImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.query, query) || other.query == query));
  }

  @override
  int get hashCode => Object.hash(runtimeType, userId, query);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchIncomesEventImplCopyWith<_$SearchIncomesEventImpl> get copyWith =>
      __$$SearchIncomesEventImplCopyWithImpl<_$SearchIncomesEventImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String userId) loadIncomes,
    required TResult Function(String userId, DateTime month)
        loadIncomesForMonth,
    required TResult Function(
            String userId,
            double amount,
            String source,
            String description,
            DateTime date,
            String? notes,
            bool isRecurring,
            String? recurrenceFrequency)
        createIncome,
    required TResult Function(Income income) updateIncome,
    required TResult Function(String userId, String incomeId) deleteIncome,
    required TResult Function(String userId, String query) searchIncomes,
    required TResult Function(String userId, String source) filterBySource,
    required TResult Function(String userId) getRecurringIncomes,
    required TResult Function(String userId, DateTime month)
        getTotalIncomeForMonth,
    required TResult Function(String userId) syncIncomes,
  }) {
    return searchIncomes(userId, query);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String userId)? loadIncomes,
    TResult? Function(String userId, DateTime month)? loadIncomesForMonth,
    TResult? Function(
            String userId,
            double amount,
            String source,
            String description,
            DateTime date,
            String? notes,
            bool isRecurring,
            String? recurrenceFrequency)?
        createIncome,
    TResult? Function(Income income)? updateIncome,
    TResult? Function(String userId, String incomeId)? deleteIncome,
    TResult? Function(String userId, String query)? searchIncomes,
    TResult? Function(String userId, String source)? filterBySource,
    TResult? Function(String userId)? getRecurringIncomes,
    TResult? Function(String userId, DateTime month)? getTotalIncomeForMonth,
    TResult? Function(String userId)? syncIncomes,
  }) {
    return searchIncomes?.call(userId, query);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String userId)? loadIncomes,
    TResult Function(String userId, DateTime month)? loadIncomesForMonth,
    TResult Function(
            String userId,
            double amount,
            String source,
            String description,
            DateTime date,
            String? notes,
            bool isRecurring,
            String? recurrenceFrequency)?
        createIncome,
    TResult Function(Income income)? updateIncome,
    TResult Function(String userId, String incomeId)? deleteIncome,
    TResult Function(String userId, String query)? searchIncomes,
    TResult Function(String userId, String source)? filterBySource,
    TResult Function(String userId)? getRecurringIncomes,
    TResult Function(String userId, DateTime month)? getTotalIncomeForMonth,
    TResult Function(String userId)? syncIncomes,
    required TResult orElse(),
  }) {
    if (searchIncomes != null) {
      return searchIncomes(userId, query);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadIncomesEvent value) loadIncomes,
    required TResult Function(LoadIncomesForMonthEvent value)
        loadIncomesForMonth,
    required TResult Function(CreateIncomeEvent value) createIncome,
    required TResult Function(UpdateIncomeEvent value) updateIncome,
    required TResult Function(DeleteIncomeEvent value) deleteIncome,
    required TResult Function(SearchIncomesEvent value) searchIncomes,
    required TResult Function(FilterBySourceEvent value) filterBySource,
    required TResult Function(GetRecurringIncomesEvent value)
        getRecurringIncomes,
    required TResult Function(GetTotalIncomeForMonthEvent value)
        getTotalIncomeForMonth,
    required TResult Function(SyncIncomesEvent value) syncIncomes,
  }) {
    return searchIncomes(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadIncomesEvent value)? loadIncomes,
    TResult? Function(LoadIncomesForMonthEvent value)? loadIncomesForMonth,
    TResult? Function(CreateIncomeEvent value)? createIncome,
    TResult? Function(UpdateIncomeEvent value)? updateIncome,
    TResult? Function(DeleteIncomeEvent value)? deleteIncome,
    TResult? Function(SearchIncomesEvent value)? searchIncomes,
    TResult? Function(FilterBySourceEvent value)? filterBySource,
    TResult? Function(GetRecurringIncomesEvent value)? getRecurringIncomes,
    TResult? Function(GetTotalIncomeForMonthEvent value)?
        getTotalIncomeForMonth,
    TResult? Function(SyncIncomesEvent value)? syncIncomes,
  }) {
    return searchIncomes?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadIncomesEvent value)? loadIncomes,
    TResult Function(LoadIncomesForMonthEvent value)? loadIncomesForMonth,
    TResult Function(CreateIncomeEvent value)? createIncome,
    TResult Function(UpdateIncomeEvent value)? updateIncome,
    TResult Function(DeleteIncomeEvent value)? deleteIncome,
    TResult Function(SearchIncomesEvent value)? searchIncomes,
    TResult Function(FilterBySourceEvent value)? filterBySource,
    TResult Function(GetRecurringIncomesEvent value)? getRecurringIncomes,
    TResult Function(GetTotalIncomeForMonthEvent value)? getTotalIncomeForMonth,
    TResult Function(SyncIncomesEvent value)? syncIncomes,
    required TResult orElse(),
  }) {
    if (searchIncomes != null) {
      return searchIncomes(this);
    }
    return orElse();
  }
}

abstract class SearchIncomesEvent implements IncomeEvent {
  const factory SearchIncomesEvent(
      {required final String userId,
      required final String query}) = _$SearchIncomesEventImpl;

  String get userId;
  String get query;
  @JsonKey(ignore: true)
  _$$SearchIncomesEventImplCopyWith<_$SearchIncomesEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FilterBySourceEventImplCopyWith<$Res> {
  factory _$$FilterBySourceEventImplCopyWith(_$FilterBySourceEventImpl value,
          $Res Function(_$FilterBySourceEventImpl) then) =
      __$$FilterBySourceEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String userId, String source});
}

/// @nodoc
class __$$FilterBySourceEventImplCopyWithImpl<$Res>
    extends _$IncomeEventCopyWithImpl<$Res, _$FilterBySourceEventImpl>
    implements _$$FilterBySourceEventImplCopyWith<$Res> {
  __$$FilterBySourceEventImplCopyWithImpl(_$FilterBySourceEventImpl _value,
      $Res Function(_$FilterBySourceEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? source = null,
  }) {
    return _then(_$FilterBySourceEventImpl(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      source: null == source
          ? _value.source
          : source // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$FilterBySourceEventImpl implements FilterBySourceEvent {
  const _$FilterBySourceEventImpl({required this.userId, required this.source});

  @override
  final String userId;
  @override
  final String source;

  @override
  String toString() {
    return 'IncomeEvent.filterBySource(userId: $userId, source: $source)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FilterBySourceEventImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.source, source) || other.source == source));
  }

  @override
  int get hashCode => Object.hash(runtimeType, userId, source);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FilterBySourceEventImplCopyWith<_$FilterBySourceEventImpl> get copyWith =>
      __$$FilterBySourceEventImplCopyWithImpl<_$FilterBySourceEventImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String userId) loadIncomes,
    required TResult Function(String userId, DateTime month)
        loadIncomesForMonth,
    required TResult Function(
            String userId,
            double amount,
            String source,
            String description,
            DateTime date,
            String? notes,
            bool isRecurring,
            String? recurrenceFrequency)
        createIncome,
    required TResult Function(Income income) updateIncome,
    required TResult Function(String userId, String incomeId) deleteIncome,
    required TResult Function(String userId, String query) searchIncomes,
    required TResult Function(String userId, String source) filterBySource,
    required TResult Function(String userId) getRecurringIncomes,
    required TResult Function(String userId, DateTime month)
        getTotalIncomeForMonth,
    required TResult Function(String userId) syncIncomes,
  }) {
    return filterBySource(userId, source);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String userId)? loadIncomes,
    TResult? Function(String userId, DateTime month)? loadIncomesForMonth,
    TResult? Function(
            String userId,
            double amount,
            String source,
            String description,
            DateTime date,
            String? notes,
            bool isRecurring,
            String? recurrenceFrequency)?
        createIncome,
    TResult? Function(Income income)? updateIncome,
    TResult? Function(String userId, String incomeId)? deleteIncome,
    TResult? Function(String userId, String query)? searchIncomes,
    TResult? Function(String userId, String source)? filterBySource,
    TResult? Function(String userId)? getRecurringIncomes,
    TResult? Function(String userId, DateTime month)? getTotalIncomeForMonth,
    TResult? Function(String userId)? syncIncomes,
  }) {
    return filterBySource?.call(userId, source);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String userId)? loadIncomes,
    TResult Function(String userId, DateTime month)? loadIncomesForMonth,
    TResult Function(
            String userId,
            double amount,
            String source,
            String description,
            DateTime date,
            String? notes,
            bool isRecurring,
            String? recurrenceFrequency)?
        createIncome,
    TResult Function(Income income)? updateIncome,
    TResult Function(String userId, String incomeId)? deleteIncome,
    TResult Function(String userId, String query)? searchIncomes,
    TResult Function(String userId, String source)? filterBySource,
    TResult Function(String userId)? getRecurringIncomes,
    TResult Function(String userId, DateTime month)? getTotalIncomeForMonth,
    TResult Function(String userId)? syncIncomes,
    required TResult orElse(),
  }) {
    if (filterBySource != null) {
      return filterBySource(userId, source);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadIncomesEvent value) loadIncomes,
    required TResult Function(LoadIncomesForMonthEvent value)
        loadIncomesForMonth,
    required TResult Function(CreateIncomeEvent value) createIncome,
    required TResult Function(UpdateIncomeEvent value) updateIncome,
    required TResult Function(DeleteIncomeEvent value) deleteIncome,
    required TResult Function(SearchIncomesEvent value) searchIncomes,
    required TResult Function(FilterBySourceEvent value) filterBySource,
    required TResult Function(GetRecurringIncomesEvent value)
        getRecurringIncomes,
    required TResult Function(GetTotalIncomeForMonthEvent value)
        getTotalIncomeForMonth,
    required TResult Function(SyncIncomesEvent value) syncIncomes,
  }) {
    return filterBySource(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadIncomesEvent value)? loadIncomes,
    TResult? Function(LoadIncomesForMonthEvent value)? loadIncomesForMonth,
    TResult? Function(CreateIncomeEvent value)? createIncome,
    TResult? Function(UpdateIncomeEvent value)? updateIncome,
    TResult? Function(DeleteIncomeEvent value)? deleteIncome,
    TResult? Function(SearchIncomesEvent value)? searchIncomes,
    TResult? Function(FilterBySourceEvent value)? filterBySource,
    TResult? Function(GetRecurringIncomesEvent value)? getRecurringIncomes,
    TResult? Function(GetTotalIncomeForMonthEvent value)?
        getTotalIncomeForMonth,
    TResult? Function(SyncIncomesEvent value)? syncIncomes,
  }) {
    return filterBySource?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadIncomesEvent value)? loadIncomes,
    TResult Function(LoadIncomesForMonthEvent value)? loadIncomesForMonth,
    TResult Function(CreateIncomeEvent value)? createIncome,
    TResult Function(UpdateIncomeEvent value)? updateIncome,
    TResult Function(DeleteIncomeEvent value)? deleteIncome,
    TResult Function(SearchIncomesEvent value)? searchIncomes,
    TResult Function(FilterBySourceEvent value)? filterBySource,
    TResult Function(GetRecurringIncomesEvent value)? getRecurringIncomes,
    TResult Function(GetTotalIncomeForMonthEvent value)? getTotalIncomeForMonth,
    TResult Function(SyncIncomesEvent value)? syncIncomes,
    required TResult orElse(),
  }) {
    if (filterBySource != null) {
      return filterBySource(this);
    }
    return orElse();
  }
}

abstract class FilterBySourceEvent implements IncomeEvent {
  const factory FilterBySourceEvent(
      {required final String userId,
      required final String source}) = _$FilterBySourceEventImpl;

  String get userId;
  String get source;
  @JsonKey(ignore: true)
  _$$FilterBySourceEventImplCopyWith<_$FilterBySourceEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GetRecurringIncomesEventImplCopyWith<$Res> {
  factory _$$GetRecurringIncomesEventImplCopyWith(
          _$GetRecurringIncomesEventImpl value,
          $Res Function(_$GetRecurringIncomesEventImpl) then) =
      __$$GetRecurringIncomesEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String userId});
}

/// @nodoc
class __$$GetRecurringIncomesEventImplCopyWithImpl<$Res>
    extends _$IncomeEventCopyWithImpl<$Res, _$GetRecurringIncomesEventImpl>
    implements _$$GetRecurringIncomesEventImplCopyWith<$Res> {
  __$$GetRecurringIncomesEventImplCopyWithImpl(
      _$GetRecurringIncomesEventImpl _value,
      $Res Function(_$GetRecurringIncomesEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
  }) {
    return _then(_$GetRecurringIncomesEventImpl(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$GetRecurringIncomesEventImpl implements GetRecurringIncomesEvent {
  const _$GetRecurringIncomesEventImpl({required this.userId});

  @override
  final String userId;

  @override
  String toString() {
    return 'IncomeEvent.getRecurringIncomes(userId: $userId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetRecurringIncomesEventImpl &&
            (identical(other.userId, userId) || other.userId == userId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, userId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetRecurringIncomesEventImplCopyWith<_$GetRecurringIncomesEventImpl>
      get copyWith => __$$GetRecurringIncomesEventImplCopyWithImpl<
          _$GetRecurringIncomesEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String userId) loadIncomes,
    required TResult Function(String userId, DateTime month)
        loadIncomesForMonth,
    required TResult Function(
            String userId,
            double amount,
            String source,
            String description,
            DateTime date,
            String? notes,
            bool isRecurring,
            String? recurrenceFrequency)
        createIncome,
    required TResult Function(Income income) updateIncome,
    required TResult Function(String userId, String incomeId) deleteIncome,
    required TResult Function(String userId, String query) searchIncomes,
    required TResult Function(String userId, String source) filterBySource,
    required TResult Function(String userId) getRecurringIncomes,
    required TResult Function(String userId, DateTime month)
        getTotalIncomeForMonth,
    required TResult Function(String userId) syncIncomes,
  }) {
    return getRecurringIncomes(userId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String userId)? loadIncomes,
    TResult? Function(String userId, DateTime month)? loadIncomesForMonth,
    TResult? Function(
            String userId,
            double amount,
            String source,
            String description,
            DateTime date,
            String? notes,
            bool isRecurring,
            String? recurrenceFrequency)?
        createIncome,
    TResult? Function(Income income)? updateIncome,
    TResult? Function(String userId, String incomeId)? deleteIncome,
    TResult? Function(String userId, String query)? searchIncomes,
    TResult? Function(String userId, String source)? filterBySource,
    TResult? Function(String userId)? getRecurringIncomes,
    TResult? Function(String userId, DateTime month)? getTotalIncomeForMonth,
    TResult? Function(String userId)? syncIncomes,
  }) {
    return getRecurringIncomes?.call(userId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String userId)? loadIncomes,
    TResult Function(String userId, DateTime month)? loadIncomesForMonth,
    TResult Function(
            String userId,
            double amount,
            String source,
            String description,
            DateTime date,
            String? notes,
            bool isRecurring,
            String? recurrenceFrequency)?
        createIncome,
    TResult Function(Income income)? updateIncome,
    TResult Function(String userId, String incomeId)? deleteIncome,
    TResult Function(String userId, String query)? searchIncomes,
    TResult Function(String userId, String source)? filterBySource,
    TResult Function(String userId)? getRecurringIncomes,
    TResult Function(String userId, DateTime month)? getTotalIncomeForMonth,
    TResult Function(String userId)? syncIncomes,
    required TResult orElse(),
  }) {
    if (getRecurringIncomes != null) {
      return getRecurringIncomes(userId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadIncomesEvent value) loadIncomes,
    required TResult Function(LoadIncomesForMonthEvent value)
        loadIncomesForMonth,
    required TResult Function(CreateIncomeEvent value) createIncome,
    required TResult Function(UpdateIncomeEvent value) updateIncome,
    required TResult Function(DeleteIncomeEvent value) deleteIncome,
    required TResult Function(SearchIncomesEvent value) searchIncomes,
    required TResult Function(FilterBySourceEvent value) filterBySource,
    required TResult Function(GetRecurringIncomesEvent value)
        getRecurringIncomes,
    required TResult Function(GetTotalIncomeForMonthEvent value)
        getTotalIncomeForMonth,
    required TResult Function(SyncIncomesEvent value) syncIncomes,
  }) {
    return getRecurringIncomes(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadIncomesEvent value)? loadIncomes,
    TResult? Function(LoadIncomesForMonthEvent value)? loadIncomesForMonth,
    TResult? Function(CreateIncomeEvent value)? createIncome,
    TResult? Function(UpdateIncomeEvent value)? updateIncome,
    TResult? Function(DeleteIncomeEvent value)? deleteIncome,
    TResult? Function(SearchIncomesEvent value)? searchIncomes,
    TResult? Function(FilterBySourceEvent value)? filterBySource,
    TResult? Function(GetRecurringIncomesEvent value)? getRecurringIncomes,
    TResult? Function(GetTotalIncomeForMonthEvent value)?
        getTotalIncomeForMonth,
    TResult? Function(SyncIncomesEvent value)? syncIncomes,
  }) {
    return getRecurringIncomes?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadIncomesEvent value)? loadIncomes,
    TResult Function(LoadIncomesForMonthEvent value)? loadIncomesForMonth,
    TResult Function(CreateIncomeEvent value)? createIncome,
    TResult Function(UpdateIncomeEvent value)? updateIncome,
    TResult Function(DeleteIncomeEvent value)? deleteIncome,
    TResult Function(SearchIncomesEvent value)? searchIncomes,
    TResult Function(FilterBySourceEvent value)? filterBySource,
    TResult Function(GetRecurringIncomesEvent value)? getRecurringIncomes,
    TResult Function(GetTotalIncomeForMonthEvent value)? getTotalIncomeForMonth,
    TResult Function(SyncIncomesEvent value)? syncIncomes,
    required TResult orElse(),
  }) {
    if (getRecurringIncomes != null) {
      return getRecurringIncomes(this);
    }
    return orElse();
  }
}

abstract class GetRecurringIncomesEvent implements IncomeEvent {
  const factory GetRecurringIncomesEvent({required final String userId}) =
      _$GetRecurringIncomesEventImpl;

  String get userId;
  @JsonKey(ignore: true)
  _$$GetRecurringIncomesEventImplCopyWith<_$GetRecurringIncomesEventImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GetTotalIncomeForMonthEventImplCopyWith<$Res> {
  factory _$$GetTotalIncomeForMonthEventImplCopyWith(
          _$GetTotalIncomeForMonthEventImpl value,
          $Res Function(_$GetTotalIncomeForMonthEventImpl) then) =
      __$$GetTotalIncomeForMonthEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String userId, DateTime month});
}

/// @nodoc
class __$$GetTotalIncomeForMonthEventImplCopyWithImpl<$Res>
    extends _$IncomeEventCopyWithImpl<$Res, _$GetTotalIncomeForMonthEventImpl>
    implements _$$GetTotalIncomeForMonthEventImplCopyWith<$Res> {
  __$$GetTotalIncomeForMonthEventImplCopyWithImpl(
      _$GetTotalIncomeForMonthEventImpl _value,
      $Res Function(_$GetTotalIncomeForMonthEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? month = null,
  }) {
    return _then(_$GetTotalIncomeForMonthEventImpl(
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

class _$GetTotalIncomeForMonthEventImpl implements GetTotalIncomeForMonthEvent {
  const _$GetTotalIncomeForMonthEventImpl(
      {required this.userId, required this.month});

  @override
  final String userId;
  @override
  final DateTime month;

  @override
  String toString() {
    return 'IncomeEvent.getTotalIncomeForMonth(userId: $userId, month: $month)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetTotalIncomeForMonthEventImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.month, month) || other.month == month));
  }

  @override
  int get hashCode => Object.hash(runtimeType, userId, month);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetTotalIncomeForMonthEventImplCopyWith<_$GetTotalIncomeForMonthEventImpl>
      get copyWith => __$$GetTotalIncomeForMonthEventImplCopyWithImpl<
          _$GetTotalIncomeForMonthEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String userId) loadIncomes,
    required TResult Function(String userId, DateTime month)
        loadIncomesForMonth,
    required TResult Function(
            String userId,
            double amount,
            String source,
            String description,
            DateTime date,
            String? notes,
            bool isRecurring,
            String? recurrenceFrequency)
        createIncome,
    required TResult Function(Income income) updateIncome,
    required TResult Function(String userId, String incomeId) deleteIncome,
    required TResult Function(String userId, String query) searchIncomes,
    required TResult Function(String userId, String source) filterBySource,
    required TResult Function(String userId) getRecurringIncomes,
    required TResult Function(String userId, DateTime month)
        getTotalIncomeForMonth,
    required TResult Function(String userId) syncIncomes,
  }) {
    return getTotalIncomeForMonth(userId, month);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String userId)? loadIncomes,
    TResult? Function(String userId, DateTime month)? loadIncomesForMonth,
    TResult? Function(
            String userId,
            double amount,
            String source,
            String description,
            DateTime date,
            String? notes,
            bool isRecurring,
            String? recurrenceFrequency)?
        createIncome,
    TResult? Function(Income income)? updateIncome,
    TResult? Function(String userId, String incomeId)? deleteIncome,
    TResult? Function(String userId, String query)? searchIncomes,
    TResult? Function(String userId, String source)? filterBySource,
    TResult? Function(String userId)? getRecurringIncomes,
    TResult? Function(String userId, DateTime month)? getTotalIncomeForMonth,
    TResult? Function(String userId)? syncIncomes,
  }) {
    return getTotalIncomeForMonth?.call(userId, month);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String userId)? loadIncomes,
    TResult Function(String userId, DateTime month)? loadIncomesForMonth,
    TResult Function(
            String userId,
            double amount,
            String source,
            String description,
            DateTime date,
            String? notes,
            bool isRecurring,
            String? recurrenceFrequency)?
        createIncome,
    TResult Function(Income income)? updateIncome,
    TResult Function(String userId, String incomeId)? deleteIncome,
    TResult Function(String userId, String query)? searchIncomes,
    TResult Function(String userId, String source)? filterBySource,
    TResult Function(String userId)? getRecurringIncomes,
    TResult Function(String userId, DateTime month)? getTotalIncomeForMonth,
    TResult Function(String userId)? syncIncomes,
    required TResult orElse(),
  }) {
    if (getTotalIncomeForMonth != null) {
      return getTotalIncomeForMonth(userId, month);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadIncomesEvent value) loadIncomes,
    required TResult Function(LoadIncomesForMonthEvent value)
        loadIncomesForMonth,
    required TResult Function(CreateIncomeEvent value) createIncome,
    required TResult Function(UpdateIncomeEvent value) updateIncome,
    required TResult Function(DeleteIncomeEvent value) deleteIncome,
    required TResult Function(SearchIncomesEvent value) searchIncomes,
    required TResult Function(FilterBySourceEvent value) filterBySource,
    required TResult Function(GetRecurringIncomesEvent value)
        getRecurringIncomes,
    required TResult Function(GetTotalIncomeForMonthEvent value)
        getTotalIncomeForMonth,
    required TResult Function(SyncIncomesEvent value) syncIncomes,
  }) {
    return getTotalIncomeForMonth(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadIncomesEvent value)? loadIncomes,
    TResult? Function(LoadIncomesForMonthEvent value)? loadIncomesForMonth,
    TResult? Function(CreateIncomeEvent value)? createIncome,
    TResult? Function(UpdateIncomeEvent value)? updateIncome,
    TResult? Function(DeleteIncomeEvent value)? deleteIncome,
    TResult? Function(SearchIncomesEvent value)? searchIncomes,
    TResult? Function(FilterBySourceEvent value)? filterBySource,
    TResult? Function(GetRecurringIncomesEvent value)? getRecurringIncomes,
    TResult? Function(GetTotalIncomeForMonthEvent value)?
        getTotalIncomeForMonth,
    TResult? Function(SyncIncomesEvent value)? syncIncomes,
  }) {
    return getTotalIncomeForMonth?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadIncomesEvent value)? loadIncomes,
    TResult Function(LoadIncomesForMonthEvent value)? loadIncomesForMonth,
    TResult Function(CreateIncomeEvent value)? createIncome,
    TResult Function(UpdateIncomeEvent value)? updateIncome,
    TResult Function(DeleteIncomeEvent value)? deleteIncome,
    TResult Function(SearchIncomesEvent value)? searchIncomes,
    TResult Function(FilterBySourceEvent value)? filterBySource,
    TResult Function(GetRecurringIncomesEvent value)? getRecurringIncomes,
    TResult Function(GetTotalIncomeForMonthEvent value)? getTotalIncomeForMonth,
    TResult Function(SyncIncomesEvent value)? syncIncomes,
    required TResult orElse(),
  }) {
    if (getTotalIncomeForMonth != null) {
      return getTotalIncomeForMonth(this);
    }
    return orElse();
  }
}

abstract class GetTotalIncomeForMonthEvent implements IncomeEvent {
  const factory GetTotalIncomeForMonthEvent(
      {required final String userId,
      required final DateTime month}) = _$GetTotalIncomeForMonthEventImpl;

  String get userId;
  DateTime get month;
  @JsonKey(ignore: true)
  _$$GetTotalIncomeForMonthEventImplCopyWith<_$GetTotalIncomeForMonthEventImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SyncIncomesEventImplCopyWith<$Res> {
  factory _$$SyncIncomesEventImplCopyWith(_$SyncIncomesEventImpl value,
          $Res Function(_$SyncIncomesEventImpl) then) =
      __$$SyncIncomesEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String userId});
}

/// @nodoc
class __$$SyncIncomesEventImplCopyWithImpl<$Res>
    extends _$IncomeEventCopyWithImpl<$Res, _$SyncIncomesEventImpl>
    implements _$$SyncIncomesEventImplCopyWith<$Res> {
  __$$SyncIncomesEventImplCopyWithImpl(_$SyncIncomesEventImpl _value,
      $Res Function(_$SyncIncomesEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
  }) {
    return _then(_$SyncIncomesEventImpl(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SyncIncomesEventImpl implements SyncIncomesEvent {
  const _$SyncIncomesEventImpl({required this.userId});

  @override
  final String userId;

  @override
  String toString() {
    return 'IncomeEvent.syncIncomes(userId: $userId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SyncIncomesEventImpl &&
            (identical(other.userId, userId) || other.userId == userId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, userId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SyncIncomesEventImplCopyWith<_$SyncIncomesEventImpl> get copyWith =>
      __$$SyncIncomesEventImplCopyWithImpl<_$SyncIncomesEventImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String userId) loadIncomes,
    required TResult Function(String userId, DateTime month)
        loadIncomesForMonth,
    required TResult Function(
            String userId,
            double amount,
            String source,
            String description,
            DateTime date,
            String? notes,
            bool isRecurring,
            String? recurrenceFrequency)
        createIncome,
    required TResult Function(Income income) updateIncome,
    required TResult Function(String userId, String incomeId) deleteIncome,
    required TResult Function(String userId, String query) searchIncomes,
    required TResult Function(String userId, String source) filterBySource,
    required TResult Function(String userId) getRecurringIncomes,
    required TResult Function(String userId, DateTime month)
        getTotalIncomeForMonth,
    required TResult Function(String userId) syncIncomes,
  }) {
    return syncIncomes(userId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String userId)? loadIncomes,
    TResult? Function(String userId, DateTime month)? loadIncomesForMonth,
    TResult? Function(
            String userId,
            double amount,
            String source,
            String description,
            DateTime date,
            String? notes,
            bool isRecurring,
            String? recurrenceFrequency)?
        createIncome,
    TResult? Function(Income income)? updateIncome,
    TResult? Function(String userId, String incomeId)? deleteIncome,
    TResult? Function(String userId, String query)? searchIncomes,
    TResult? Function(String userId, String source)? filterBySource,
    TResult? Function(String userId)? getRecurringIncomes,
    TResult? Function(String userId, DateTime month)? getTotalIncomeForMonth,
    TResult? Function(String userId)? syncIncomes,
  }) {
    return syncIncomes?.call(userId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String userId)? loadIncomes,
    TResult Function(String userId, DateTime month)? loadIncomesForMonth,
    TResult Function(
            String userId,
            double amount,
            String source,
            String description,
            DateTime date,
            String? notes,
            bool isRecurring,
            String? recurrenceFrequency)?
        createIncome,
    TResult Function(Income income)? updateIncome,
    TResult Function(String userId, String incomeId)? deleteIncome,
    TResult Function(String userId, String query)? searchIncomes,
    TResult Function(String userId, String source)? filterBySource,
    TResult Function(String userId)? getRecurringIncomes,
    TResult Function(String userId, DateTime month)? getTotalIncomeForMonth,
    TResult Function(String userId)? syncIncomes,
    required TResult orElse(),
  }) {
    if (syncIncomes != null) {
      return syncIncomes(userId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadIncomesEvent value) loadIncomes,
    required TResult Function(LoadIncomesForMonthEvent value)
        loadIncomesForMonth,
    required TResult Function(CreateIncomeEvent value) createIncome,
    required TResult Function(UpdateIncomeEvent value) updateIncome,
    required TResult Function(DeleteIncomeEvent value) deleteIncome,
    required TResult Function(SearchIncomesEvent value) searchIncomes,
    required TResult Function(FilterBySourceEvent value) filterBySource,
    required TResult Function(GetRecurringIncomesEvent value)
        getRecurringIncomes,
    required TResult Function(GetTotalIncomeForMonthEvent value)
        getTotalIncomeForMonth,
    required TResult Function(SyncIncomesEvent value) syncIncomes,
  }) {
    return syncIncomes(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadIncomesEvent value)? loadIncomes,
    TResult? Function(LoadIncomesForMonthEvent value)? loadIncomesForMonth,
    TResult? Function(CreateIncomeEvent value)? createIncome,
    TResult? Function(UpdateIncomeEvent value)? updateIncome,
    TResult? Function(DeleteIncomeEvent value)? deleteIncome,
    TResult? Function(SearchIncomesEvent value)? searchIncomes,
    TResult? Function(FilterBySourceEvent value)? filterBySource,
    TResult? Function(GetRecurringIncomesEvent value)? getRecurringIncomes,
    TResult? Function(GetTotalIncomeForMonthEvent value)?
        getTotalIncomeForMonth,
    TResult? Function(SyncIncomesEvent value)? syncIncomes,
  }) {
    return syncIncomes?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadIncomesEvent value)? loadIncomes,
    TResult Function(LoadIncomesForMonthEvent value)? loadIncomesForMonth,
    TResult Function(CreateIncomeEvent value)? createIncome,
    TResult Function(UpdateIncomeEvent value)? updateIncome,
    TResult Function(DeleteIncomeEvent value)? deleteIncome,
    TResult Function(SearchIncomesEvent value)? searchIncomes,
    TResult Function(FilterBySourceEvent value)? filterBySource,
    TResult Function(GetRecurringIncomesEvent value)? getRecurringIncomes,
    TResult Function(GetTotalIncomeForMonthEvent value)? getTotalIncomeForMonth,
    TResult Function(SyncIncomesEvent value)? syncIncomes,
    required TResult orElse(),
  }) {
    if (syncIncomes != null) {
      return syncIncomes(this);
    }
    return orElse();
  }
}

abstract class SyncIncomesEvent implements IncomeEvent {
  const factory SyncIncomesEvent({required final String userId}) =
      _$SyncIncomesEventImpl;

  String get userId;
  @JsonKey(ignore: true)
  _$$SyncIncomesEventImplCopyWith<_$SyncIncomesEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
