// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'income.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Income _$IncomeFromJson(Map<String, dynamic> json) {
  return _Income.fromJson(json);
}

/// @nodoc
mixin _$Income {
  @HiveField(0)
  String get id => throw _privateConstructorUsedError;
  @HiveField(1)
  String get userId => throw _privateConstructorUsedError;
  @HiveField(2)
  double get amount => throw _privateConstructorUsedError;
  @HiveField(3)
  String get source =>
      throw _privateConstructorUsedError; // Salary, Freelance, Business, Investment, etc.
  @HiveField(4)
  String get description => throw _privateConstructorUsedError;
  @HiveField(5)
  DateTime get date => throw _privateConstructorUsedError;
  @HiveField(6)
  String? get notes => throw _privateConstructorUsedError;
  @HiveField(7)
  bool get isRecurring => throw _privateConstructorUsedError;
  @HiveField(8)
  String? get recurrenceFrequency =>
      throw _privateConstructorUsedError; // monthly, weekly, yearly
  @HiveField(9)
  DateTime get createdAt => throw _privateConstructorUsedError;
  @HiveField(10)
  DateTime? get updatedAt => throw _privateConstructorUsedError;
  @HiveField(11)
  bool get isSynced => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $IncomeCopyWith<Income> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IncomeCopyWith<$Res> {
  factory $IncomeCopyWith(Income value, $Res Function(Income) then) =
      _$IncomeCopyWithImpl<$Res, Income>;
  @useResult
  $Res call(
      {@HiveField(0) String id,
      @HiveField(1) String userId,
      @HiveField(2) double amount,
      @HiveField(3) String source,
      @HiveField(4) String description,
      @HiveField(5) DateTime date,
      @HiveField(6) String? notes,
      @HiveField(7) bool isRecurring,
      @HiveField(8) String? recurrenceFrequency,
      @HiveField(9) DateTime createdAt,
      @HiveField(10) DateTime? updatedAt,
      @HiveField(11) bool isSynced});
}

/// @nodoc
class _$IncomeCopyWithImpl<$Res, $Val extends Income>
    implements $IncomeCopyWith<$Res> {
  _$IncomeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? amount = null,
    Object? source = null,
    Object? description = null,
    Object? date = null,
    Object? notes = freezed,
    Object? isRecurring = null,
    Object? recurrenceFrequency = freezed,
    Object? createdAt = null,
    Object? updatedAt = freezed,
    Object? isSynced = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
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
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      isSynced: null == isSynced
          ? _value.isSynced
          : isSynced // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$IncomeImplCopyWith<$Res> implements $IncomeCopyWith<$Res> {
  factory _$$IncomeImplCopyWith(
          _$IncomeImpl value, $Res Function(_$IncomeImpl) then) =
      __$$IncomeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) String id,
      @HiveField(1) String userId,
      @HiveField(2) double amount,
      @HiveField(3) String source,
      @HiveField(4) String description,
      @HiveField(5) DateTime date,
      @HiveField(6) String? notes,
      @HiveField(7) bool isRecurring,
      @HiveField(8) String? recurrenceFrequency,
      @HiveField(9) DateTime createdAt,
      @HiveField(10) DateTime? updatedAt,
      @HiveField(11) bool isSynced});
}

/// @nodoc
class __$$IncomeImplCopyWithImpl<$Res>
    extends _$IncomeCopyWithImpl<$Res, _$IncomeImpl>
    implements _$$IncomeImplCopyWith<$Res> {
  __$$IncomeImplCopyWithImpl(
      _$IncomeImpl _value, $Res Function(_$IncomeImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? amount = null,
    Object? source = null,
    Object? description = null,
    Object? date = null,
    Object? notes = freezed,
    Object? isRecurring = null,
    Object? recurrenceFrequency = freezed,
    Object? createdAt = null,
    Object? updatedAt = freezed,
    Object? isSynced = null,
  }) {
    return _then(_$IncomeImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
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
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      isSynced: null == isSynced
          ? _value.isSynced
          : isSynced // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$IncomeImpl extends _Income {
  const _$IncomeImpl(
      {@HiveField(0) required this.id,
      @HiveField(1) required this.userId,
      @HiveField(2) required this.amount,
      @HiveField(3) required this.source,
      @HiveField(4) required this.description,
      @HiveField(5) required this.date,
      @HiveField(6) this.notes,
      @HiveField(7) this.isRecurring = false,
      @HiveField(8) this.recurrenceFrequency,
      @HiveField(9) required this.createdAt,
      @HiveField(10) this.updatedAt,
      @HiveField(11) this.isSynced = false})
      : super._();

  factory _$IncomeImpl.fromJson(Map<String, dynamic> json) =>
      _$$IncomeImplFromJson(json);

  @override
  @HiveField(0)
  final String id;
  @override
  @HiveField(1)
  final String userId;
  @override
  @HiveField(2)
  final double amount;
  @override
  @HiveField(3)
  final String source;
// Salary, Freelance, Business, Investment, etc.
  @override
  @HiveField(4)
  final String description;
  @override
  @HiveField(5)
  final DateTime date;
  @override
  @HiveField(6)
  final String? notes;
  @override
  @JsonKey()
  @HiveField(7)
  final bool isRecurring;
  @override
  @HiveField(8)
  final String? recurrenceFrequency;
// monthly, weekly, yearly
  @override
  @HiveField(9)
  final DateTime createdAt;
  @override
  @HiveField(10)
  final DateTime? updatedAt;
  @override
  @JsonKey()
  @HiveField(11)
  final bool isSynced;

  @override
  String toString() {
    return 'Income(id: $id, userId: $userId, amount: $amount, source: $source, description: $description, date: $date, notes: $notes, isRecurring: $isRecurring, recurrenceFrequency: $recurrenceFrequency, createdAt: $createdAt, updatedAt: $updatedAt, isSynced: $isSynced)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$IncomeImpl &&
            (identical(other.id, id) || other.id == id) &&
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
                other.recurrenceFrequency == recurrenceFrequency) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.isSynced, isSynced) ||
                other.isSynced == isSynced));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      userId,
      amount,
      source,
      description,
      date,
      notes,
      isRecurring,
      recurrenceFrequency,
      createdAt,
      updatedAt,
      isSynced);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$IncomeImplCopyWith<_$IncomeImpl> get copyWith =>
      __$$IncomeImplCopyWithImpl<_$IncomeImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$IncomeImplToJson(
      this,
    );
  }
}

abstract class _Income extends Income {
  const factory _Income(
      {@HiveField(0) required final String id,
      @HiveField(1) required final String userId,
      @HiveField(2) required final double amount,
      @HiveField(3) required final String source,
      @HiveField(4) required final String description,
      @HiveField(5) required final DateTime date,
      @HiveField(6) final String? notes,
      @HiveField(7) final bool isRecurring,
      @HiveField(8) final String? recurrenceFrequency,
      @HiveField(9) required final DateTime createdAt,
      @HiveField(10) final DateTime? updatedAt,
      @HiveField(11) final bool isSynced}) = _$IncomeImpl;
  const _Income._() : super._();

  factory _Income.fromJson(Map<String, dynamic> json) = _$IncomeImpl.fromJson;

  @override
  @HiveField(0)
  String get id;
  @override
  @HiveField(1)
  String get userId;
  @override
  @HiveField(2)
  double get amount;
  @override
  @HiveField(3)
  String get source;
  @override // Salary, Freelance, Business, Investment, etc.
  @HiveField(4)
  String get description;
  @override
  @HiveField(5)
  DateTime get date;
  @override
  @HiveField(6)
  String? get notes;
  @override
  @HiveField(7)
  bool get isRecurring;
  @override
  @HiveField(8)
  String? get recurrenceFrequency;
  @override // monthly, weekly, yearly
  @HiveField(9)
  DateTime get createdAt;
  @override
  @HiveField(10)
  DateTime? get updatedAt;
  @override
  @HiveField(11)
  bool get isSynced;
  @override
  @JsonKey(ignore: true)
  _$$IncomeImplCopyWith<_$IncomeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
