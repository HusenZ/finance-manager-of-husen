import 'package:hive/hive.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'budget.freezed.dart';
part 'budget.g.dart';

@freezed
@HiveType(typeId: 2)
class Budget with _$Budget {
  const factory Budget({
    @HiveField(0) required String id,
    @HiveField(1) required String userId,
    @HiveField(2) required String category,
    @HiveField(3) required double limit,
    @HiveField(4) required String month,
    @HiveField(5) @Default(0.0) double spent,
    @HiveField(6) required DateTime createdAt,
    @HiveField(7) DateTime? updatedAt,
  }) = _Budget;

  factory Budget.fromJson(Map<String, dynamic> json) => _$BudgetFromJson(json);

  factory Budget.fromFirestore(Map<String, dynamic> data, String id) {
    return Budget(
      id: id,
      userId: data['userId'] as String? ?? '',
      category: data['category'] as String? ?? '',
      limit: (data['limit'] as num?)?.toDouble() ?? 0.0,
      month: data['month'] as String? ?? '',
      spent: (data['spent'] as num?)?.toDouble() ?? 0.0,
      createdAt: data['createdAt'] != null
          ? DateTime.parse(data['createdAt'] as String)
          : DateTime.now(),
      updatedAt: data['updatedAt'] != null
          ? DateTime.parse(data['updatedAt'] as String)
          : null,
    );
  }
}

extension BudgetX on Budget {
  Map<String, dynamic> toFirestore() {
    return {
      'userId': userId,
      'category': category,
      'limit': limit,
      'month': month,
      'spent': spent,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt?.toIso8601String(),
    };
  }

  double get percentage => limit > 0 ? (spent / limit) : 0.0;

  double get remaining => limit - spent;

  bool get isExceeded => spent >= limit;

  bool get isWarning => percentage >= 0.8;
}
