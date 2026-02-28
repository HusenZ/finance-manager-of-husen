import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uuid/uuid.dart';
import '../../../data/models/income.dart';
import '../../../data/repositories/income_repository.dart';
import '../../../core/utils/app_logger.dart';
import 'income_event.dart';
import 'income_state.dart';

class IncomeBloc extends Bloc<IncomeEvent, IncomeState> {
  final IncomeRepository _incomeRepository;
  final Uuid _uuid = const Uuid();

  IncomeBloc(this._incomeRepository) : super(const IncomeState.initial()) {
    on<LoadIncomesEvent>(_onLoadIncomes);
    on<LoadIncomesForMonthEvent>(_onLoadIncomesForMonth);
    on<CreateIncomeEvent>(_onCreateIncome);
    on<UpdateIncomeEvent>(_onUpdateIncome);
    on<DeleteIncomeEvent>(_onDeleteIncome);
    on<SearchIncomesEvent>(_onSearchIncomes);
    on<FilterBySourceEvent>(_onFilterBySource);
    on<GetRecurringIncomesEvent>(_onGetRecurringIncomes);
    on<GetTotalIncomeForMonthEvent>(_onGetTotalIncomeForMonth);
    on<SyncIncomesEvent>(_onSyncIncomes);
  }

  Future<void> _onLoadIncomes(
    LoadIncomesEvent event,
    Emitter<IncomeState> emit,
  ) async {
    emit(const IncomeState.loading());
    AppLogger.debug('Loading incomes for user: ${event.userId}');

    final result = await _incomeRepository.getIncomes(event.userId);

    result.fold(
      (error) {
        AppLogger.error('Failed to load incomes: $error');
        emit(IncomeState.error(message: error));
      },
      (incomes) {
        AppLogger.info('Loaded ${incomes.length} incomes');
        emit(IncomeState.loaded(incomes: incomes));
      },
    );
  }

  Future<void> _onLoadIncomesForMonth(
    LoadIncomesForMonthEvent event,
    Emitter<IncomeState> emit,
  ) async {
    emit(const IncomeState.loading());
    AppLogger.debug(
      'Loading incomes for month: ${event.month.year}-${event.month.month}',
    );

    final result = await _incomeRepository.getIncomesForMonth(
      event.userId,
      event.month,
    );

    result.fold(
      (error) {
        AppLogger.error('Failed to load monthly incomes: $error');
        emit(IncomeState.error(message: error));
      },
      (incomes) {
        AppLogger.info('Loaded ${incomes.length} incomes for the month');
        emit(IncomeState.loaded(incomes: incomes));
      },
    );
  }

  Future<void> _onCreateIncome(
    CreateIncomeEvent event,
    Emitter<IncomeState> emit,
  ) async {
    emit(const IncomeState.loading());
    AppLogger.debug('Creating income: ${event.description}');

    final income = Income(
      id: _uuid.v4(),
      userId: event.userId,
      amount: event.amount,
      source: event.source,
      description: event.description,
      date: event.date,
      notes: event.notes,
      isRecurring: event.isRecurring,
      recurrenceFrequency: event.recurrenceFrequency,
      createdAt: DateTime.now(),
      isSynced: false,
    );

    final result = await _incomeRepository.createIncome(income);

    result.fold(
      (error) {
        AppLogger.error('Failed to create income: $error');
        emit(IncomeState.error(message: error));
      },
      (createdIncome) {
        AppLogger.info('Income created successfully: ${createdIncome.id}');
        emit(const IncomeState.success(message: 'Income added successfully'));
        // Reload incomes after creation
        add(LoadIncomesEvent(userId: event.userId));
      },
    );
  }

  Future<void> _onUpdateIncome(
    UpdateIncomeEvent event,
    Emitter<IncomeState> emit,
  ) async {
    emit(const IncomeState.loading());
    AppLogger.debug('Updating income: ${event.income.id}');

    final result = await _incomeRepository.updateIncome(event.income);

    result.fold(
      (error) {
        AppLogger.error('Failed to update income: $error');
        emit(IncomeState.error(message: error));
      },
      (updatedIncome) {
        AppLogger.info('Income updated successfully: ${updatedIncome.id}');
        emit(const IncomeState.success(message: 'Income updated successfully'));
        // Reload incomes after update
        add(LoadIncomesEvent(userId: event.income.userId));
      },
    );
  }

  Future<void> _onDeleteIncome(
    DeleteIncomeEvent event,
    Emitter<IncomeState> emit,
  ) async {
    emit(const IncomeState.loading());
    AppLogger.debug('Deleting income: ${event.incomeId}');

    final result = await _incomeRepository.deleteIncome(
      event.userId,
      event.incomeId,
    );

    result.fold(
      (error) {
        AppLogger.error('Failed to delete income: $error');
        emit(IncomeState.error(message: error));
      },
      (_) {
        AppLogger.info('Income deleted successfully: ${event.incomeId}');
        emit(const IncomeState.success(message: 'Income deleted successfully'));
        // Reload incomes after deletion
        add(LoadIncomesEvent(userId: event.userId));
      },
    );
  }

  Future<void> _onSearchIncomes(
    SearchIncomesEvent event,
    Emitter<IncomeState> emit,
  ) async {
    emit(const IncomeState.loading());
    AppLogger.debug('Searching incomes with query: ${event.query}');

    final result = await _incomeRepository.searchIncomes(
      event.userId,
      event.query,
    );

    result.fold(
      (error) {
        AppLogger.error('Failed to search incomes: $error');
        emit(IncomeState.error(message: error));
      },
      (incomes) {
        AppLogger.info('Found ${incomes.length} incomes matching query');
        emit(IncomeState.loaded(incomes: incomes));
      },
    );
  }

  Future<void> _onFilterBySource(
    FilterBySourceEvent event,
    Emitter<IncomeState> emit,
  ) async {
    emit(const IncomeState.loading());
    AppLogger.debug('Filtering incomes by source: ${event.source}');

    final result = await _incomeRepository.filterBySource(
      event.userId,
      event.source,
    );

    result.fold(
      (error) {
        AppLogger.error('Failed to filter incomes: $error');
        emit(IncomeState.error(message: error));
      },
      (incomes) {
        AppLogger.info(
          'Found ${incomes.length} incomes for source: ${event.source}',
        );
        emit(IncomeState.loaded(incomes: incomes));
      },
    );
  }

  Future<void> _onGetRecurringIncomes(
    GetRecurringIncomesEvent event,
    Emitter<IncomeState> emit,
  ) async {
    emit(const IncomeState.loading());
    AppLogger.debug('Loading recurring incomes');

    final result = await _incomeRepository.getRecurringIncomes(event.userId);

    result.fold(
      (error) {
        AppLogger.error('Failed to load recurring incomes: $error');
        emit(IncomeState.error(message: error));
      },
      (incomes) {
        AppLogger.info('Found ${incomes.length} recurring incomes');
        emit(IncomeState.loaded(incomes: incomes));
      },
    );
  }

  Future<void> _onGetTotalIncomeForMonth(
    GetTotalIncomeForMonthEvent event,
    Emitter<IncomeState> emit,
  ) async {
    emit(const IncomeState.loading());
    AppLogger.debug(
      'Calculating total income for month: ${event.month.year}-${event.month.month}',
    );

    final result = await _incomeRepository.getTotalIncomeForMonth(
      event.userId,
      event.month,
    );

    result.fold(
      (error) {
        AppLogger.error('Failed to calculate total income: $error');
        emit(IncomeState.error(message: error));
      },
      (total) {
        AppLogger.info('Total income for month: $total');
        emit(IncomeState.totalCalculated(total: total));
      },
    );
  }

  Future<void> _onSyncIncomes(
    SyncIncomesEvent event,
    Emitter<IncomeState> emit,
  ) async {
    AppLogger.debug('Syncing incomes with Firebase');

    final result = await _incomeRepository.syncIncomes(event.userId);

    result.fold(
      (error) {
        AppLogger.error('Failed to sync incomes: $error');
        // Don't emit error state for sync failures
      },
      (_) {
        AppLogger.info('Incomes synced successfully');
        // Reload incomes after sync
        add(LoadIncomesEvent(userId: event.userId));
      },
    );
  }
}
