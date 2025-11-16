import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../data/models/transaction.dart';

part 'transaction_state.freezed.dart';

@freezed
class TransactionState with _$TransactionState {
  const factory TransactionState.initial() = TransactionInitial;

  const factory TransactionState.loading() = TransactionLoading;

  const factory TransactionState.loaded({
    required List<Transaction> transactions,
  }) = TransactionLoaded;

  const factory TransactionState.error({
    required String message,
  }) = TransactionError;

  const factory TransactionState.success({
    required String message,
  }) = TransactionSuccess;
}
