import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/repositories/budget_repository.dart';
import '../../../data/models/budget.dart';
import 'budget_event.dart';
import 'budget_state.dart';

class BudgetBloc extends Bloc<BudgetEvent, BudgetState> {
  final BudgetRepository _budgetRepository;

  BudgetBloc({required BudgetRepository budgetRepository})
      : _budgetRepository = budgetRepository,
        super(const BudgetState.initial()) {
    on<LoadBudgets>(_onLoadBudgets);
    on<LoadBudgetsForMonth>(_onLoadBudgetsForMonth);
    on<CreateBudget>(_onCreateBudget);
    on<UpdateBudget>(_onUpdateBudget);
    on<DeleteBudget>(_onDeleteBudget);
  }

  Future<void> _onLoadBudgets(LoadBudgets event, Emitter<BudgetState> emit) async {
    try {
      emit(const BudgetState.loading());
      final result = await _budgetRepository.getAllBudgets(userId: event.userId);
      result.fold(
        (error) => emit(BudgetState.error(message: error)),
        (budgets) => emit(BudgetState.loaded(budgets: budgets)),
      );
    } catch (e) {
      emit(const BudgetState.error(message: 'An unexpected error occurred'));
    }
  }

  Future<void> _onLoadBudgetsForMonth(LoadBudgetsForMonth event, Emitter<BudgetState> emit) async {
    try {
      emit(const BudgetState.loading());
      final result = await _budgetRepository.getBudgetsForMonth(userId: event.userId, month: event.month);
      result.fold(
        (error) => emit(BudgetState.error(message: error)),
        (budgets) => emit(BudgetState.loaded(budgets: budgets)),
      );
    } catch (e) {
      emit(const BudgetState.error(message: 'An unexpected error occurred'));
    }
  }

  Future<void> _onCreateBudget(CreateBudget event, Emitter<BudgetState> emit) async {
    try {
      emit(const BudgetState.loading());
      final result = await _budgetRepository.createBudget(
        userId: event.userId,
        category: event.category,
        limit: event.limit,
        month: event.month,
      );
      result.fold(
        (error) => emit(BudgetState.error(message: error)),
        (budget) {
          emit(const BudgetState.success(message: 'Budget created successfully'));
          add(LoadBudgets(userId: event.userId));
        },
      );
    } catch (e) {
      emit(const BudgetState.error(message: 'An unexpected error occurred'));
    }
  }

  Future<void> _onUpdateBudget(UpdateBudget event, Emitter<BudgetState> emit) async {
    try {
      emit(const BudgetState.loading());
      final budget = Budget(id: event.id, userId: event.userId, category: event.category, limit: event.limit, month: event.month, spent: event.spent, createdAt: event.createdAt);
      final result = await _budgetRepository.updateBudget(budget: budget);
      result.fold(
        (error) => emit(BudgetState.error(message: error)),
        (updatedBudget) {
          emit(const BudgetState.success(message: 'Budget updated successfully'));
          add(LoadBudgets(userId: event.userId));
        },
      );
    } catch (e) {
      emit(const BudgetState.error(message: 'An unexpected error occurred'));
    }
  }

  Future<void> _onDeleteBudget(DeleteBudget event, Emitter<BudgetState> emit) async {
    try {
      emit(const BudgetState.loading());
      final result = await _budgetRepository.deleteBudget(userId: event.userId, budgetId: event.budgetId);
      result.fold(
        (error) => emit(BudgetState.error(message: error)),
        (_) {
          emit(const BudgetState.success(message: 'Budget deleted successfully'));
          add(LoadBudgets(userId: event.userId));
        },
      );
    } catch (e) {
      emit(const BudgetState.error(message: 'An unexpected error occurred'));
    }
  }
}
