import 'package:hive/hive.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'transaction.freezed.dart';
part 'transaction.g.dart';

@freezed
@HiveType(typeId: 0)
class Transaction with _$Transaction {
  const factory Transaction({
    @HiveField(0) required String id,
    @HiveField(1) required String userId,
    @HiveField(2) required double amount,
    @HiveField(3) required String category,
    @HiveField(4) required String description,
    @HiveField(5) required DateTime date,
    @HiveField(6) required String paymentMethod,
    @HiveField(7) @Default(false) bool isRecurring,
    @HiveField(8) String? recurringId,
    @HiveField(9) String? notes,
    @HiveField(10) required DateTime createdAt,
    @HiveField(11) DateTime? updatedAt,
    @HiveField(12) DateTime? syncedAt,
  }) = _Transaction;

  factory Transaction.fromJson(Map<String, dynamic> json) =>
      _$TransactionFromJson(json);

  factory Transaction.fromFirestore(Map<String, dynamic> data, String id) {
    return Transaction(
      id: id,
      userId: data['userId'] as String? ?? '',
      amount: (data['amount'] as num?)?.toDouble() ?? 0.0,
      category: data['category'] as String? ?? '',
      description: data['description'] as String? ?? '',
      date: data['date'] != null
          ? DateTime.parse(data['date'] as String)
          : DateTime.now(),
      paymentMethod: data['paymentMethod'] as String? ?? '',
      isRecurring: data['isRecurring'] as bool? ?? false,
      recurringId: data['recurringId'] as String?,
      notes: data['notes'] as String?,
      createdAt: data['createdAt'] != null
          ? DateTime.parse(data['createdAt'] as String)
          : DateTime.now(),
      updatedAt: data['updatedAt'] != null
          ? DateTime.parse(data['updatedAt'] as String)
          : null,
      syncedAt: data['syncedAt'] != null
          ? DateTime.parse(data['syncedAt'] as String)
          : null,
    );
  }
}

extension TransactionX on Transaction {
  Map<String, dynamic> toFirestore() {
    return {
      'userId': userId,
      'amount': amount,
      'category': category,
      'description': description,
      'date': date.toIso8601String(),
      'paymentMethod': paymentMethod,
      'isRecurring': isRecurring,
      'recurringId': recurringId,
      'notes': notes,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt?.toIso8601String(),
      'syncedAt': syncedAt?.toIso8601String(),
    };
  }
}
