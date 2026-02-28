// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transaction_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$TransactionEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String userId) loadTransactions,
    required TResult Function(String userId, DateTime month)
    loadTransactionsForMonth,
    required TResult Function(
      String userId,
      double amount,
      String category,
      String description,
      DateTime date,
      String paymentMethod,
      String? notes,
    )
    createTransaction,
    required TResult Function(
      String id,
      String userId,
      double amount,
      String category,
      String description,
      DateTime date,
      String paymentMethod,
      String? notes,
      DateTime createdAt,
    )
    updateTransaction,
    required TResult Function(String userId, String transactionId)
    deleteTransaction,
    required TResult Function(String query) searchTransactions,
    required TResult Function(String userId, String category) filterByCategory,
    required TResult Function(String userId) syncTransactions,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String userId)? loadTransactions,
    TResult? Function(String userId, DateTime month)? loadTransactionsForMonth,
    TResult? Function(
      String userId,
      double amount,
      String category,
      String description,
      DateTime date,
      String paymentMethod,
      String? notes,
    )?
    createTransaction,
    TResult? Function(
      String id,
      String userId,
      double amount,
      String category,
      String description,
      DateTime date,
      String paymentMethod,
      String? notes,
      DateTime createdAt,
    )?
    updateTransaction,
    TResult? Function(String userId, String transactionId)? deleteTransaction,
    TResult? Function(String query)? searchTransactions,
    TResult? Function(String userId, String category)? filterByCategory,
    TResult? Function(String userId)? syncTransactions,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String userId)? loadTransactions,
    TResult Function(String userId, DateTime month)? loadTransactionsForMonth,
    TResult Function(
      String userId,
      double amount,
      String category,
      String description,
      DateTime date,
      String paymentMethod,
      String? notes,
    )?
    createTransaction,
    TResult Function(
      String id,
      String userId,
      double amount,
      String category,
      String description,
      DateTime date,
      String paymentMethod,
      String? notes,
      DateTime createdAt,
    )?
    updateTransaction,
    TResult Function(String userId, String transactionId)? deleteTransaction,
    TResult Function(String query)? searchTransactions,
    TResult Function(String userId, String category)? filterByCategory,
    TResult Function(String userId)? syncTransactions,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadTransactions value) loadTransactions,
    required TResult Function(LoadTransactionsForMonth value)
    loadTransactionsForMonth,
    required TResult Function(CreateTransaction value) createTransaction,
    required TResult Function(UpdateTransaction value) updateTransaction,
    required TResult Function(DeleteTransaction value) deleteTransaction,
    required TResult Function(SearchTransactions value) searchTransactions,
    required TResult Function(FilterByCategory value) filterByCategory,
    required TResult Function(SyncTransactions value) syncTransactions,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadTransactions value)? loadTransactions,
    TResult? Function(LoadTransactionsForMonth value)? loadTransactionsForMonth,
    TResult? Function(CreateTransaction value)? createTransaction,
    TResult? Function(UpdateTransaction value)? updateTransaction,
    TResult? Function(DeleteTransaction value)? deleteTransaction,
    TResult? Function(SearchTransactions value)? searchTransactions,
    TResult? Function(FilterByCategory value)? filterByCategory,
    TResult? Function(SyncTransactions value)? syncTransactions,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadTransactions value)? loadTransactions,
    TResult Function(LoadTransactionsForMonth value)? loadTransactionsForMonth,
    TResult Function(CreateTransaction value)? createTransaction,
    TResult Function(UpdateTransaction value)? updateTransaction,
    TResult Function(DeleteTransaction value)? deleteTransaction,
    TResult Function(SearchTransactions value)? searchTransactions,
    TResult Function(FilterByCategory value)? filterByCategory,
    TResult Function(SyncTransactions value)? syncTransactions,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransactionEventCopyWith<$Res> {
  factory $TransactionEventCopyWith(
    TransactionEvent value,
    $Res Function(TransactionEvent) then,
  ) = _$TransactionEventCopyWithImpl<$Res, TransactionEvent>;
}

/// @nodoc
class _$TransactionEventCopyWithImpl<$Res, $Val extends TransactionEvent>
    implements $TransactionEventCopyWith<$Res> {
  _$TransactionEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$LoadTransactionsImplCopyWith<$Res> {
  factory _$$LoadTransactionsImplCopyWith(
    _$LoadTransactionsImpl value,
    $Res Function(_$LoadTransactionsImpl) then,
  ) = __$$LoadTransactionsImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String userId});
}

/// @nodoc
class __$$LoadTransactionsImplCopyWithImpl<$Res>
    extends _$TransactionEventCopyWithImpl<$Res, _$LoadTransactionsImpl>
    implements _$$LoadTransactionsImplCopyWith<$Res> {
  __$$LoadTransactionsImplCopyWithImpl(
    _$LoadTransactionsImpl _value,
    $Res Function(_$LoadTransactionsImpl) _then,
  ) : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? userId = null}) {
    return _then(
      _$LoadTransactionsImpl(
        userId: null == userId
            ? _value.userId
            : userId // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$LoadTransactionsImpl implements LoadTransactions {
  const _$LoadTransactionsImpl({required this.userId});

  @override
  final String userId;

  @override
  String toString() {
    return 'TransactionEvent.loadTransactions(userId: $userId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadTransactionsImpl &&
            (identical(other.userId, userId) || other.userId == userId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, userId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadTransactionsImplCopyWith<_$LoadTransactionsImpl> get copyWith =>
      __$$LoadTransactionsImplCopyWithImpl<_$LoadTransactionsImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String userId) loadTransactions,
    required TResult Function(String userId, DateTime month)
    loadTransactionsForMonth,
    required TResult Function(
      String userId,
      double amount,
      String category,
      String description,
      DateTime date,
      String paymentMethod,
      String? notes,
    )
    createTransaction,
    required TResult Function(
      String id,
      String userId,
      double amount,
      String category,
      String description,
      DateTime date,
      String paymentMethod,
      String? notes,
      DateTime createdAt,
    )
    updateTransaction,
    required TResult Function(String userId, String transactionId)
    deleteTransaction,
    required TResult Function(String query) searchTransactions,
    required TResult Function(String userId, String category) filterByCategory,
    required TResult Function(String userId) syncTransactions,
  }) {
    return loadTransactions(userId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String userId)? loadTransactions,
    TResult? Function(String userId, DateTime month)? loadTransactionsForMonth,
    TResult? Function(
      String userId,
      double amount,
      String category,
      String description,
      DateTime date,
      String paymentMethod,
      String? notes,
    )?
    createTransaction,
    TResult? Function(
      String id,
      String userId,
      double amount,
      String category,
      String description,
      DateTime date,
      String paymentMethod,
      String? notes,
      DateTime createdAt,
    )?
    updateTransaction,
    TResult? Function(String userId, String transactionId)? deleteTransaction,
    TResult? Function(String query)? searchTransactions,
    TResult? Function(String userId, String category)? filterByCategory,
    TResult? Function(String userId)? syncTransactions,
  }) {
    return loadTransactions?.call(userId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String userId)? loadTransactions,
    TResult Function(String userId, DateTime month)? loadTransactionsForMonth,
    TResult Function(
      String userId,
      double amount,
      String category,
      String description,
      DateTime date,
      String paymentMethod,
      String? notes,
    )?
    createTransaction,
    TResult Function(
      String id,
      String userId,
      double amount,
      String category,
      String description,
      DateTime date,
      String paymentMethod,
      String? notes,
      DateTime createdAt,
    )?
    updateTransaction,
    TResult Function(String userId, String transactionId)? deleteTransaction,
    TResult Function(String query)? searchTransactions,
    TResult Function(String userId, String category)? filterByCategory,
    TResult Function(String userId)? syncTransactions,
    required TResult orElse(),
  }) {
    if (loadTransactions != null) {
      return loadTransactions(userId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadTransactions value) loadTransactions,
    required TResult Function(LoadTransactionsForMonth value)
    loadTransactionsForMonth,
    required TResult Function(CreateTransaction value) createTransaction,
    required TResult Function(UpdateTransaction value) updateTransaction,
    required TResult Function(DeleteTransaction value) deleteTransaction,
    required TResult Function(SearchTransactions value) searchTransactions,
    required TResult Function(FilterByCategory value) filterByCategory,
    required TResult Function(SyncTransactions value) syncTransactions,
  }) {
    return loadTransactions(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadTransactions value)? loadTransactions,
    TResult? Function(LoadTransactionsForMonth value)? loadTransactionsForMonth,
    TResult? Function(CreateTransaction value)? createTransaction,
    TResult? Function(UpdateTransaction value)? updateTransaction,
    TResult? Function(DeleteTransaction value)? deleteTransaction,
    TResult? Function(SearchTransactions value)? searchTransactions,
    TResult? Function(FilterByCategory value)? filterByCategory,
    TResult? Function(SyncTransactions value)? syncTransactions,
  }) {
    return loadTransactions?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadTransactions value)? loadTransactions,
    TResult Function(LoadTransactionsForMonth value)? loadTransactionsForMonth,
    TResult Function(CreateTransaction value)? createTransaction,
    TResult Function(UpdateTransaction value)? updateTransaction,
    TResult Function(DeleteTransaction value)? deleteTransaction,
    TResult Function(SearchTransactions value)? searchTransactions,
    TResult Function(FilterByCategory value)? filterByCategory,
    TResult Function(SyncTransactions value)? syncTransactions,
    required TResult orElse(),
  }) {
    if (loadTransactions != null) {
      return loadTransactions(this);
    }
    return orElse();
  }
}

abstract class LoadTransactions implements TransactionEvent {
  const factory LoadTransactions({required final String userId}) =
      _$LoadTransactionsImpl;

  String get userId;
  @JsonKey(ignore: true)
  _$$LoadTransactionsImplCopyWith<_$LoadTransactionsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadTransactionsForMonthImplCopyWith<$Res> {
  factory _$$LoadTransactionsForMonthImplCopyWith(
    _$LoadTransactionsForMonthImpl value,
    $Res Function(_$LoadTransactionsForMonthImpl) then,
  ) = __$$LoadTransactionsForMonthImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String userId, DateTime month});
}

/// @nodoc
class __$$LoadTransactionsForMonthImplCopyWithImpl<$Res>
    extends _$TransactionEventCopyWithImpl<$Res, _$LoadTransactionsForMonthImpl>
    implements _$$LoadTransactionsForMonthImplCopyWith<$Res> {
  __$$LoadTransactionsForMonthImplCopyWithImpl(
    _$LoadTransactionsForMonthImpl _value,
    $Res Function(_$LoadTransactionsForMonthImpl) _then,
  ) : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? userId = null, Object? month = null}) {
    return _then(
      _$LoadTransactionsForMonthImpl(
        userId: null == userId
            ? _value.userId
            : userId // ignore: cast_nullable_to_non_nullable
                  as String,
        month: null == month
            ? _value.month
            : month // ignore: cast_nullable_to_non_nullable
                  as DateTime,
      ),
    );
  }
}

/// @nodoc

class _$LoadTransactionsForMonthImpl implements LoadTransactionsForMonth {
  const _$LoadTransactionsForMonthImpl({
    required this.userId,
    required this.month,
  });

  @override
  final String userId;
  @override
  final DateTime month;

  @override
  String toString() {
    return 'TransactionEvent.loadTransactionsForMonth(userId: $userId, month: $month)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadTransactionsForMonthImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.month, month) || other.month == month));
  }

  @override
  int get hashCode => Object.hash(runtimeType, userId, month);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadTransactionsForMonthImplCopyWith<_$LoadTransactionsForMonthImpl>
  get copyWith =>
      __$$LoadTransactionsForMonthImplCopyWithImpl<
        _$LoadTransactionsForMonthImpl
      >(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String userId) loadTransactions,
    required TResult Function(String userId, DateTime month)
    loadTransactionsForMonth,
    required TResult Function(
      String userId,
      double amount,
      String category,
      String description,
      DateTime date,
      String paymentMethod,
      String? notes,
    )
    createTransaction,
    required TResult Function(
      String id,
      String userId,
      double amount,
      String category,
      String description,
      DateTime date,
      String paymentMethod,
      String? notes,
      DateTime createdAt,
    )
    updateTransaction,
    required TResult Function(String userId, String transactionId)
    deleteTransaction,
    required TResult Function(String query) searchTransactions,
    required TResult Function(String userId, String category) filterByCategory,
    required TResult Function(String userId) syncTransactions,
  }) {
    return loadTransactionsForMonth(userId, month);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String userId)? loadTransactions,
    TResult? Function(String userId, DateTime month)? loadTransactionsForMonth,
    TResult? Function(
      String userId,
      double amount,
      String category,
      String description,
      DateTime date,
      String paymentMethod,
      String? notes,
    )?
    createTransaction,
    TResult? Function(
      String id,
      String userId,
      double amount,
      String category,
      String description,
      DateTime date,
      String paymentMethod,
      String? notes,
      DateTime createdAt,
    )?
    updateTransaction,
    TResult? Function(String userId, String transactionId)? deleteTransaction,
    TResult? Function(String query)? searchTransactions,
    TResult? Function(String userId, String category)? filterByCategory,
    TResult? Function(String userId)? syncTransactions,
  }) {
    return loadTransactionsForMonth?.call(userId, month);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String userId)? loadTransactions,
    TResult Function(String userId, DateTime month)? loadTransactionsForMonth,
    TResult Function(
      String userId,
      double amount,
      String category,
      String description,
      DateTime date,
      String paymentMethod,
      String? notes,
    )?
    createTransaction,
    TResult Function(
      String id,
      String userId,
      double amount,
      String category,
      String description,
      DateTime date,
      String paymentMethod,
      String? notes,
      DateTime createdAt,
    )?
    updateTransaction,
    TResult Function(String userId, String transactionId)? deleteTransaction,
    TResult Function(String query)? searchTransactions,
    TResult Function(String userId, String category)? filterByCategory,
    TResult Function(String userId)? syncTransactions,
    required TResult orElse(),
  }) {
    if (loadTransactionsForMonth != null) {
      return loadTransactionsForMonth(userId, month);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadTransactions value) loadTransactions,
    required TResult Function(LoadTransactionsForMonth value)
    loadTransactionsForMonth,
    required TResult Function(CreateTransaction value) createTransaction,
    required TResult Function(UpdateTransaction value) updateTransaction,
    required TResult Function(DeleteTransaction value) deleteTransaction,
    required TResult Function(SearchTransactions value) searchTransactions,
    required TResult Function(FilterByCategory value) filterByCategory,
    required TResult Function(SyncTransactions value) syncTransactions,
  }) {
    return loadTransactionsForMonth(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadTransactions value)? loadTransactions,
    TResult? Function(LoadTransactionsForMonth value)? loadTransactionsForMonth,
    TResult? Function(CreateTransaction value)? createTransaction,
    TResult? Function(UpdateTransaction value)? updateTransaction,
    TResult? Function(DeleteTransaction value)? deleteTransaction,
    TResult? Function(SearchTransactions value)? searchTransactions,
    TResult? Function(FilterByCategory value)? filterByCategory,
    TResult? Function(SyncTransactions value)? syncTransactions,
  }) {
    return loadTransactionsForMonth?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadTransactions value)? loadTransactions,
    TResult Function(LoadTransactionsForMonth value)? loadTransactionsForMonth,
    TResult Function(CreateTransaction value)? createTransaction,
    TResult Function(UpdateTransaction value)? updateTransaction,
    TResult Function(DeleteTransaction value)? deleteTransaction,
    TResult Function(SearchTransactions value)? searchTransactions,
    TResult Function(FilterByCategory value)? filterByCategory,
    TResult Function(SyncTransactions value)? syncTransactions,
    required TResult orElse(),
  }) {
    if (loadTransactionsForMonth != null) {
      return loadTransactionsForMonth(this);
    }
    return orElse();
  }
}

abstract class LoadTransactionsForMonth implements TransactionEvent {
  const factory LoadTransactionsForMonth({
    required final String userId,
    required final DateTime month,
  }) = _$LoadTransactionsForMonthImpl;

  String get userId;
  DateTime get month;
  @JsonKey(ignore: true)
  _$$LoadTransactionsForMonthImplCopyWith<_$LoadTransactionsForMonthImpl>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CreateTransactionImplCopyWith<$Res> {
  factory _$$CreateTransactionImplCopyWith(
    _$CreateTransactionImpl value,
    $Res Function(_$CreateTransactionImpl) then,
  ) = __$$CreateTransactionImplCopyWithImpl<$Res>;
  @useResult
  $Res call({
    String userId,
    double amount,
    String category,
    String description,
    DateTime date,
    String paymentMethod,
    String? notes,
  });
}

/// @nodoc
class __$$CreateTransactionImplCopyWithImpl<$Res>
    extends _$TransactionEventCopyWithImpl<$Res, _$CreateTransactionImpl>
    implements _$$CreateTransactionImplCopyWith<$Res> {
  __$$CreateTransactionImplCopyWithImpl(
    _$CreateTransactionImpl _value,
    $Res Function(_$CreateTransactionImpl) _then,
  ) : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? amount = null,
    Object? category = null,
    Object? description = null,
    Object? date = null,
    Object? paymentMethod = null,
    Object? notes = freezed,
  }) {
    return _then(
      _$CreateTransactionImpl(
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
        date: null == date
            ? _value.date
            : date // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        paymentMethod: null == paymentMethod
            ? _value.paymentMethod
            : paymentMethod // ignore: cast_nullable_to_non_nullable
                  as String,
        notes: freezed == notes
            ? _value.notes
            : notes // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc

class _$CreateTransactionImpl implements CreateTransaction {
  const _$CreateTransactionImpl({
    required this.userId,
    required this.amount,
    required this.category,
    required this.description,
    required this.date,
    required this.paymentMethod,
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
  final DateTime date;
  @override
  final String paymentMethod;
  @override
  final String? notes;

  @override
  String toString() {
    return 'TransactionEvent.createTransaction(userId: $userId, amount: $amount, category: $category, description: $description, date: $date, paymentMethod: $paymentMethod, notes: $notes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateTransactionImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.date, date) || other.date == date) &&
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
    date,
    paymentMethod,
    notes,
  );

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateTransactionImplCopyWith<_$CreateTransactionImpl> get copyWith =>
      __$$CreateTransactionImplCopyWithImpl<_$CreateTransactionImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String userId) loadTransactions,
    required TResult Function(String userId, DateTime month)
    loadTransactionsForMonth,
    required TResult Function(
      String userId,
      double amount,
      String category,
      String description,
      DateTime date,
      String paymentMethod,
      String? notes,
    )
    createTransaction,
    required TResult Function(
      String id,
      String userId,
      double amount,
      String category,
      String description,
      DateTime date,
      String paymentMethod,
      String? notes,
      DateTime createdAt,
    )
    updateTransaction,
    required TResult Function(String userId, String transactionId)
    deleteTransaction,
    required TResult Function(String query) searchTransactions,
    required TResult Function(String userId, String category) filterByCategory,
    required TResult Function(String userId) syncTransactions,
  }) {
    return createTransaction(
      userId,
      amount,
      category,
      description,
      date,
      paymentMethod,
      notes,
    );
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String userId)? loadTransactions,
    TResult? Function(String userId, DateTime month)? loadTransactionsForMonth,
    TResult? Function(
      String userId,
      double amount,
      String category,
      String description,
      DateTime date,
      String paymentMethod,
      String? notes,
    )?
    createTransaction,
    TResult? Function(
      String id,
      String userId,
      double amount,
      String category,
      String description,
      DateTime date,
      String paymentMethod,
      String? notes,
      DateTime createdAt,
    )?
    updateTransaction,
    TResult? Function(String userId, String transactionId)? deleteTransaction,
    TResult? Function(String query)? searchTransactions,
    TResult? Function(String userId, String category)? filterByCategory,
    TResult? Function(String userId)? syncTransactions,
  }) {
    return createTransaction?.call(
      userId,
      amount,
      category,
      description,
      date,
      paymentMethod,
      notes,
    );
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String userId)? loadTransactions,
    TResult Function(String userId, DateTime month)? loadTransactionsForMonth,
    TResult Function(
      String userId,
      double amount,
      String category,
      String description,
      DateTime date,
      String paymentMethod,
      String? notes,
    )?
    createTransaction,
    TResult Function(
      String id,
      String userId,
      double amount,
      String category,
      String description,
      DateTime date,
      String paymentMethod,
      String? notes,
      DateTime createdAt,
    )?
    updateTransaction,
    TResult Function(String userId, String transactionId)? deleteTransaction,
    TResult Function(String query)? searchTransactions,
    TResult Function(String userId, String category)? filterByCategory,
    TResult Function(String userId)? syncTransactions,
    required TResult orElse(),
  }) {
    if (createTransaction != null) {
      return createTransaction(
        userId,
        amount,
        category,
        description,
        date,
        paymentMethod,
        notes,
      );
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadTransactions value) loadTransactions,
    required TResult Function(LoadTransactionsForMonth value)
    loadTransactionsForMonth,
    required TResult Function(CreateTransaction value) createTransaction,
    required TResult Function(UpdateTransaction value) updateTransaction,
    required TResult Function(DeleteTransaction value) deleteTransaction,
    required TResult Function(SearchTransactions value) searchTransactions,
    required TResult Function(FilterByCategory value) filterByCategory,
    required TResult Function(SyncTransactions value) syncTransactions,
  }) {
    return createTransaction(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadTransactions value)? loadTransactions,
    TResult? Function(LoadTransactionsForMonth value)? loadTransactionsForMonth,
    TResult? Function(CreateTransaction value)? createTransaction,
    TResult? Function(UpdateTransaction value)? updateTransaction,
    TResult? Function(DeleteTransaction value)? deleteTransaction,
    TResult? Function(SearchTransactions value)? searchTransactions,
    TResult? Function(FilterByCategory value)? filterByCategory,
    TResult? Function(SyncTransactions value)? syncTransactions,
  }) {
    return createTransaction?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadTransactions value)? loadTransactions,
    TResult Function(LoadTransactionsForMonth value)? loadTransactionsForMonth,
    TResult Function(CreateTransaction value)? createTransaction,
    TResult Function(UpdateTransaction value)? updateTransaction,
    TResult Function(DeleteTransaction value)? deleteTransaction,
    TResult Function(SearchTransactions value)? searchTransactions,
    TResult Function(FilterByCategory value)? filterByCategory,
    TResult Function(SyncTransactions value)? syncTransactions,
    required TResult orElse(),
  }) {
    if (createTransaction != null) {
      return createTransaction(this);
    }
    return orElse();
  }
}

abstract class CreateTransaction implements TransactionEvent {
  const factory CreateTransaction({
    required final String userId,
    required final double amount,
    required final String category,
    required final String description,
    required final DateTime date,
    required final String paymentMethod,
    final String? notes,
  }) = _$CreateTransactionImpl;

  String get userId;
  double get amount;
  String get category;
  String get description;
  DateTime get date;
  String get paymentMethod;
  String? get notes;
  @JsonKey(ignore: true)
  _$$CreateTransactionImplCopyWith<_$CreateTransactionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UpdateTransactionImplCopyWith<$Res> {
  factory _$$UpdateTransactionImplCopyWith(
    _$UpdateTransactionImpl value,
    $Res Function(_$UpdateTransactionImpl) then,
  ) = __$$UpdateTransactionImplCopyWithImpl<$Res>;
  @useResult
  $Res call({
    String id,
    String userId,
    double amount,
    String category,
    String description,
    DateTime date,
    String paymentMethod,
    String? notes,
    DateTime createdAt,
  });
}

/// @nodoc
class __$$UpdateTransactionImplCopyWithImpl<$Res>
    extends _$TransactionEventCopyWithImpl<$Res, _$UpdateTransactionImpl>
    implements _$$UpdateTransactionImplCopyWith<$Res> {
  __$$UpdateTransactionImplCopyWithImpl(
    _$UpdateTransactionImpl _value,
    $Res Function(_$UpdateTransactionImpl) _then,
  ) : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? amount = null,
    Object? category = null,
    Object? description = null,
    Object? date = null,
    Object? paymentMethod = null,
    Object? notes = freezed,
    Object? createdAt = null,
  }) {
    return _then(
      _$UpdateTransactionImpl(
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
        date: null == date
            ? _value.date
            : date // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        paymentMethod: null == paymentMethod
            ? _value.paymentMethod
            : paymentMethod // ignore: cast_nullable_to_non_nullable
                  as String,
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

class _$UpdateTransactionImpl implements UpdateTransaction {
  const _$UpdateTransactionImpl({
    required this.id,
    required this.userId,
    required this.amount,
    required this.category,
    required this.description,
    required this.date,
    required this.paymentMethod,
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
  final DateTime date;
  @override
  final String paymentMethod;
  @override
  final String? notes;
  @override
  final DateTime createdAt;

  @override
  String toString() {
    return 'TransactionEvent.updateTransaction(id: $id, userId: $userId, amount: $amount, category: $category, description: $description, date: $date, paymentMethod: $paymentMethod, notes: $notes, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateTransactionImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.date, date) || other.date == date) &&
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
    date,
    paymentMethod,
    notes,
    createdAt,
  );

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateTransactionImplCopyWith<_$UpdateTransactionImpl> get copyWith =>
      __$$UpdateTransactionImplCopyWithImpl<_$UpdateTransactionImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String userId) loadTransactions,
    required TResult Function(String userId, DateTime month)
    loadTransactionsForMonth,
    required TResult Function(
      String userId,
      double amount,
      String category,
      String description,
      DateTime date,
      String paymentMethod,
      String? notes,
    )
    createTransaction,
    required TResult Function(
      String id,
      String userId,
      double amount,
      String category,
      String description,
      DateTime date,
      String paymentMethod,
      String? notes,
      DateTime createdAt,
    )
    updateTransaction,
    required TResult Function(String userId, String transactionId)
    deleteTransaction,
    required TResult Function(String query) searchTransactions,
    required TResult Function(String userId, String category) filterByCategory,
    required TResult Function(String userId) syncTransactions,
  }) {
    return updateTransaction(
      id,
      userId,
      amount,
      category,
      description,
      date,
      paymentMethod,
      notes,
      createdAt,
    );
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String userId)? loadTransactions,
    TResult? Function(String userId, DateTime month)? loadTransactionsForMonth,
    TResult? Function(
      String userId,
      double amount,
      String category,
      String description,
      DateTime date,
      String paymentMethod,
      String? notes,
    )?
    createTransaction,
    TResult? Function(
      String id,
      String userId,
      double amount,
      String category,
      String description,
      DateTime date,
      String paymentMethod,
      String? notes,
      DateTime createdAt,
    )?
    updateTransaction,
    TResult? Function(String userId, String transactionId)? deleteTransaction,
    TResult? Function(String query)? searchTransactions,
    TResult? Function(String userId, String category)? filterByCategory,
    TResult? Function(String userId)? syncTransactions,
  }) {
    return updateTransaction?.call(
      id,
      userId,
      amount,
      category,
      description,
      date,
      paymentMethod,
      notes,
      createdAt,
    );
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String userId)? loadTransactions,
    TResult Function(String userId, DateTime month)? loadTransactionsForMonth,
    TResult Function(
      String userId,
      double amount,
      String category,
      String description,
      DateTime date,
      String paymentMethod,
      String? notes,
    )?
    createTransaction,
    TResult Function(
      String id,
      String userId,
      double amount,
      String category,
      String description,
      DateTime date,
      String paymentMethod,
      String? notes,
      DateTime createdAt,
    )?
    updateTransaction,
    TResult Function(String userId, String transactionId)? deleteTransaction,
    TResult Function(String query)? searchTransactions,
    TResult Function(String userId, String category)? filterByCategory,
    TResult Function(String userId)? syncTransactions,
    required TResult orElse(),
  }) {
    if (updateTransaction != null) {
      return updateTransaction(
        id,
        userId,
        amount,
        category,
        description,
        date,
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
    required TResult Function(LoadTransactions value) loadTransactions,
    required TResult Function(LoadTransactionsForMonth value)
    loadTransactionsForMonth,
    required TResult Function(CreateTransaction value) createTransaction,
    required TResult Function(UpdateTransaction value) updateTransaction,
    required TResult Function(DeleteTransaction value) deleteTransaction,
    required TResult Function(SearchTransactions value) searchTransactions,
    required TResult Function(FilterByCategory value) filterByCategory,
    required TResult Function(SyncTransactions value) syncTransactions,
  }) {
    return updateTransaction(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadTransactions value)? loadTransactions,
    TResult? Function(LoadTransactionsForMonth value)? loadTransactionsForMonth,
    TResult? Function(CreateTransaction value)? createTransaction,
    TResult? Function(UpdateTransaction value)? updateTransaction,
    TResult? Function(DeleteTransaction value)? deleteTransaction,
    TResult? Function(SearchTransactions value)? searchTransactions,
    TResult? Function(FilterByCategory value)? filterByCategory,
    TResult? Function(SyncTransactions value)? syncTransactions,
  }) {
    return updateTransaction?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadTransactions value)? loadTransactions,
    TResult Function(LoadTransactionsForMonth value)? loadTransactionsForMonth,
    TResult Function(CreateTransaction value)? createTransaction,
    TResult Function(UpdateTransaction value)? updateTransaction,
    TResult Function(DeleteTransaction value)? deleteTransaction,
    TResult Function(SearchTransactions value)? searchTransactions,
    TResult Function(FilterByCategory value)? filterByCategory,
    TResult Function(SyncTransactions value)? syncTransactions,
    required TResult orElse(),
  }) {
    if (updateTransaction != null) {
      return updateTransaction(this);
    }
    return orElse();
  }
}

abstract class UpdateTransaction implements TransactionEvent {
  const factory UpdateTransaction({
    required final String id,
    required final String userId,
    required final double amount,
    required final String category,
    required final String description,
    required final DateTime date,
    required final String paymentMethod,
    final String? notes,
    required final DateTime createdAt,
  }) = _$UpdateTransactionImpl;

  String get id;
  String get userId;
  double get amount;
  String get category;
  String get description;
  DateTime get date;
  String get paymentMethod;
  String? get notes;
  DateTime get createdAt;
  @JsonKey(ignore: true)
  _$$UpdateTransactionImplCopyWith<_$UpdateTransactionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DeleteTransactionImplCopyWith<$Res> {
  factory _$$DeleteTransactionImplCopyWith(
    _$DeleteTransactionImpl value,
    $Res Function(_$DeleteTransactionImpl) then,
  ) = __$$DeleteTransactionImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String userId, String transactionId});
}

/// @nodoc
class __$$DeleteTransactionImplCopyWithImpl<$Res>
    extends _$TransactionEventCopyWithImpl<$Res, _$DeleteTransactionImpl>
    implements _$$DeleteTransactionImplCopyWith<$Res> {
  __$$DeleteTransactionImplCopyWithImpl(
    _$DeleteTransactionImpl _value,
    $Res Function(_$DeleteTransactionImpl) _then,
  ) : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? userId = null, Object? transactionId = null}) {
    return _then(
      _$DeleteTransactionImpl(
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

class _$DeleteTransactionImpl implements DeleteTransaction {
  const _$DeleteTransactionImpl({
    required this.userId,
    required this.transactionId,
  });

  @override
  final String userId;
  @override
  final String transactionId;

  @override
  String toString() {
    return 'TransactionEvent.deleteTransaction(userId: $userId, transactionId: $transactionId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeleteTransactionImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.transactionId, transactionId) ||
                other.transactionId == transactionId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, userId, transactionId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DeleteTransactionImplCopyWith<_$DeleteTransactionImpl> get copyWith =>
      __$$DeleteTransactionImplCopyWithImpl<_$DeleteTransactionImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String userId) loadTransactions,
    required TResult Function(String userId, DateTime month)
    loadTransactionsForMonth,
    required TResult Function(
      String userId,
      double amount,
      String category,
      String description,
      DateTime date,
      String paymentMethod,
      String? notes,
    )
    createTransaction,
    required TResult Function(
      String id,
      String userId,
      double amount,
      String category,
      String description,
      DateTime date,
      String paymentMethod,
      String? notes,
      DateTime createdAt,
    )
    updateTransaction,
    required TResult Function(String userId, String transactionId)
    deleteTransaction,
    required TResult Function(String query) searchTransactions,
    required TResult Function(String userId, String category) filterByCategory,
    required TResult Function(String userId) syncTransactions,
  }) {
    return deleteTransaction(userId, transactionId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String userId)? loadTransactions,
    TResult? Function(String userId, DateTime month)? loadTransactionsForMonth,
    TResult? Function(
      String userId,
      double amount,
      String category,
      String description,
      DateTime date,
      String paymentMethod,
      String? notes,
    )?
    createTransaction,
    TResult? Function(
      String id,
      String userId,
      double amount,
      String category,
      String description,
      DateTime date,
      String paymentMethod,
      String? notes,
      DateTime createdAt,
    )?
    updateTransaction,
    TResult? Function(String userId, String transactionId)? deleteTransaction,
    TResult? Function(String query)? searchTransactions,
    TResult? Function(String userId, String category)? filterByCategory,
    TResult? Function(String userId)? syncTransactions,
  }) {
    return deleteTransaction?.call(userId, transactionId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String userId)? loadTransactions,
    TResult Function(String userId, DateTime month)? loadTransactionsForMonth,
    TResult Function(
      String userId,
      double amount,
      String category,
      String description,
      DateTime date,
      String paymentMethod,
      String? notes,
    )?
    createTransaction,
    TResult Function(
      String id,
      String userId,
      double amount,
      String category,
      String description,
      DateTime date,
      String paymentMethod,
      String? notes,
      DateTime createdAt,
    )?
    updateTransaction,
    TResult Function(String userId, String transactionId)? deleteTransaction,
    TResult Function(String query)? searchTransactions,
    TResult Function(String userId, String category)? filterByCategory,
    TResult Function(String userId)? syncTransactions,
    required TResult orElse(),
  }) {
    if (deleteTransaction != null) {
      return deleteTransaction(userId, transactionId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadTransactions value) loadTransactions,
    required TResult Function(LoadTransactionsForMonth value)
    loadTransactionsForMonth,
    required TResult Function(CreateTransaction value) createTransaction,
    required TResult Function(UpdateTransaction value) updateTransaction,
    required TResult Function(DeleteTransaction value) deleteTransaction,
    required TResult Function(SearchTransactions value) searchTransactions,
    required TResult Function(FilterByCategory value) filterByCategory,
    required TResult Function(SyncTransactions value) syncTransactions,
  }) {
    return deleteTransaction(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadTransactions value)? loadTransactions,
    TResult? Function(LoadTransactionsForMonth value)? loadTransactionsForMonth,
    TResult? Function(CreateTransaction value)? createTransaction,
    TResult? Function(UpdateTransaction value)? updateTransaction,
    TResult? Function(DeleteTransaction value)? deleteTransaction,
    TResult? Function(SearchTransactions value)? searchTransactions,
    TResult? Function(FilterByCategory value)? filterByCategory,
    TResult? Function(SyncTransactions value)? syncTransactions,
  }) {
    return deleteTransaction?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadTransactions value)? loadTransactions,
    TResult Function(LoadTransactionsForMonth value)? loadTransactionsForMonth,
    TResult Function(CreateTransaction value)? createTransaction,
    TResult Function(UpdateTransaction value)? updateTransaction,
    TResult Function(DeleteTransaction value)? deleteTransaction,
    TResult Function(SearchTransactions value)? searchTransactions,
    TResult Function(FilterByCategory value)? filterByCategory,
    TResult Function(SyncTransactions value)? syncTransactions,
    required TResult orElse(),
  }) {
    if (deleteTransaction != null) {
      return deleteTransaction(this);
    }
    return orElse();
  }
}

abstract class DeleteTransaction implements TransactionEvent {
  const factory DeleteTransaction({
    required final String userId,
    required final String transactionId,
  }) = _$DeleteTransactionImpl;

  String get userId;
  String get transactionId;
  @JsonKey(ignore: true)
  _$$DeleteTransactionImplCopyWith<_$DeleteTransactionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SearchTransactionsImplCopyWith<$Res> {
  factory _$$SearchTransactionsImplCopyWith(
    _$SearchTransactionsImpl value,
    $Res Function(_$SearchTransactionsImpl) then,
  ) = __$$SearchTransactionsImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String query});
}

/// @nodoc
class __$$SearchTransactionsImplCopyWithImpl<$Res>
    extends _$TransactionEventCopyWithImpl<$Res, _$SearchTransactionsImpl>
    implements _$$SearchTransactionsImplCopyWith<$Res> {
  __$$SearchTransactionsImplCopyWithImpl(
    _$SearchTransactionsImpl _value,
    $Res Function(_$SearchTransactionsImpl) _then,
  ) : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? query = null}) {
    return _then(
      _$SearchTransactionsImpl(
        query: null == query
            ? _value.query
            : query // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$SearchTransactionsImpl implements SearchTransactions {
  const _$SearchTransactionsImpl({required this.query});

  @override
  final String query;

  @override
  String toString() {
    return 'TransactionEvent.searchTransactions(query: $query)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchTransactionsImpl &&
            (identical(other.query, query) || other.query == query));
  }

  @override
  int get hashCode => Object.hash(runtimeType, query);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchTransactionsImplCopyWith<_$SearchTransactionsImpl> get copyWith =>
      __$$SearchTransactionsImplCopyWithImpl<_$SearchTransactionsImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String userId) loadTransactions,
    required TResult Function(String userId, DateTime month)
    loadTransactionsForMonth,
    required TResult Function(
      String userId,
      double amount,
      String category,
      String description,
      DateTime date,
      String paymentMethod,
      String? notes,
    )
    createTransaction,
    required TResult Function(
      String id,
      String userId,
      double amount,
      String category,
      String description,
      DateTime date,
      String paymentMethod,
      String? notes,
      DateTime createdAt,
    )
    updateTransaction,
    required TResult Function(String userId, String transactionId)
    deleteTransaction,
    required TResult Function(String query) searchTransactions,
    required TResult Function(String userId, String category) filterByCategory,
    required TResult Function(String userId) syncTransactions,
  }) {
    return searchTransactions(query);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String userId)? loadTransactions,
    TResult? Function(String userId, DateTime month)? loadTransactionsForMonth,
    TResult? Function(
      String userId,
      double amount,
      String category,
      String description,
      DateTime date,
      String paymentMethod,
      String? notes,
    )?
    createTransaction,
    TResult? Function(
      String id,
      String userId,
      double amount,
      String category,
      String description,
      DateTime date,
      String paymentMethod,
      String? notes,
      DateTime createdAt,
    )?
    updateTransaction,
    TResult? Function(String userId, String transactionId)? deleteTransaction,
    TResult? Function(String query)? searchTransactions,
    TResult? Function(String userId, String category)? filterByCategory,
    TResult? Function(String userId)? syncTransactions,
  }) {
    return searchTransactions?.call(query);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String userId)? loadTransactions,
    TResult Function(String userId, DateTime month)? loadTransactionsForMonth,
    TResult Function(
      String userId,
      double amount,
      String category,
      String description,
      DateTime date,
      String paymentMethod,
      String? notes,
    )?
    createTransaction,
    TResult Function(
      String id,
      String userId,
      double amount,
      String category,
      String description,
      DateTime date,
      String paymentMethod,
      String? notes,
      DateTime createdAt,
    )?
    updateTransaction,
    TResult Function(String userId, String transactionId)? deleteTransaction,
    TResult Function(String query)? searchTransactions,
    TResult Function(String userId, String category)? filterByCategory,
    TResult Function(String userId)? syncTransactions,
    required TResult orElse(),
  }) {
    if (searchTransactions != null) {
      return searchTransactions(query);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadTransactions value) loadTransactions,
    required TResult Function(LoadTransactionsForMonth value)
    loadTransactionsForMonth,
    required TResult Function(CreateTransaction value) createTransaction,
    required TResult Function(UpdateTransaction value) updateTransaction,
    required TResult Function(DeleteTransaction value) deleteTransaction,
    required TResult Function(SearchTransactions value) searchTransactions,
    required TResult Function(FilterByCategory value) filterByCategory,
    required TResult Function(SyncTransactions value) syncTransactions,
  }) {
    return searchTransactions(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadTransactions value)? loadTransactions,
    TResult? Function(LoadTransactionsForMonth value)? loadTransactionsForMonth,
    TResult? Function(CreateTransaction value)? createTransaction,
    TResult? Function(UpdateTransaction value)? updateTransaction,
    TResult? Function(DeleteTransaction value)? deleteTransaction,
    TResult? Function(SearchTransactions value)? searchTransactions,
    TResult? Function(FilterByCategory value)? filterByCategory,
    TResult? Function(SyncTransactions value)? syncTransactions,
  }) {
    return searchTransactions?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadTransactions value)? loadTransactions,
    TResult Function(LoadTransactionsForMonth value)? loadTransactionsForMonth,
    TResult Function(CreateTransaction value)? createTransaction,
    TResult Function(UpdateTransaction value)? updateTransaction,
    TResult Function(DeleteTransaction value)? deleteTransaction,
    TResult Function(SearchTransactions value)? searchTransactions,
    TResult Function(FilterByCategory value)? filterByCategory,
    TResult Function(SyncTransactions value)? syncTransactions,
    required TResult orElse(),
  }) {
    if (searchTransactions != null) {
      return searchTransactions(this);
    }
    return orElse();
  }
}

abstract class SearchTransactions implements TransactionEvent {
  const factory SearchTransactions({required final String query}) =
      _$SearchTransactionsImpl;

  String get query;
  @JsonKey(ignore: true)
  _$$SearchTransactionsImplCopyWith<_$SearchTransactionsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FilterByCategoryImplCopyWith<$Res> {
  factory _$$FilterByCategoryImplCopyWith(
    _$FilterByCategoryImpl value,
    $Res Function(_$FilterByCategoryImpl) then,
  ) = __$$FilterByCategoryImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String userId, String category});
}

/// @nodoc
class __$$FilterByCategoryImplCopyWithImpl<$Res>
    extends _$TransactionEventCopyWithImpl<$Res, _$FilterByCategoryImpl>
    implements _$$FilterByCategoryImplCopyWith<$Res> {
  __$$FilterByCategoryImplCopyWithImpl(
    _$FilterByCategoryImpl _value,
    $Res Function(_$FilterByCategoryImpl) _then,
  ) : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? userId = null, Object? category = null}) {
    return _then(
      _$FilterByCategoryImpl(
        userId: null == userId
            ? _value.userId
            : userId // ignore: cast_nullable_to_non_nullable
                  as String,
        category: null == category
            ? _value.category
            : category // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$FilterByCategoryImpl implements FilterByCategory {
  const _$FilterByCategoryImpl({required this.userId, required this.category});

  @override
  final String userId;
  @override
  final String category;

  @override
  String toString() {
    return 'TransactionEvent.filterByCategory(userId: $userId, category: $category)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FilterByCategoryImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.category, category) ||
                other.category == category));
  }

  @override
  int get hashCode => Object.hash(runtimeType, userId, category);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FilterByCategoryImplCopyWith<_$FilterByCategoryImpl> get copyWith =>
      __$$FilterByCategoryImplCopyWithImpl<_$FilterByCategoryImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String userId) loadTransactions,
    required TResult Function(String userId, DateTime month)
    loadTransactionsForMonth,
    required TResult Function(
      String userId,
      double amount,
      String category,
      String description,
      DateTime date,
      String paymentMethod,
      String? notes,
    )
    createTransaction,
    required TResult Function(
      String id,
      String userId,
      double amount,
      String category,
      String description,
      DateTime date,
      String paymentMethod,
      String? notes,
      DateTime createdAt,
    )
    updateTransaction,
    required TResult Function(String userId, String transactionId)
    deleteTransaction,
    required TResult Function(String query) searchTransactions,
    required TResult Function(String userId, String category) filterByCategory,
    required TResult Function(String userId) syncTransactions,
  }) {
    return filterByCategory(userId, category);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String userId)? loadTransactions,
    TResult? Function(String userId, DateTime month)? loadTransactionsForMonth,
    TResult? Function(
      String userId,
      double amount,
      String category,
      String description,
      DateTime date,
      String paymentMethod,
      String? notes,
    )?
    createTransaction,
    TResult? Function(
      String id,
      String userId,
      double amount,
      String category,
      String description,
      DateTime date,
      String paymentMethod,
      String? notes,
      DateTime createdAt,
    )?
    updateTransaction,
    TResult? Function(String userId, String transactionId)? deleteTransaction,
    TResult? Function(String query)? searchTransactions,
    TResult? Function(String userId, String category)? filterByCategory,
    TResult? Function(String userId)? syncTransactions,
  }) {
    return filterByCategory?.call(userId, category);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String userId)? loadTransactions,
    TResult Function(String userId, DateTime month)? loadTransactionsForMonth,
    TResult Function(
      String userId,
      double amount,
      String category,
      String description,
      DateTime date,
      String paymentMethod,
      String? notes,
    )?
    createTransaction,
    TResult Function(
      String id,
      String userId,
      double amount,
      String category,
      String description,
      DateTime date,
      String paymentMethod,
      String? notes,
      DateTime createdAt,
    )?
    updateTransaction,
    TResult Function(String userId, String transactionId)? deleteTransaction,
    TResult Function(String query)? searchTransactions,
    TResult Function(String userId, String category)? filterByCategory,
    TResult Function(String userId)? syncTransactions,
    required TResult orElse(),
  }) {
    if (filterByCategory != null) {
      return filterByCategory(userId, category);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadTransactions value) loadTransactions,
    required TResult Function(LoadTransactionsForMonth value)
    loadTransactionsForMonth,
    required TResult Function(CreateTransaction value) createTransaction,
    required TResult Function(UpdateTransaction value) updateTransaction,
    required TResult Function(DeleteTransaction value) deleteTransaction,
    required TResult Function(SearchTransactions value) searchTransactions,
    required TResult Function(FilterByCategory value) filterByCategory,
    required TResult Function(SyncTransactions value) syncTransactions,
  }) {
    return filterByCategory(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadTransactions value)? loadTransactions,
    TResult? Function(LoadTransactionsForMonth value)? loadTransactionsForMonth,
    TResult? Function(CreateTransaction value)? createTransaction,
    TResult? Function(UpdateTransaction value)? updateTransaction,
    TResult? Function(DeleteTransaction value)? deleteTransaction,
    TResult? Function(SearchTransactions value)? searchTransactions,
    TResult? Function(FilterByCategory value)? filterByCategory,
    TResult? Function(SyncTransactions value)? syncTransactions,
  }) {
    return filterByCategory?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadTransactions value)? loadTransactions,
    TResult Function(LoadTransactionsForMonth value)? loadTransactionsForMonth,
    TResult Function(CreateTransaction value)? createTransaction,
    TResult Function(UpdateTransaction value)? updateTransaction,
    TResult Function(DeleteTransaction value)? deleteTransaction,
    TResult Function(SearchTransactions value)? searchTransactions,
    TResult Function(FilterByCategory value)? filterByCategory,
    TResult Function(SyncTransactions value)? syncTransactions,
    required TResult orElse(),
  }) {
    if (filterByCategory != null) {
      return filterByCategory(this);
    }
    return orElse();
  }
}

abstract class FilterByCategory implements TransactionEvent {
  const factory FilterByCategory({
    required final String userId,
    required final String category,
  }) = _$FilterByCategoryImpl;

  String get userId;
  String get category;
  @JsonKey(ignore: true)
  _$$FilterByCategoryImplCopyWith<_$FilterByCategoryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SyncTransactionsImplCopyWith<$Res> {
  factory _$$SyncTransactionsImplCopyWith(
    _$SyncTransactionsImpl value,
    $Res Function(_$SyncTransactionsImpl) then,
  ) = __$$SyncTransactionsImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String userId});
}

/// @nodoc
class __$$SyncTransactionsImplCopyWithImpl<$Res>
    extends _$TransactionEventCopyWithImpl<$Res, _$SyncTransactionsImpl>
    implements _$$SyncTransactionsImplCopyWith<$Res> {
  __$$SyncTransactionsImplCopyWithImpl(
    _$SyncTransactionsImpl _value,
    $Res Function(_$SyncTransactionsImpl) _then,
  ) : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? userId = null}) {
    return _then(
      _$SyncTransactionsImpl(
        userId: null == userId
            ? _value.userId
            : userId // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$SyncTransactionsImpl implements SyncTransactions {
  const _$SyncTransactionsImpl({required this.userId});

  @override
  final String userId;

  @override
  String toString() {
    return 'TransactionEvent.syncTransactions(userId: $userId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SyncTransactionsImpl &&
            (identical(other.userId, userId) || other.userId == userId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, userId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SyncTransactionsImplCopyWith<_$SyncTransactionsImpl> get copyWith =>
      __$$SyncTransactionsImplCopyWithImpl<_$SyncTransactionsImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String userId) loadTransactions,
    required TResult Function(String userId, DateTime month)
    loadTransactionsForMonth,
    required TResult Function(
      String userId,
      double amount,
      String category,
      String description,
      DateTime date,
      String paymentMethod,
      String? notes,
    )
    createTransaction,
    required TResult Function(
      String id,
      String userId,
      double amount,
      String category,
      String description,
      DateTime date,
      String paymentMethod,
      String? notes,
      DateTime createdAt,
    )
    updateTransaction,
    required TResult Function(String userId, String transactionId)
    deleteTransaction,
    required TResult Function(String query) searchTransactions,
    required TResult Function(String userId, String category) filterByCategory,
    required TResult Function(String userId) syncTransactions,
  }) {
    return syncTransactions(userId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String userId)? loadTransactions,
    TResult? Function(String userId, DateTime month)? loadTransactionsForMonth,
    TResult? Function(
      String userId,
      double amount,
      String category,
      String description,
      DateTime date,
      String paymentMethod,
      String? notes,
    )?
    createTransaction,
    TResult? Function(
      String id,
      String userId,
      double amount,
      String category,
      String description,
      DateTime date,
      String paymentMethod,
      String? notes,
      DateTime createdAt,
    )?
    updateTransaction,
    TResult? Function(String userId, String transactionId)? deleteTransaction,
    TResult? Function(String query)? searchTransactions,
    TResult? Function(String userId, String category)? filterByCategory,
    TResult? Function(String userId)? syncTransactions,
  }) {
    return syncTransactions?.call(userId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String userId)? loadTransactions,
    TResult Function(String userId, DateTime month)? loadTransactionsForMonth,
    TResult Function(
      String userId,
      double amount,
      String category,
      String description,
      DateTime date,
      String paymentMethod,
      String? notes,
    )?
    createTransaction,
    TResult Function(
      String id,
      String userId,
      double amount,
      String category,
      String description,
      DateTime date,
      String paymentMethod,
      String? notes,
      DateTime createdAt,
    )?
    updateTransaction,
    TResult Function(String userId, String transactionId)? deleteTransaction,
    TResult Function(String query)? searchTransactions,
    TResult Function(String userId, String category)? filterByCategory,
    TResult Function(String userId)? syncTransactions,
    required TResult orElse(),
  }) {
    if (syncTransactions != null) {
      return syncTransactions(userId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadTransactions value) loadTransactions,
    required TResult Function(LoadTransactionsForMonth value)
    loadTransactionsForMonth,
    required TResult Function(CreateTransaction value) createTransaction,
    required TResult Function(UpdateTransaction value) updateTransaction,
    required TResult Function(DeleteTransaction value) deleteTransaction,
    required TResult Function(SearchTransactions value) searchTransactions,
    required TResult Function(FilterByCategory value) filterByCategory,
    required TResult Function(SyncTransactions value) syncTransactions,
  }) {
    return syncTransactions(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadTransactions value)? loadTransactions,
    TResult? Function(LoadTransactionsForMonth value)? loadTransactionsForMonth,
    TResult? Function(CreateTransaction value)? createTransaction,
    TResult? Function(UpdateTransaction value)? updateTransaction,
    TResult? Function(DeleteTransaction value)? deleteTransaction,
    TResult? Function(SearchTransactions value)? searchTransactions,
    TResult? Function(FilterByCategory value)? filterByCategory,
    TResult? Function(SyncTransactions value)? syncTransactions,
  }) {
    return syncTransactions?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadTransactions value)? loadTransactions,
    TResult Function(LoadTransactionsForMonth value)? loadTransactionsForMonth,
    TResult Function(CreateTransaction value)? createTransaction,
    TResult Function(UpdateTransaction value)? updateTransaction,
    TResult Function(DeleteTransaction value)? deleteTransaction,
    TResult Function(SearchTransactions value)? searchTransactions,
    TResult Function(FilterByCategory value)? filterByCategory,
    TResult Function(SyncTransactions value)? syncTransactions,
    required TResult orElse(),
  }) {
    if (syncTransactions != null) {
      return syncTransactions(this);
    }
    return orElse();
  }
}

abstract class SyncTransactions implements TransactionEvent {
  const factory SyncTransactions({required final String userId}) =
      _$SyncTransactionsImpl;

  String get userId;
  @JsonKey(ignore: true)
  _$$SyncTransactionsImplCopyWith<_$SyncTransactionsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
