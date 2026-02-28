import 'package:freezed_annotation/freezed_annotation.dart';

part 'transaction_event.freezed.dart';

@freezed
class TransactionEvent with _$TransactionEvent {
  const factory TransactionEvent.loadTransactions({required String userId}) =
      LoadTransactions;

  const factory TransactionEvent.loadTransactionsForMonth({
    required String userId,
    required DateTime month,
  }) = LoadTransactionsForMonth;

  const factory TransactionEvent.createTransaction({
    required String userId,
    required double amount,
    required String category,
    required String description,
    required DateTime date,
    required String paymentMethod,
    String? notes,
  }) = CreateTransaction;

  const factory TransactionEvent.updateTransaction({
    required String id,
    required String userId,
    required double amount,
    required String category,
    required String description,
    required DateTime date,
    required String paymentMethod,
    String? notes,
    required DateTime createdAt,
  }) = UpdateTransaction;

  const factory TransactionEvent.deleteTransaction({
    required String userId,
    required String transactionId,
  }) = DeleteTransaction;

  const factory TransactionEvent.searchTransactions({required String query}) =
      SearchTransactions;

  const factory TransactionEvent.filterByCategory({
    required String userId,
    required String category,
  }) = FilterByCategory;

  const factory TransactionEvent.syncTransactions({required String userId}) =
      SyncTransactions;
}
