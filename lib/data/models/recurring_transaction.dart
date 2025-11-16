import 'package:hive/hive.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'recurring_transaction.freezed.dart';
part 'recurring_transaction.g.dart';

enum RecurringFrequency {
  daily,
  weekly,
  biweekly,
  monthly,
  quarterly,
  yearly,
}

@freezed
@HiveType(typeId: 4)
class RecurringTransaction with _$RecurringTransaction {
  const factory RecurringTransaction({
    @HiveField(0) required String id,
    @HiveField(1) required String userId,
    @HiveField(2) required double amount,
    @HiveField(3) required String category,
    @HiveField(4) required String description,
    @HiveField(5) required RecurringFrequency frequency,
    @HiveField(6) required DateTime nextDueDate,
    @HiveField(7) @Default(true) bool isActive,
    @HiveField(8) String? paymentMethod,
    @HiveField(9) String? notes,
    @HiveField(10) required DateTime createdAt,
    @HiveField(11) DateTime? updatedAt,
  }) = _RecurringTransaction;

  factory RecurringTransaction.fromJson(Map<String, dynamic> json) =>
      _$RecurringTransactionFromJson(json);

  factory RecurringTransaction.fromFirestore(
      Map<String, dynamic> data, String id) {
    return RecurringTransaction(
      id: id,
      userId: data['userId'] as String? ?? '',
      amount: (data['amount'] as num?)?.toDouble() ?? 0.0,
      category: data['category'] as String? ?? '',
      description: data['description'] as String? ?? '',
      frequency: _parseFrequency(data['frequency'] as String?),
      nextDueDate: data['nextDueDate'] != null
          ? DateTime.parse(data['nextDueDate'] as String)
          : DateTime.now(),
      isActive: data['isActive'] as bool? ?? true,
      paymentMethod: data['paymentMethod'] as String?,
      notes: data['notes'] as String?,
      createdAt: data['createdAt'] != null
          ? DateTime.parse(data['createdAt'] as String)
          : DateTime.now(),
      updatedAt: data['updatedAt'] != null
          ? DateTime.parse(data['updatedAt'] as String)
          : null,
    );
  }

  static RecurringFrequency _parseFrequency(String? frequency) {
    switch (frequency?.toLowerCase()) {
      case 'daily':
        return RecurringFrequency.daily;
      case 'weekly':
        return RecurringFrequency.weekly;
      case 'biweekly':
        return RecurringFrequency.biweekly;
      case 'monthly':
        return RecurringFrequency.monthly;
      case 'quarterly':
        return RecurringFrequency.quarterly;
      case 'yearly':
        return RecurringFrequency.yearly;
      default:
        return RecurringFrequency.monthly;
    }
  }
}

extension RecurringTransactionX on RecurringTransaction {
  Map<String, dynamic> toFirestore() {
    return {
      'userId': userId,
      'amount': amount,
      'category': category,
      'description': description,
      'frequency': frequency.name,
      'nextDueDate': nextDueDate.toIso8601String(),
      'isActive': isActive,
      'paymentMethod': paymentMethod,
      'notes': notes,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt?.toIso8601String(),
    };
  }

  DateTime getNextDueDate() {
    final now = DateTime.now();
    var next = nextDueDate;

    while (next.isBefore(now)) {
      switch (frequency) {
        case RecurringFrequency.daily:
          next = next.add(const Duration(days: 1));
          break;
        case RecurringFrequency.weekly:
          next = next.add(const Duration(days: 7));
          break;
        case RecurringFrequency.biweekly:
          next = next.add(const Duration(days: 14));
          break;
        case RecurringFrequency.monthly:
          next = DateTime(next.year, next.month + 1, next.day);
          break;
        case RecurringFrequency.quarterly:
          next = DateTime(next.year, next.month + 3, next.day);
          break;
        case RecurringFrequency.yearly:
          next = DateTime(next.year + 1, next.month, next.day);
          break;
      }
    }

    return next;
  }

  double getAnnualCost() {
    switch (frequency) {
      case RecurringFrequency.daily:
        return amount * 365;
      case RecurringFrequency.weekly:
        return amount * 52;
      case RecurringFrequency.biweekly:
        return amount * 26;
      case RecurringFrequency.monthly:
        return amount * 12;
      case RecurringFrequency.quarterly:
        return amount * 4;
      case RecurringFrequency.yearly:
        return amount;
    }
  }

  double getMonthlyCost() {
    return getAnnualCost() / 12;
  }
}
