import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../data/models/income.dart';

part 'income_event.freezed.dart';

@freezed
class IncomeEvent with _$IncomeEvent {
  const factory IncomeEvent.loadIncomes({required String userId}) =
      LoadIncomesEvent;

  const factory IncomeEvent.loadIncomesForMonth({
    required String userId,
    required DateTime month,
  }) = LoadIncomesForMonthEvent;

  const factory IncomeEvent.createIncome({
    required String userId,
    required double amount,
    required String source,
    required String description,
    required DateTime date,
    String? notes,
    @Default(false) bool isRecurring,
    String? recurrenceFrequency,
  }) = CreateIncomeEvent;

  const factory IncomeEvent.updateIncome({
    required Income income,
  }) = UpdateIncomeEvent;

  const factory IncomeEvent.deleteIncome({
    required String userId,
    required String incomeId,
  }) = DeleteIncomeEvent;

  const factory IncomeEvent.searchIncomes({
    required String userId,
    required String query,
  }) = SearchIncomesEvent;

  const factory IncomeEvent.filterBySource({
    required String userId,
    required String source,
  }) = FilterBySourceEvent;

  const factory IncomeEvent.getRecurringIncomes({
    required String userId,
  }) = GetRecurringIncomesEvent;

  const factory IncomeEvent.getTotalIncomeForMonth({
    required String userId,
    required DateTime month,
  }) = GetTotalIncomeForMonthEvent;

  const factory IncomeEvent.syncIncomes({
    required String userId,
  }) = SyncIncomesEvent;
}
