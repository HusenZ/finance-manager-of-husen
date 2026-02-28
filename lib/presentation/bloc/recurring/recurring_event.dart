import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../data/models/recurring_transaction.dart';

part 'recurring_event.freezed.dart';

@freezed
class RecurringEvent with _$RecurringEvent {
  const factory RecurringEvent.loadRecurringTransactions({
    required String userId,
  }) = LoadRecurringTransactions;
  const factory RecurringEvent.createRecurringTransaction({
    required String userId,
    required double amount,
    required String category,
    required String description,
    required RecurringFrequency frequency,
    required DateTime nextDueDate,
    String? paymentMethod,
    String? notes,
  }) = CreateRecurringTransaction;
  const factory RecurringEvent.toggleRecurringTransaction({
    required String id,
    required String userId,
    required double amount,
    required String category,
    required String description,
    required RecurringFrequency frequency,
    required DateTime nextDueDate,
    required bool isActive,
    String? paymentMethod,
    String? notes,
    required DateTime createdAt,
  }) = ToggleRecurringTransaction;
  const factory RecurringEvent.deleteRecurringTransaction({
    required String userId,
    required String transactionId,
  }) = DeleteRecurringTransaction;
  const factory RecurringEvent.detectRecurringPatterns({
    required String userId,
  }) = DetectRecurringPatterns;
  const factory RecurringEvent.processRecurringTransactions({
    required String userId,
  }) = ProcessRecurringTransactions;
}
