import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../data/models/income.dart';

part 'income_state.freezed.dart';

@freezed
class IncomeState with _$IncomeState {
  const factory IncomeState.initial() = IncomeInitial;

  const factory IncomeState.loading() = IncomeLoading;

  const factory IncomeState.loaded({required List<Income> incomes}) =
      IncomeLoaded;

  const factory IncomeState.totalCalculated({required double total}) =
      IncomeTotalCalculated;

  const factory IncomeState.success({required String message}) = IncomeSuccess;

  const factory IncomeState.error({required String message}) = IncomeError;
}
