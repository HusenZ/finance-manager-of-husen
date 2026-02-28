import 'package:freezed_annotation/freezed_annotation.dart';

part 'budget_event.freezed.dart';

@freezed
class BudgetEvent with _$BudgetEvent {
  const factory BudgetEvent.loadBudgets({required String userId}) = LoadBudgets;
  const factory BudgetEvent.loadBudgetsForMonth({
    required String userId,
    required DateTime month,
  }) = LoadBudgetsForMonth;
  const factory BudgetEvent.createBudget({
    required String userId,
    required String category,
    required double limit,
    required DateTime month,
  }) = CreateBudget;
  const factory BudgetEvent.updateBudget({
    required String id,
    required String userId,
    required String category,
    required double limit,
    required String month,
    required double spent,
    required DateTime createdAt,
  }) = UpdateBudget;
  const factory BudgetEvent.deleteBudget({
    required String userId,
    required String budgetId,
  }) = DeleteBudget;
}
