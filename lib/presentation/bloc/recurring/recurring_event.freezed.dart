// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'recurring_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$RecurringEvent {
  String get userId => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String userId) loadRecurringTransactions,
    required TResult Function(
      String userId,
      double amount,
      String category,
      String description,
      RecurringFrequency frequency,
      DateTime nextDueDate,
      String? paymentMethod,
      String? notes,
    )
    createRecurringTransaction,
    required TResult Function(
      String id,
      String userId,
      double amount,
      String category,
      String description,
      RecurringFrequency frequency,
      DateTime nextDueDate,
      bool isActive,
      String? paymentMethod,
      String? notes,
      DateTime createdAt,
    )
    toggleRecurringTransaction,
    required TResult Function(String userId, String transactionId)
    deleteRecurringTransaction,
    required TResult Function(String userId) detectRecurringPatterns,
    required TResult Function(String userId) processRecurringTransactions,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String userId)? loadRecurringTransactions,
    TResult? Function(
      String userId,
      double amount,
      String category,
      String description,
      RecurringFrequency frequency,
      DateTime nextDueDate,
      String? paymentMethod,
      String? notes,
    )?
    createRecurringTransaction,
    TResult? Function(
      String id,
      String userId,
      double amount,
      String category,
      String description,
      RecurringFrequency frequency,
      DateTime nextDueDate,
      bool isActive,
      String? paymentMethod,
      String? notes,
      DateTime createdAt,
    )?
    toggleRecurringTransaction,
    TResult? Function(String userId, String transactionId)?
    deleteRecurringTransaction,
    TResult? Function(String userId)? detectRecurringPatterns,
    TResult? Function(String userId)? processRecurringTransactions,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String userId)? loadRecurringTransactions,
    TResult Function(
      String userId,
      double amount,
      String category,
      String description,
      RecurringFrequency frequency,
      DateTime nextDueDate,
      String? paymentMethod,
      String? notes,
    )?
    createRecurringTransaction,
    TResult Function(
      String id,
      String userId,
      double amount,
      String category,
      String description,
      RecurringFrequency frequency,
      DateTime nextDueDate,
      bool isActive,
      String? paymentMethod,
      String? notes,
      DateTime createdAt,
    )?
    toggleRecurringTransaction,
    TResult Function(String userId, String transactionId)?
    deleteRecurringTransaction,
    TResult Function(String userId)? detectRecurringPatterns,
    TResult Function(String userId)? processRecurringTransactions,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadRecurringTransactions value)
    loadRecurringTransactions,
    required TResult Function(CreateRecurringTransaction value)
    createRecurringTransaction,
    required TResult Function(ToggleRecurringTransaction value)
    toggleRecurringTransaction,
    required TResult Function(DeleteRecurringTransaction value)
    deleteRecurringTransaction,
    required TResult Function(DetectRecurringPatterns value)
    detectRecurringPatterns,
    required TResult Function(ProcessRecurringTransactions value)
    processRecurringTransactions,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadRecurringTransactions value)?
    loadRecurringTransactions,
    TResult? Function(CreateRecurringTransaction value)?
    createRecurringTransaction,
    TResult? Function(ToggleRecurringTransaction value)?
    toggleRecurringTransaction,
    TResult? Function(DeleteRecurringTransaction value)?
    deleteRecurringTransaction,
    TResult? Function(DetectRecurringPatterns value)? detectRecurringPatterns,
    TResult? Function(ProcessRecurringTransactions value)?
    processRecurringTransactions,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadRecurringTransactions value)?
    loadRecurringTransactions,
    TResult Function(CreateRecurringTransaction value)?
    createRecurringTransaction,
    TResult Function(ToggleRecurringTransaction value)?
    toggleRecurringTransaction,
    TResult Function(DeleteRecurringTransaction value)?
    deleteRecurringTransaction,
    TResult Function(DetectRecurringPatterns value)? detectRecurringPatterns,
    TResult Function(ProcessRecurringTransactions value)?
    processRecurringTransactions,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RecurringEventCopyWith<RecurringEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecurringEventCopyWith<$Res> {
  factory $RecurringEventCopyWith(
    RecurringEvent value,
    $Res Function(RecurringEvent) then,
  ) = _$RecurringEventCopyWithImpl<$Res, RecurringEvent>;
  @useResult
  $Res call({String userId});
}

/// @nodoc
class _$RecurringEventCopyWithImpl<$Res, $Val extends RecurringEvent>
    implements $RecurringEventCopyWith<$Res> {
  _$RecurringEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? userId = null}) {
    return _then(
      _value.copyWith(
            userId: null == userId
                ? _value.userId
                : userId // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$LoadRecurringTransactionsImplCopyWith<$Res>
    implements $RecurringEventCopyWith<$Res> {
  factory _$$LoadRecurringTransactionsImplCopyWith(
    _$LoadRecurringTransactionsImpl value,
    $Res Function(_$LoadRecurringTransactionsImpl) then,
  ) = __$$LoadRecurringTransactionsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String userId});
}

/// @nodoc
class __$$LoadRecurringTransactionsImplCopyWithImpl<$Res>
    extends _$RecurringEventCopyWithImpl<$Res, _$LoadRecurringTransactionsImpl>
    implements _$$LoadRecurringTransactionsImplCopyWith<$Res> {
  __$$LoadRecurringTransactionsImplCopyWithImpl(
    _$LoadRecurringTransactionsImpl _value,
    $Res Function(_$LoadRecurringTransactionsImpl) _then,
  ) : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? userId = null}) {
    return _then(
      _$LoadRecurringTransactionsImpl(
        userId: null == userId
            ? _value.userId
            : userId // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$LoadRecurringTransactionsImpl implements LoadRecurringTransactions {
  const _$LoadRecurringTransactionsImpl({required this.userId});

  @override
  final String userId;

  @override
  String toString() {
    return 'RecurringEvent.loadRecurringTransactions(userId: $userId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadRecurringTransactionsImpl &&
            (identical(other.userId, userId) || other.userId == userId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, userId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadRecurringTransactionsImplCopyWith<_$LoadRecurringTransactionsImpl>
  get copyWith =>
      __$$LoadRecurringTransactionsImplCopyWithImpl<
        _$LoadRecurringTransactionsImpl
      >(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String userId) loadRecurringTransactions,
    required TResult Function(
      String userId,
      double amount,
      String category,
      String description,
      RecurringFrequency frequency,
      DateTime nextDueDate,
      String? paymentMethod,
      String? notes,
    )
    createRecurringTransaction,
    required TResult Function(
      String id,
      String userId,
      double amount,
      String category,
      String description,
      RecurringFrequency frequency,
      DateTime nextDueDate,
      bool isActive,
      String? paymentMethod,
      String? notes,
      DateTime createdAt,
    )
    toggleRecurringTransaction,
    required TResult Function(String userId, String transactionId)
    deleteRecurringTransaction,
    required TResult Function(String userId) detectRecurringPatterns,
    required TResult Function(String userId) processRecurringTransactions,
  }) {
    return loadRecurringTransactions(userId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String userId)? loadRecurringTransactions,
    TResult? Function(
      String userId,
      double amount,
      String category,
      String description,
      RecurringFrequency frequency,
      DateTime nextDueDate,
      String? paymentMethod,
      String? notes,
    )?
    createRecurringTransaction,
    TResult? Function(
      String id,
      String userId,
      double amount,
      String category,
      String description,
      RecurringFrequency frequency,
      DateTime nextDueDate,
      bool isActive,
      String? paymentMethod,
      String? notes,
      DateTime createdAt,
    )?
    toggleRecurringTransaction,
    TResult? Function(String userId, String transactionId)?
    deleteRecurringTransaction,
    TResult? Function(String userId)? detectRecurringPatterns,
    TResult? Function(String userId)? processRecurringTransactions,
  }) {
    return loadRecurringTransactions?.call(userId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String userId)? loadRecurringTransactions,
    TResult Function(
      String userId,
      double amount,
      String category,
      String description,
      RecurringFrequency frequency,
      DateTime nextDueDate,
      String? paymentMethod,
      String? notes,
    )?
    createRecurringTransaction,
    TResult Function(
      String id,
      String userId,
      double amount,
      String category,
      String description,
      RecurringFrequency frequency,
      DateTime nextDueDate,
      bool isActive,
      String? paymentMethod,
      String? notes,
      DateTime createdAt,
    )?
    toggleRecurringTransaction,
    TResult Function(String userId, String transactionId)?
    deleteRecurringTransaction,
    TResult Function(String userId)? detectRecurringPatterns,
    TResult Function(String userId)? processRecurringTransactions,
    required TResult orElse(),
  }) {
    if (loadRecurringTransactions != null) {
      return loadRecurringTransactions(userId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadRecurringTransactions value)
    loadRecurringTransactions,
    required TResult Function(CreateRecurringTransaction value)
    createRecurringTransaction,
    required TResult Function(ToggleRecurringTransaction value)
    toggleRecurringTransaction,
    required TResult Function(DeleteRecurringTransaction value)
    deleteRecurringTransaction,
    required TResult Function(DetectRecurringPatterns value)
    detectRecurringPatterns,
    required TResult Function(ProcessRecurringTransactions value)
    processRecurringTransactions,
  }) {
    return loadRecurringTransactions(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadRecurringTransactions value)?
    loadRecurringTransactions,
    TResult? Function(CreateRecurringTransaction value)?
    createRecurringTransaction,
    TResult? Function(ToggleRecurringTransaction value)?
    toggleRecurringTransaction,
    TResult? Function(DeleteRecurringTransaction value)?
    deleteRecurringTransaction,
    TResult? Function(DetectRecurringPatterns value)? detectRecurringPatterns,
    TResult? Function(ProcessRecurringTransactions value)?
    processRecurringTransactions,
  }) {
    return loadRecurringTransactions?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadRecurringTransactions value)?
    loadRecurringTransactions,
    TResult Function(CreateRecurringTransaction value)?
    createRecurringTransaction,
    TResult Function(ToggleRecurringTransaction value)?
    toggleRecurringTransaction,
    TResult Function(DeleteRecurringTransaction value)?
    deleteRecurringTransaction,
    TResult Function(DetectRecurringPatterns value)? detectRecurringPatterns,
    TResult Function(ProcessRecurringTransactions value)?
    processRecurringTransactions,
    required TResult orElse(),
  }) {
    if (loadRecurringTransactions != null) {
      return loadRecurringTransactions(this);
    }
    return orElse();
  }
}

abstract class LoadRecurringTransactions implements RecurringEvent {
  const factory LoadRecurringTransactions({required final String userId}) =
      _$LoadRecurringTransactionsImpl;

  @override
  String get userId;
  @override
  @JsonKey(ignore: true)
  _$$LoadRecurringTransactionsImplCopyWith<_$LoadRecurringTransactionsImpl>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CreateRecurringTransactionImplCopyWith<$Res>
    implements $RecurringEventCopyWith<$Res> {
  factory _$$CreateRecurringTransactionImplCopyWith(
    _$CreateRecurringTransactionImpl value,
    $Res Function(_$CreateRecurringTransactionImpl) then,
  ) = __$$CreateRecurringTransactionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String userId,
    double amount,
    String category,
    String description,
    RecurringFrequency frequency,
    DateTime nextDueDate,
    String? paymentMethod,
    String? notes,
  });
}

/// @nodoc
class __$$CreateRecurringTransactionImplCopyWithImpl<$Res>
    extends _$RecurringEventCopyWithImpl<$Res, _$CreateRecurringTransactionImpl>
    implements _$$CreateRecurringTransactionImplCopyWith<$Res> {
  __$$CreateRecurringTransactionImplCopyWithImpl(
    _$CreateRecurringTransactionImpl _value,
    $Res Function(_$CreateRecurringTransactionImpl) _then,
  ) : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? amount = null,
    Object? category = null,
    Object? description = null,
    Object? frequency = null,
    Object? nextDueDate = null,
    Object? paymentMethod = freezed,
    Object? notes = freezed,
  }) {
    return _then(
      _$CreateRecurringTransactionImpl(
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
        paymentMethod: freezed == paymentMethod
            ? _value.paymentMethod
            : paymentMethod // ignore: cast_nullable_to_non_nullable
                  as String?,
        notes: freezed == notes
            ? _value.notes
            : notes // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc

class _$CreateRecurringTransactionImpl implements CreateRecurringTransaction {
  const _$CreateRecurringTransactionImpl({
    required this.userId,
    required this.amount,
    required this.category,
    required this.description,
    required this.frequency,
    required this.nextDueDate,
    this.paymentMethod,
    this.notes,
  });

  @override
  final String userId;
  @override
  final double amount;
  @override
  final String category;
  @override
  final String description;
  @override
  final RecurringFrequency frequency;
  @override
  final DateTime nextDueDate;
  @override
  final String? paymentMethod;
  @override
  final String? notes;

  @override
  String toString() {
    return 'RecurringEvent.createRecurringTransaction(userId: $userId, amount: $amount, category: $category, description: $description, frequency: $frequency, nextDueDate: $nextDueDate, paymentMethod: $paymentMethod, notes: $notes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateRecurringTransactionImpl &&
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
            (identical(other.paymentMethod, paymentMethod) ||
                other.paymentMethod == paymentMethod) &&
            (identical(other.notes, notes) || other.notes == notes));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    userId,
    amount,
    category,
    description,
    frequency,
    nextDueDate,
    paymentMethod,
    notes,
  );

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateRecurringTransactionImplCopyWith<_$CreateRecurringTransactionImpl>
  get copyWith =>
      __$$CreateRecurringTransactionImplCopyWithImpl<
        _$CreateRecurringTransactionImpl
      >(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String userId) loadRecurringTransactions,
    required TResult Function(
      String userId,
      double amount,
      String category,
      String description,
      RecurringFrequency frequency,
      DateTime nextDueDate,
      String? paymentMethod,
      String? notes,
    )
    createRecurringTransaction,
    required TResult Function(
      String id,
      String userId,
      double amount,
      String category,
      String description,
      RecurringFrequency frequency,
      DateTime nextDueDate,
      bool isActive,
      String? paymentMethod,
      String? notes,
      DateTime createdAt,
    )
    toggleRecurringTransaction,
    required TResult Function(String userId, String transactionId)
    deleteRecurringTransaction,
    required TResult Function(String userId) detectRecurringPatterns,
    required TResult Function(String userId) processRecurringTransactions,
  }) {
    return createRecurringTransaction(
      userId,
      amount,
      category,
      description,
      frequency,
      nextDueDate,
      paymentMethod,
      notes,
    );
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String userId)? loadRecurringTransactions,
    TResult? Function(
      String userId,
      double amount,
      String category,
      String description,
      RecurringFrequency frequency,
      DateTime nextDueDate,
      String? paymentMethod,
      String? notes,
    )?
    createRecurringTransaction,
    TResult? Function(
      String id,
      String userId,
      double amount,
      String category,
      String description,
      RecurringFrequency frequency,
      DateTime nextDueDate,
      bool isActive,
      String? paymentMethod,
      String? notes,
      DateTime createdAt,
    )?
    toggleRecurringTransaction,
    TResult? Function(String userId, String transactionId)?
    deleteRecurringTransaction,
    TResult? Function(String userId)? detectRecurringPatterns,
    TResult? Function(String userId)? processRecurringTransactions,
  }) {
    return createRecurringTransaction?.call(
      userId,
      amount,
      category,
      description,
      frequency,
      nextDueDate,
      paymentMethod,
      notes,
    );
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String userId)? loadRecurringTransactions,
    TResult Function(
      String userId,
      double amount,
      String category,
      String description,
      RecurringFrequency frequency,
      DateTime nextDueDate,
      String? paymentMethod,
      String? notes,
    )?
    createRecurringTransaction,
    TResult Function(
      String id,
      String userId,
      double amount,
      String category,
      String description,
      RecurringFrequency frequency,
      DateTime nextDueDate,
      bool isActive,
      String? paymentMethod,
      String? notes,
      DateTime createdAt,
    )?
    toggleRecurringTransaction,
    TResult Function(String userId, String transactionId)?
    deleteRecurringTransaction,
    TResult Function(String userId)? detectRecurringPatterns,
    TResult Function(String userId)? processRecurringTransactions,
    required TResult orElse(),
  }) {
    if (createRecurringTransaction != null) {
      return createRecurringTransaction(
        userId,
        amount,
        category,
        description,
        frequency,
        nextDueDate,
        paymentMethod,
        notes,
      );
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadRecurringTransactions value)
    loadRecurringTransactions,
    required TResult Function(CreateRecurringTransaction value)
    createRecurringTransaction,
    required TResult Function(ToggleRecurringTransaction value)
    toggleRecurringTransaction,
    required TResult Function(DeleteRecurringTransaction value)
    deleteRecurringTransaction,
    required TResult Function(DetectRecurringPatterns value)
    detectRecurringPatterns,
    required TResult Function(ProcessRecurringTransactions value)
    processRecurringTransactions,
  }) {
    return createRecurringTransaction(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadRecurringTransactions value)?
    loadRecurringTransactions,
    TResult? Function(CreateRecurringTransaction value)?
    createRecurringTransaction,
    TResult? Function(ToggleRecurringTransaction value)?
    toggleRecurringTransaction,
    TResult? Function(DeleteRecurringTransaction value)?
    deleteRecurringTransaction,
    TResult? Function(DetectRecurringPatterns value)? detectRecurringPatterns,
    TResult? Function(ProcessRecurringTransactions value)?
    processRecurringTransactions,
  }) {
    return createRecurringTransaction?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadRecurringTransactions value)?
    loadRecurringTransactions,
    TResult Function(CreateRecurringTransaction value)?
    createRecurringTransaction,
    TResult Function(ToggleRecurringTransaction value)?
    toggleRecurringTransaction,
    TResult Function(DeleteRecurringTransaction value)?
    deleteRecurringTransaction,
    TResult Function(DetectRecurringPatterns value)? detectRecurringPatterns,
    TResult Function(ProcessRecurringTransactions value)?
    processRecurringTransactions,
    required TResult orElse(),
  }) {
    if (createRecurringTransaction != null) {
      return createRecurringTransaction(this);
    }
    return orElse();
  }
}

abstract class CreateRecurringTransaction implements RecurringEvent {
  const factory CreateRecurringTransaction({
    required final String userId,
    required final double amount,
    required final String category,
    required final String description,
    required final RecurringFrequency frequency,
    required final DateTime nextDueDate,
    final String? paymentMethod,
    final String? notes,
  }) = _$CreateRecurringTransactionImpl;

  @override
  String get userId;
  double get amount;
  String get category;
  String get description;
  RecurringFrequency get frequency;
  DateTime get nextDueDate;
  String? get paymentMethod;
  String? get notes;
  @override
  @JsonKey(ignore: true)
  _$$CreateRecurringTransactionImplCopyWith<_$CreateRecurringTransactionImpl>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ToggleRecurringTransactionImplCopyWith<$Res>
    implements $RecurringEventCopyWith<$Res> {
  factory _$$ToggleRecurringTransactionImplCopyWith(
    _$ToggleRecurringTransactionImpl value,
    $Res Function(_$ToggleRecurringTransactionImpl) then,
  ) = __$$ToggleRecurringTransactionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String userId,
    double amount,
    String category,
    String description,
    RecurringFrequency frequency,
    DateTime nextDueDate,
    bool isActive,
    String? paymentMethod,
    String? notes,
    DateTime createdAt,
  });
}

/// @nodoc
class __$$ToggleRecurringTransactionImplCopyWithImpl<$Res>
    extends _$RecurringEventCopyWithImpl<$Res, _$ToggleRecurringTransactionImpl>
    implements _$$ToggleRecurringTransactionImplCopyWith<$Res> {
  __$$ToggleRecurringTransactionImplCopyWithImpl(
    _$ToggleRecurringTransactionImpl _value,
    $Res Function(_$ToggleRecurringTransactionImpl) _then,
  ) : super(_value, _then);

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
  }) {
    return _then(
      _$ToggleRecurringTransactionImpl(
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
      ),
    );
  }
}

/// @nodoc

class _$ToggleRecurringTransactionImpl implements ToggleRecurringTransaction {
  const _$ToggleRecurringTransactionImpl({
    required this.id,
    required this.userId,
    required this.amount,
    required this.category,
    required this.description,
    required this.frequency,
    required this.nextDueDate,
    required this.isActive,
    this.paymentMethod,
    this.notes,
    required this.createdAt,
  });

  @override
  final String id;
  @override
  final String userId;
  @override
  final double amount;
  @override
  final String category;
  @override
  final String description;
  @override
  final RecurringFrequency frequency;
  @override
  final DateTime nextDueDate;
  @override
  final bool isActive;
  @override
  final String? paymentMethod;
  @override
  final String? notes;
  @override
  final DateTime createdAt;

  @override
  String toString() {
    return 'RecurringEvent.toggleRecurringTransaction(id: $id, userId: $userId, amount: $amount, category: $category, description: $description, frequency: $frequency, nextDueDate: $nextDueDate, isActive: $isActive, paymentMethod: $paymentMethod, notes: $notes, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ToggleRecurringTransactionImpl &&
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
                other.createdAt == createdAt));
  }

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
  );

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ToggleRecurringTransactionImplCopyWith<_$ToggleRecurringTransactionImpl>
  get copyWith =>
      __$$ToggleRecurringTransactionImplCopyWithImpl<
        _$ToggleRecurringTransactionImpl
      >(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String userId) loadRecurringTransactions,
    required TResult Function(
      String userId,
      double amount,
      String category,
      String description,
      RecurringFrequency frequency,
      DateTime nextDueDate,
      String? paymentMethod,
      String? notes,
    )
    createRecurringTransaction,
    required TResult Function(
      String id,
      String userId,
      double amount,
      String category,
      String description,
      RecurringFrequency frequency,
      DateTime nextDueDate,
      bool isActive,
      String? paymentMethod,
      String? notes,
      DateTime createdAt,
    )
    toggleRecurringTransaction,
    required TResult Function(String userId, String transactionId)
    deleteRecurringTransaction,
    required TResult Function(String userId) detectRecurringPatterns,
    required TResult Function(String userId) processRecurringTransactions,
  }) {
    return toggleRecurringTransaction(
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
    );
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String userId)? loadRecurringTransactions,
    TResult? Function(
      String userId,
      double amount,
      String category,
      String description,
      RecurringFrequency frequency,
      DateTime nextDueDate,
      String? paymentMethod,
      String? notes,
    )?
    createRecurringTransaction,
    TResult? Function(
      String id,
      String userId,
      double amount,
      String category,
      String description,
      RecurringFrequency frequency,
      DateTime nextDueDate,
      bool isActive,
      String? paymentMethod,
      String? notes,
      DateTime createdAt,
    )?
    toggleRecurringTransaction,
    TResult? Function(String userId, String transactionId)?
    deleteRecurringTransaction,
    TResult? Function(String userId)? detectRecurringPatterns,
    TResult? Function(String userId)? processRecurringTransactions,
  }) {
    return toggleRecurringTransaction?.call(
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
    );
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String userId)? loadRecurringTransactions,
    TResult Function(
      String userId,
      double amount,
      String category,
      String description,
      RecurringFrequency frequency,
      DateTime nextDueDate,
      String? paymentMethod,
      String? notes,
    )?
    createRecurringTransaction,
    TResult Function(
      String id,
      String userId,
      double amount,
      String category,
      String description,
      RecurringFrequency frequency,
      DateTime nextDueDate,
      bool isActive,
      String? paymentMethod,
      String? notes,
      DateTime createdAt,
    )?
    toggleRecurringTransaction,
    TResult Function(String userId, String transactionId)?
    deleteRecurringTransaction,
    TResult Function(String userId)? detectRecurringPatterns,
    TResult Function(String userId)? processRecurringTransactions,
    required TResult orElse(),
  }) {
    if (toggleRecurringTransaction != null) {
      return toggleRecurringTransaction(
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
      );
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadRecurringTransactions value)
    loadRecurringTransactions,
    required TResult Function(CreateRecurringTransaction value)
    createRecurringTransaction,
    required TResult Function(ToggleRecurringTransaction value)
    toggleRecurringTransaction,
    required TResult Function(DeleteRecurringTransaction value)
    deleteRecurringTransaction,
    required TResult Function(DetectRecurringPatterns value)
    detectRecurringPatterns,
    required TResult Function(ProcessRecurringTransactions value)
    processRecurringTransactions,
  }) {
    return toggleRecurringTransaction(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadRecurringTransactions value)?
    loadRecurringTransactions,
    TResult? Function(CreateRecurringTransaction value)?
    createRecurringTransaction,
    TResult? Function(ToggleRecurringTransaction value)?
    toggleRecurringTransaction,
    TResult? Function(DeleteRecurringTransaction value)?
    deleteRecurringTransaction,
    TResult? Function(DetectRecurringPatterns value)? detectRecurringPatterns,
    TResult? Function(ProcessRecurringTransactions value)?
    processRecurringTransactions,
  }) {
    return toggleRecurringTransaction?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadRecurringTransactions value)?
    loadRecurringTransactions,
    TResult Function(CreateRecurringTransaction value)?
    createRecurringTransaction,
    TResult Function(ToggleRecurringTransaction value)?
    toggleRecurringTransaction,
    TResult Function(DeleteRecurringTransaction value)?
    deleteRecurringTransaction,
    TResult Function(DetectRecurringPatterns value)? detectRecurringPatterns,
    TResult Function(ProcessRecurringTransactions value)?
    processRecurringTransactions,
    required TResult orElse(),
  }) {
    if (toggleRecurringTransaction != null) {
      return toggleRecurringTransaction(this);
    }
    return orElse();
  }
}

abstract class ToggleRecurringTransaction implements RecurringEvent {
  const factory ToggleRecurringTransaction({
    required final String id,
    required final String userId,
    required final double amount,
    required final String category,
    required final String description,
    required final RecurringFrequency frequency,
    required final DateTime nextDueDate,
    required final bool isActive,
    final String? paymentMethod,
    final String? notes,
    required final DateTime createdAt,
  }) = _$ToggleRecurringTransactionImpl;

  String get id;
  @override
  String get userId;
  double get amount;
  String get category;
  String get description;
  RecurringFrequency get frequency;
  DateTime get nextDueDate;
  bool get isActive;
  String? get paymentMethod;
  String? get notes;
  DateTime get createdAt;
  @override
  @JsonKey(ignore: true)
  _$$ToggleRecurringTransactionImplCopyWith<_$ToggleRecurringTransactionImpl>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DeleteRecurringTransactionImplCopyWith<$Res>
    implements $RecurringEventCopyWith<$Res> {
  factory _$$DeleteRecurringTransactionImplCopyWith(
    _$DeleteRecurringTransactionImpl value,
    $Res Function(_$DeleteRecurringTransactionImpl) then,
  ) = __$$DeleteRecurringTransactionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String userId, String transactionId});
}

/// @nodoc
class __$$DeleteRecurringTransactionImplCopyWithImpl<$Res>
    extends _$RecurringEventCopyWithImpl<$Res, _$DeleteRecurringTransactionImpl>
    implements _$$DeleteRecurringTransactionImplCopyWith<$Res> {
  __$$DeleteRecurringTransactionImplCopyWithImpl(
    _$DeleteRecurringTransactionImpl _value,
    $Res Function(_$DeleteRecurringTransactionImpl) _then,
  ) : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? userId = null, Object? transactionId = null}) {
    return _then(
      _$DeleteRecurringTransactionImpl(
        userId: null == userId
            ? _value.userId
            : userId // ignore: cast_nullable_to_non_nullable
                  as String,
        transactionId: null == transactionId
            ? _value.transactionId
            : transactionId // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$DeleteRecurringTransactionImpl implements DeleteRecurringTransaction {
  const _$DeleteRecurringTransactionImpl({
    required this.userId,
    required this.transactionId,
  });

  @override
  final String userId;
  @override
  final String transactionId;

  @override
  String toString() {
    return 'RecurringEvent.deleteRecurringTransaction(userId: $userId, transactionId: $transactionId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeleteRecurringTransactionImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.transactionId, transactionId) ||
                other.transactionId == transactionId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, userId, transactionId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DeleteRecurringTransactionImplCopyWith<_$DeleteRecurringTransactionImpl>
  get copyWith =>
      __$$DeleteRecurringTransactionImplCopyWithImpl<
        _$DeleteRecurringTransactionImpl
      >(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String userId) loadRecurringTransactions,
    required TResult Function(
      String userId,
      double amount,
      String category,
      String description,
      RecurringFrequency frequency,
      DateTime nextDueDate,
      String? paymentMethod,
      String? notes,
    )
    createRecurringTransaction,
    required TResult Function(
      String id,
      String userId,
      double amount,
      String category,
      String description,
      RecurringFrequency frequency,
      DateTime nextDueDate,
      bool isActive,
      String? paymentMethod,
      String? notes,
      DateTime createdAt,
    )
    toggleRecurringTransaction,
    required TResult Function(String userId, String transactionId)
    deleteRecurringTransaction,
    required TResult Function(String userId) detectRecurringPatterns,
    required TResult Function(String userId) processRecurringTransactions,
  }) {
    return deleteRecurringTransaction(userId, transactionId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String userId)? loadRecurringTransactions,
    TResult? Function(
      String userId,
      double amount,
      String category,
      String description,
      RecurringFrequency frequency,
      DateTime nextDueDate,
      String? paymentMethod,
      String? notes,
    )?
    createRecurringTransaction,
    TResult? Function(
      String id,
      String userId,
      double amount,
      String category,
      String description,
      RecurringFrequency frequency,
      DateTime nextDueDate,
      bool isActive,
      String? paymentMethod,
      String? notes,
      DateTime createdAt,
    )?
    toggleRecurringTransaction,
    TResult? Function(String userId, String transactionId)?
    deleteRecurringTransaction,
    TResult? Function(String userId)? detectRecurringPatterns,
    TResult? Function(String userId)? processRecurringTransactions,
  }) {
    return deleteRecurringTransaction?.call(userId, transactionId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String userId)? loadRecurringTransactions,
    TResult Function(
      String userId,
      double amount,
      String category,
      String description,
      RecurringFrequency frequency,
      DateTime nextDueDate,
      String? paymentMethod,
      String? notes,
    )?
    createRecurringTransaction,
    TResult Function(
      String id,
      String userId,
      double amount,
      String category,
      String description,
      RecurringFrequency frequency,
      DateTime nextDueDate,
      bool isActive,
      String? paymentMethod,
      String? notes,
      DateTime createdAt,
    )?
    toggleRecurringTransaction,
    TResult Function(String userId, String transactionId)?
    deleteRecurringTransaction,
    TResult Function(String userId)? detectRecurringPatterns,
    TResult Function(String userId)? processRecurringTransactions,
    required TResult orElse(),
  }) {
    if (deleteRecurringTransaction != null) {
      return deleteRecurringTransaction(userId, transactionId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadRecurringTransactions value)
    loadRecurringTransactions,
    required TResult Function(CreateRecurringTransaction value)
    createRecurringTransaction,
    required TResult Function(ToggleRecurringTransaction value)
    toggleRecurringTransaction,
    required TResult Function(DeleteRecurringTransaction value)
    deleteRecurringTransaction,
    required TResult Function(DetectRecurringPatterns value)
    detectRecurringPatterns,
    required TResult Function(ProcessRecurringTransactions value)
    processRecurringTransactions,
  }) {
    return deleteRecurringTransaction(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadRecurringTransactions value)?
    loadRecurringTransactions,
    TResult? Function(CreateRecurringTransaction value)?
    createRecurringTransaction,
    TResult? Function(ToggleRecurringTransaction value)?
    toggleRecurringTransaction,
    TResult? Function(DeleteRecurringTransaction value)?
    deleteRecurringTransaction,
    TResult? Function(DetectRecurringPatterns value)? detectRecurringPatterns,
    TResult? Function(ProcessRecurringTransactions value)?
    processRecurringTransactions,
  }) {
    return deleteRecurringTransaction?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadRecurringTransactions value)?
    loadRecurringTransactions,
    TResult Function(CreateRecurringTransaction value)?
    createRecurringTransaction,
    TResult Function(ToggleRecurringTransaction value)?
    toggleRecurringTransaction,
    TResult Function(DeleteRecurringTransaction value)?
    deleteRecurringTransaction,
    TResult Function(DetectRecurringPatterns value)? detectRecurringPatterns,
    TResult Function(ProcessRecurringTransactions value)?
    processRecurringTransactions,
    required TResult orElse(),
  }) {
    if (deleteRecurringTransaction != null) {
      return deleteRecurringTransaction(this);
    }
    return orElse();
  }
}

abstract class DeleteRecurringTransaction implements RecurringEvent {
  const factory DeleteRecurringTransaction({
    required final String userId,
    required final String transactionId,
  }) = _$DeleteRecurringTransactionImpl;

  @override
  String get userId;
  String get transactionId;
  @override
  @JsonKey(ignore: true)
  _$$DeleteRecurringTransactionImplCopyWith<_$DeleteRecurringTransactionImpl>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DetectRecurringPatternsImplCopyWith<$Res>
    implements $RecurringEventCopyWith<$Res> {
  factory _$$DetectRecurringPatternsImplCopyWith(
    _$DetectRecurringPatternsImpl value,
    $Res Function(_$DetectRecurringPatternsImpl) then,
  ) = __$$DetectRecurringPatternsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String userId});
}

/// @nodoc
class __$$DetectRecurringPatternsImplCopyWithImpl<$Res>
    extends _$RecurringEventCopyWithImpl<$Res, _$DetectRecurringPatternsImpl>
    implements _$$DetectRecurringPatternsImplCopyWith<$Res> {
  __$$DetectRecurringPatternsImplCopyWithImpl(
    _$DetectRecurringPatternsImpl _value,
    $Res Function(_$DetectRecurringPatternsImpl) _then,
  ) : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? userId = null}) {
    return _then(
      _$DetectRecurringPatternsImpl(
        userId: null == userId
            ? _value.userId
            : userId // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$DetectRecurringPatternsImpl implements DetectRecurringPatterns {
  const _$DetectRecurringPatternsImpl({required this.userId});

  @override
  final String userId;

  @override
  String toString() {
    return 'RecurringEvent.detectRecurringPatterns(userId: $userId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DetectRecurringPatternsImpl &&
            (identical(other.userId, userId) || other.userId == userId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, userId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DetectRecurringPatternsImplCopyWith<_$DetectRecurringPatternsImpl>
  get copyWith =>
      __$$DetectRecurringPatternsImplCopyWithImpl<
        _$DetectRecurringPatternsImpl
      >(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String userId) loadRecurringTransactions,
    required TResult Function(
      String userId,
      double amount,
      String category,
      String description,
      RecurringFrequency frequency,
      DateTime nextDueDate,
      String? paymentMethod,
      String? notes,
    )
    createRecurringTransaction,
    required TResult Function(
      String id,
      String userId,
      double amount,
      String category,
      String description,
      RecurringFrequency frequency,
      DateTime nextDueDate,
      bool isActive,
      String? paymentMethod,
      String? notes,
      DateTime createdAt,
    )
    toggleRecurringTransaction,
    required TResult Function(String userId, String transactionId)
    deleteRecurringTransaction,
    required TResult Function(String userId) detectRecurringPatterns,
    required TResult Function(String userId) processRecurringTransactions,
  }) {
    return detectRecurringPatterns(userId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String userId)? loadRecurringTransactions,
    TResult? Function(
      String userId,
      double amount,
      String category,
      String description,
      RecurringFrequency frequency,
      DateTime nextDueDate,
      String? paymentMethod,
      String? notes,
    )?
    createRecurringTransaction,
    TResult? Function(
      String id,
      String userId,
      double amount,
      String category,
      String description,
      RecurringFrequency frequency,
      DateTime nextDueDate,
      bool isActive,
      String? paymentMethod,
      String? notes,
      DateTime createdAt,
    )?
    toggleRecurringTransaction,
    TResult? Function(String userId, String transactionId)?
    deleteRecurringTransaction,
    TResult? Function(String userId)? detectRecurringPatterns,
    TResult? Function(String userId)? processRecurringTransactions,
  }) {
    return detectRecurringPatterns?.call(userId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String userId)? loadRecurringTransactions,
    TResult Function(
      String userId,
      double amount,
      String category,
      String description,
      RecurringFrequency frequency,
      DateTime nextDueDate,
      String? paymentMethod,
      String? notes,
    )?
    createRecurringTransaction,
    TResult Function(
      String id,
      String userId,
      double amount,
      String category,
      String description,
      RecurringFrequency frequency,
      DateTime nextDueDate,
      bool isActive,
      String? paymentMethod,
      String? notes,
      DateTime createdAt,
    )?
    toggleRecurringTransaction,
    TResult Function(String userId, String transactionId)?
    deleteRecurringTransaction,
    TResult Function(String userId)? detectRecurringPatterns,
    TResult Function(String userId)? processRecurringTransactions,
    required TResult orElse(),
  }) {
    if (detectRecurringPatterns != null) {
      return detectRecurringPatterns(userId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadRecurringTransactions value)
    loadRecurringTransactions,
    required TResult Function(CreateRecurringTransaction value)
    createRecurringTransaction,
    required TResult Function(ToggleRecurringTransaction value)
    toggleRecurringTransaction,
    required TResult Function(DeleteRecurringTransaction value)
    deleteRecurringTransaction,
    required TResult Function(DetectRecurringPatterns value)
    detectRecurringPatterns,
    required TResult Function(ProcessRecurringTransactions value)
    processRecurringTransactions,
  }) {
    return detectRecurringPatterns(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadRecurringTransactions value)?
    loadRecurringTransactions,
    TResult? Function(CreateRecurringTransaction value)?
    createRecurringTransaction,
    TResult? Function(ToggleRecurringTransaction value)?
    toggleRecurringTransaction,
    TResult? Function(DeleteRecurringTransaction value)?
    deleteRecurringTransaction,
    TResult? Function(DetectRecurringPatterns value)? detectRecurringPatterns,
    TResult? Function(ProcessRecurringTransactions value)?
    processRecurringTransactions,
  }) {
    return detectRecurringPatterns?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadRecurringTransactions value)?
    loadRecurringTransactions,
    TResult Function(CreateRecurringTransaction value)?
    createRecurringTransaction,
    TResult Function(ToggleRecurringTransaction value)?
    toggleRecurringTransaction,
    TResult Function(DeleteRecurringTransaction value)?
    deleteRecurringTransaction,
    TResult Function(DetectRecurringPatterns value)? detectRecurringPatterns,
    TResult Function(ProcessRecurringTransactions value)?
    processRecurringTransactions,
    required TResult orElse(),
  }) {
    if (detectRecurringPatterns != null) {
      return detectRecurringPatterns(this);
    }
    return orElse();
  }
}

abstract class DetectRecurringPatterns implements RecurringEvent {
  const factory DetectRecurringPatterns({required final String userId}) =
      _$DetectRecurringPatternsImpl;

  @override
  String get userId;
  @override
  @JsonKey(ignore: true)
  _$$DetectRecurringPatternsImplCopyWith<_$DetectRecurringPatternsImpl>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ProcessRecurringTransactionsImplCopyWith<$Res>
    implements $RecurringEventCopyWith<$Res> {
  factory _$$ProcessRecurringTransactionsImplCopyWith(
    _$ProcessRecurringTransactionsImpl value,
    $Res Function(_$ProcessRecurringTransactionsImpl) then,
  ) = __$$ProcessRecurringTransactionsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String userId});
}

/// @nodoc
class __$$ProcessRecurringTransactionsImplCopyWithImpl<$Res>
    extends
        _$RecurringEventCopyWithImpl<$Res, _$ProcessRecurringTransactionsImpl>
    implements _$$ProcessRecurringTransactionsImplCopyWith<$Res> {
  __$$ProcessRecurringTransactionsImplCopyWithImpl(
    _$ProcessRecurringTransactionsImpl _value,
    $Res Function(_$ProcessRecurringTransactionsImpl) _then,
  ) : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? userId = null}) {
    return _then(
      _$ProcessRecurringTransactionsImpl(
        userId: null == userId
            ? _value.userId
            : userId // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$ProcessRecurringTransactionsImpl
    implements ProcessRecurringTransactions {
  const _$ProcessRecurringTransactionsImpl({required this.userId});

  @override
  final String userId;

  @override
  String toString() {
    return 'RecurringEvent.processRecurringTransactions(userId: $userId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProcessRecurringTransactionsImpl &&
            (identical(other.userId, userId) || other.userId == userId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, userId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProcessRecurringTransactionsImplCopyWith<
    _$ProcessRecurringTransactionsImpl
  >
  get copyWith =>
      __$$ProcessRecurringTransactionsImplCopyWithImpl<
        _$ProcessRecurringTransactionsImpl
      >(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String userId) loadRecurringTransactions,
    required TResult Function(
      String userId,
      double amount,
      String category,
      String description,
      RecurringFrequency frequency,
      DateTime nextDueDate,
      String? paymentMethod,
      String? notes,
    )
    createRecurringTransaction,
    required TResult Function(
      String id,
      String userId,
      double amount,
      String category,
      String description,
      RecurringFrequency frequency,
      DateTime nextDueDate,
      bool isActive,
      String? paymentMethod,
      String? notes,
      DateTime createdAt,
    )
    toggleRecurringTransaction,
    required TResult Function(String userId, String transactionId)
    deleteRecurringTransaction,
    required TResult Function(String userId) detectRecurringPatterns,
    required TResult Function(String userId) processRecurringTransactions,
  }) {
    return processRecurringTransactions(userId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String userId)? loadRecurringTransactions,
    TResult? Function(
      String userId,
      double amount,
      String category,
      String description,
      RecurringFrequency frequency,
      DateTime nextDueDate,
      String? paymentMethod,
      String? notes,
    )?
    createRecurringTransaction,
    TResult? Function(
      String id,
      String userId,
      double amount,
      String category,
      String description,
      RecurringFrequency frequency,
      DateTime nextDueDate,
      bool isActive,
      String? paymentMethod,
      String? notes,
      DateTime createdAt,
    )?
    toggleRecurringTransaction,
    TResult? Function(String userId, String transactionId)?
    deleteRecurringTransaction,
    TResult? Function(String userId)? detectRecurringPatterns,
    TResult? Function(String userId)? processRecurringTransactions,
  }) {
    return processRecurringTransactions?.call(userId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String userId)? loadRecurringTransactions,
    TResult Function(
      String userId,
      double amount,
      String category,
      String description,
      RecurringFrequency frequency,
      DateTime nextDueDate,
      String? paymentMethod,
      String? notes,
    )?
    createRecurringTransaction,
    TResult Function(
      String id,
      String userId,
      double amount,
      String category,
      String description,
      RecurringFrequency frequency,
      DateTime nextDueDate,
      bool isActive,
      String? paymentMethod,
      String? notes,
      DateTime createdAt,
    )?
    toggleRecurringTransaction,
    TResult Function(String userId, String transactionId)?
    deleteRecurringTransaction,
    TResult Function(String userId)? detectRecurringPatterns,
    TResult Function(String userId)? processRecurringTransactions,
    required TResult orElse(),
  }) {
    if (processRecurringTransactions != null) {
      return processRecurringTransactions(userId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadRecurringTransactions value)
    loadRecurringTransactions,
    required TResult Function(CreateRecurringTransaction value)
    createRecurringTransaction,
    required TResult Function(ToggleRecurringTransaction value)
    toggleRecurringTransaction,
    required TResult Function(DeleteRecurringTransaction value)
    deleteRecurringTransaction,
    required TResult Function(DetectRecurringPatterns value)
    detectRecurringPatterns,
    required TResult Function(ProcessRecurringTransactions value)
    processRecurringTransactions,
  }) {
    return processRecurringTransactions(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadRecurringTransactions value)?
    loadRecurringTransactions,
    TResult? Function(CreateRecurringTransaction value)?
    createRecurringTransaction,
    TResult? Function(ToggleRecurringTransaction value)?
    toggleRecurringTransaction,
    TResult? Function(DeleteRecurringTransaction value)?
    deleteRecurringTransaction,
    TResult? Function(DetectRecurringPatterns value)? detectRecurringPatterns,
    TResult? Function(ProcessRecurringTransactions value)?
    processRecurringTransactions,
  }) {
    return processRecurringTransactions?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadRecurringTransactions value)?
    loadRecurringTransactions,
    TResult Function(CreateRecurringTransaction value)?
    createRecurringTransaction,
    TResult Function(ToggleRecurringTransaction value)?
    toggleRecurringTransaction,
    TResult Function(DeleteRecurringTransaction value)?
    deleteRecurringTransaction,
    TResult Function(DetectRecurringPatterns value)? detectRecurringPatterns,
    TResult Function(ProcessRecurringTransactions value)?
    processRecurringTransactions,
    required TResult orElse(),
  }) {
    if (processRecurringTransactions != null) {
      return processRecurringTransactions(this);
    }
    return orElse();
  }
}

abstract class ProcessRecurringTransactions implements RecurringEvent {
  const factory ProcessRecurringTransactions({required final String userId}) =
      _$ProcessRecurringTransactionsImpl;

  @override
  String get userId;
  @override
  @JsonKey(ignore: true)
  _$$ProcessRecurringTransactionsImplCopyWith<
    _$ProcessRecurringTransactionsImpl
  >
  get copyWith => throw _privateConstructorUsedError;
}
