import 'package:hive/hive.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'income.freezed.dart';
part 'income.g.dart';

@freezed
@HiveType(typeId: 5)
class Income with _$Income {
  const Income._();

  const factory Income({
    @HiveField(0) required String id,
    @HiveField(1) required String userId,
    @HiveField(2) required double amount,
    @HiveField(3)
    required String source, // Salary, Freelance, Business, Investment, etc.
    @HiveField(4) required String description,
    @HiveField(5) required DateTime date,
    @HiveField(6) String? notes,
    @HiveField(7) @Default(false) bool isRecurring,
    @HiveField(8) String? recurrenceFrequency, // monthly, weekly, yearly
    @HiveField(9) required DateTime createdAt,
    @HiveField(10) DateTime? updatedAt,
    @HiveField(11) @Default(false) bool isSynced,
  }) = _Income;

  factory Income.fromJson(Map<String, dynamic> json) => _$IncomeFromJson(json);

  factory Income.fromFirestore(Map<String, dynamic> data, String id) {
    return Income(
      id: id,
      userId: data['userId'] as String? ?? '',
      amount: (data['amount'] as num?)?.toDouble() ?? 0.0,
      source: data['source'] as String? ?? 'Other',
      description: data['description'] as String? ?? '',
      date: data['date'] != null
          ? DateTime.parse(data['date'] as String)
          : DateTime.now(),
      notes: data['notes'] as String?,
      isRecurring: data['isRecurring'] as bool? ?? false,
      recurrenceFrequency: data['recurrenceFrequency'] as String?,
      createdAt: data['createdAt'] != null
          ? DateTime.parse(data['createdAt'] as String)
          : DateTime.now(),
      updatedAt: data['updatedAt'] != null
          ? DateTime.parse(data['updatedAt'] as String)
          : null,
      isSynced: data['isSynced'] as bool? ?? false,
    );
  }
}

extension IncomeX on Income {
  Map<String, dynamic> toFirestore() {
    return {
      'userId': userId,
      'amount': amount,
      'source': source,
      'description': description,
      'date': date.toIso8601String(),
      'notes': notes,
      'isRecurring': isRecurring,
      'recurrenceFrequency': recurrenceFrequency,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt?.toIso8601String(),
      'isSynced': isSynced,
    };
  }

  // Helper to get formatted amount with currency
  String getFormattedAmount(String currency) {
    return '+${amount.toStringAsFixed(2)} $currency';
  }

  // Helper to check if income is from this month
  bool isFromMonth(DateTime month) {
    return date.year == month.year && date.month == month.month;
  }

  // Helper to get source color
  String getSourceColor() {
    switch (source.toLowerCase()) {
      case 'salary':
        return '#4CAF50'; // Green
      case 'freelance':
        return '#2196F3'; // Blue
      case 'business':
        return '#FF9800'; // Orange
      case 'investment':
        return '#9C27B0'; // Purple
      case 'rental':
        return '#00BCD4'; // Cyan
      case 'bonus':
        return '#FFC107'; // Amber
      default:
        return '#607D8B'; // Grey
    }
  }
}
