// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'recurring_transaction.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

RecurringTransaction _$RecurringTransactionFromJson(Map<String, dynamic> json) {
  return _RecurringTransaction.fromJson(json);
}

/// @nodoc
mixin _$RecurringTransaction {
  @HiveField(0)
  String get id => throw _privateConstructorUsedError;
  @HiveField(1)
  String get userId => throw _privateConstructorUsedError;
  @HiveField(2)
  double get amount => throw _privateConstructorUsedError;
  @HiveField(3)
  String get category => throw _privateConstructorUsedError;
  @HiveField(4)
  String get description => throw _privateConstructorUsedError;
  @HiveField(5)
  RecurringFrequency get frequency => throw _privateConstructorUsedError;
  @HiveField(6)
  DateTime get nextDueDate => throw _privateConstructorUsedError;
  @HiveField(7)
  bool get isActive => throw _privateConstructorUsedError;
  @HiveField(8)
  String? get paymentMethod => throw _privateConstructorUsedError;
  @HiveField(9)
  String? get notes => throw _privateConstructorUsedError;
  @HiveField(10)
  DateTime get createdAt => throw _privateConstructorUsedError;
  @HiveField(11)
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RecurringTransactionCopyWith<RecurringTransaction> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecurringTransactionCopyWith<$Res> {
  factory $RecurringTransactionCopyWith(RecurringTransaction value,
          $Res Function(RecurringTransaction) then) =
      _$RecurringTransactionCopyWithImpl<$Res, RecurringTransaction>;
  @useResult
  $Res call(
      {@HiveField(0) String id,
      @HiveField(1) String userId,
      @HiveField(2) double amount,
      @HiveField(3) String category,
      @HiveField(4) String description,
      @HiveField(5) RecurringFrequency frequency,
      @HiveField(6) DateTime nextDueDate,
      @HiveField(7) bool isActive,
      @HiveField(8) String? paymentMethod,
      @HiveField(9) String? notes,
      @HiveField(10) DateTime createdAt,
      @HiveField(11) DateTime? updatedAt});
}

/// @nodoc
class _$RecurringTransactionCopyWithImpl<$Res,
        $Val extends RecurringTransaction>
    implements $RecurringTransactionCopyWith<$Res> {
  _$RecurringTransactionCopyWithImpl(this._value, this._then);

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
    Object? category = null,
    Object? description = null,
    Object? frequency = null,
    Object? nextDueDate = null,
    Object? isActive = null,
    Object? paymentMethod = freezed,
    Object? notes = freezed,
    Object? createdAt = null,
    Object? updatedAt = freezed,
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
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      frequency: null == frequency
          ? _value.frequency
          : frequency // ignore: cast_nullable_to_non_nullable
              as RecurringFrequency,
      nextDueDate: null == nextDueDate
          ? _value.nextDueDate
          : nextDueDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
      paymentMethod: freezed == paymentMethod
          ? _value.paymentMethod
          : paymentMethod // ignore: cast_nullable_to_non_nullable
              as String?,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RecurringTransactionImplCopyWith<$Res>
    implements $RecurringTransactionCopyWith<$Res> {
  factory _$$RecurringTransactionImplCopyWith(_$RecurringTransactionImpl value,
          $Res Function(_$RecurringTransactionImpl) then) =
      __$$RecurringTransactionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) String id,
      @HiveField(1) String userId,
      @HiveField(2) double amount,
      @HiveField(3) String category,
      @HiveField(4) String description,
      @HiveField(5) RecurringFrequency frequency,
      @HiveField(6) DateTime nextDueDate,
      @HiveField(7) bool isActive,
      @HiveField(8) String? paymentMethod,
      @HiveField(9) String? notes,
      @HiveField(10) DateTime createdAt,
      @HiveField(11) DateTime? updatedAt});
}

/// @nodoc
class __$$RecurringTransactionImplCopyWithImpl<$Res>
    extends _$RecurringTransactionCopyWithImpl<$Res, _$RecurringTransactionImpl>
    implements _$$RecurringTransactionImplCopyWith<$Res> {
  __$$RecurringTransactionImplCopyWithImpl(_$RecurringTransactionImpl _value,
      $Res Function(_$RecurringTransactionImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? amount = null,
    Object? category = null,
    Object? description = null,
    Object? frequency = null,
    Object? nextDueDate = null,
    Object? isActive = null,
    Object? paymentMethod = freezed,
    Object? notes = freezed,
    Object? createdAt = null,
    Object? updatedAt = freezed,
  }) {
    return _then(_$RecurringTransactionImpl(
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
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      frequency: null == frequency
          ? _value.frequency
          : frequency // ignore: cast_nullable_to_non_nullable
              as RecurringFrequency,
      nextDueDate: null == nextDueDate
          ? _value.nextDueDate
          : nextDueDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
      paymentMethod: freezed == paymentMethod
          ? _value.paymentMethod
          : paymentMethod // ignore: cast_nullable_to_non_nullable
              as String?,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RecurringTransactionImpl implements _RecurringTransaction {
  const _$RecurringTransactionImpl(
      {@HiveField(0) required this.id,
      @HiveField(1) required this.userId,
      @HiveField(2) required this.amount,
      @HiveField(3) required this.category,
      @HiveField(4) required this.description,
      @HiveField(5) required this.frequency,
      @HiveField(6) required this.nextDueDate,
      @HiveField(7) this.isActive = true,
      @HiveField(8) this.paymentMethod,
      @HiveField(9) this.notes,
      @HiveField(10) required this.createdAt,
      @HiveField(11) this.updatedAt});

  factory _$RecurringTransactionImpl.fromJson(Map<String, dynamic> json) =>
      _$$RecurringTransactionImplFromJson(json);

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
  final String category;
  @override
  @HiveField(4)
  final String description;
  @override
  @HiveField(5)
  final RecurringFrequency frequency;
  @override
  @HiveField(6)
  final DateTime nextDueDate;
  @override
  @JsonKey()
  @HiveField(7)
  final bool isActive;
  @override
  @HiveField(8)
  final String? paymentMethod;
  @override
  @HiveField(9)
  final String? notes;
  @override
  @HiveField(10)
  final DateTime createdAt;
  @override
  @HiveField(11)
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'RecurringTransaction(id: $id, userId: $userId, amount: $amount, category: $category, description: $description, frequency: $frequency, nextDueDate: $nextDueDate, isActive: $isActive, paymentMethod: $paymentMethod, notes: $notes, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RecurringTransactionImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.frequency, frequency) ||
                other.frequency == frequency) &&
            (identical(other.nextDueDate, nextDueDate) ||
                other.nextDueDate == nextDueDate) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.paymentMethod, paymentMethod) ||
                other.paymentMethod == paymentMethod) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      userId,
      amount,
      category,
      description,
      frequency,
      nextDueDate,
      isActive,
      paymentMethod,
      notes,
      createdAt,
      updatedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RecurringTransactionImplCopyWith<_$RecurringTransactionImpl>
      get copyWith =>
          __$$RecurringTransactionImplCopyWithImpl<_$RecurringTransactionImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RecurringTransactionImplToJson(
      this,
    );
  }
}

abstract class _RecurringTransaction implements RecurringTransaction {
  const factory _RecurringTransaction(
      {@HiveField(0) required final String id,
      @HiveField(1) required final String userId,
      @HiveField(2) required final double amount,
      @HiveField(3) required final String category,
      @HiveField(4) required final String description,
      @HiveField(5) required final RecurringFrequency frequency,
      @HiveField(6) required final DateTime nextDueDate,
      @HiveField(7) final bool isActive,
      @HiveField(8) final String? paymentMethod,
      @HiveField(9) final String? notes,
      @HiveField(10) required final DateTime createdAt,
      @HiveField(11) final DateTime? updatedAt}) = _$RecurringTransactionImpl;

  factory _RecurringTransaction.fromJson(Map<String, dynamic> json) =
      _$RecurringTransactionImpl.fromJson;

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
  String get category;
  @override
  @HiveField(4)
  String get description;
  @override
  @HiveField(5)
  RecurringFrequency get frequency;
  @override
  @HiveField(6)
  DateTime get nextDueDate;
  @override
  @HiveField(7)
  bool get isActive;
  @override
  @HiveField(8)
  String? get paymentMethod;
  @override
  @HiveField(9)
  String? get notes;
  @override
  @HiveField(10)
  DateTime get createdAt;
  @override
  @HiveField(11)
  DateTime? get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$RecurringTransactionImplCopyWith<_$RecurringTransactionImpl>
      get copyWith => throw _privateConstructorUsedError;
}
