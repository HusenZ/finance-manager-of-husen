import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../data/models/recurring_transaction.dart';

part 'recurring_state.freezed.dart';

@freezed
class RecurringState with _$RecurringState {
  const factory RecurringState.initial() = RecurringInitial;
  const factory RecurringState.loading() = RecurringLoading;
  const factory RecurringState.loaded({required List<RecurringTransaction> transactions}) = RecurringLoaded;
  const factory RecurringState.error({required String message}) = RecurringError;
  const factory RecurringState.success({required String message}) = RecurringSuccess;
  const factory RecurringState.detected({required List<RecurringTransaction> detectedTransactions}) = RecurringDetected;
}
