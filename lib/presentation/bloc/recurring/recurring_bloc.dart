import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/repositories/recurring_repository.dart';
import '../../../data/models/recurring_transaction.dart';
import '../../../core/utils/app_logger.dart';
import 'recurring_event.dart';
import 'recurring_state.dart';

class RecurringBloc extends Bloc<RecurringEvent, RecurringState> {
  final RecurringRepository _recurringRepository;

  RecurringBloc({required RecurringRepository recurringRepository})
    : _recurringRepository = recurringRepository,
      super(const RecurringState.initial()) {
    on<LoadRecurringTransactions>(_onLoadRecurringTransactions);
    on<CreateRecurringTransaction>(_onCreateRecurringTransaction);
    on<ToggleRecurringTransaction>(_onToggleRecurringTransaction);
    on<DeleteRecurringTransaction>(_onDeleteRecurringTransaction);
    on<DetectRecurringPatterns>(_onDetectRecurringPatterns);
    on<ProcessRecurringTransactions>(_onProcessRecurringTransactions);
  }

  Future<void> _onLoadRecurringTransactions(
    LoadRecurringTransactions event,
    Emitter<RecurringState> emit,
  ) async {
    try {
      emit(const RecurringState.loading());
      final result = await _recurringRepository.getAllRecurringTransactions(
        userId: event.userId,
      );
      result.fold(
        (error) => emit(RecurringState.error(message: error)),
        (transactions) =>
            emit(RecurringState.loaded(transactions: transactions)),
      );
    } catch (e) {
      emit(const RecurringState.error(message: 'An unexpected error occurred'));
    }
  }

  Future<void> _onCreateRecurringTransaction(
    CreateRecurringTransaction event,
    Emitter<RecurringState> emit,
  ) async {
    try {
      emit(const RecurringState.loading());
      final result = await _recurringRepository.createRecurringTransaction(
        userId: event.userId,
        amount: event.amount,
        category: event.category,
        description: event.description,
        frequency: event.frequency,
        nextDueDate: event.nextDueDate,
        paymentMethod: event.paymentMethod,
        notes: event.notes,
      );
      result.fold((error) => emit(RecurringState.error(message: error)), (
        transaction,
      ) {
        emit(
          const RecurringState.success(
            message: 'Recurring transaction created successfully',
          ),
        );
        add(LoadRecurringTransactions(userId: event.userId));
      });
    } catch (e) {
      emit(const RecurringState.error(message: 'An unexpected error occurred'));
    }
  }

  Future<void> _onToggleRecurringTransaction(
    ToggleRecurringTransaction event,
    Emitter<RecurringState> emit,
  ) async {
    try {
      emit(const RecurringState.loading());
      final transaction = RecurringTransaction(
        id: event.id,
        userId: event.userId,
        amount: event.amount,
        category: event.category,
        description: event.description,
        frequency: event.frequency,
        nextDueDate: event.nextDueDate,
        isActive: event.isActive,
        paymentMethod: event.paymentMethod,
        notes: event.notes,
        createdAt: event.createdAt,
      );
      final result = await _recurringRepository.toggleActiveStatus(
        transaction: transaction,
      );
      result.fold((error) => emit(RecurringState.error(message: error)), (
        updatedTransaction,
      ) {
        emit(
          const RecurringState.success(
            message: 'Recurring transaction toggled successfully',
          ),
        );
        add(LoadRecurringTransactions(userId: event.userId));
      });
    } catch (e) {
      emit(const RecurringState.error(message: 'An unexpected error occurred'));
    }
  }

  Future<void> _onDeleteRecurringTransaction(
    DeleteRecurringTransaction event,
    Emitter<RecurringState> emit,
  ) async {
    try {
      emit(const RecurringState.loading());
      final result = await _recurringRepository.deleteRecurringTransaction(
        userId: event.userId,
        transactionId: event.transactionId,
      );
      result.fold((error) => emit(RecurringState.error(message: error)), (_) {
        emit(
          const RecurringState.success(
            message: 'Recurring transaction deleted successfully',
          ),
        );
        add(LoadRecurringTransactions(userId: event.userId));
      });
    } catch (e) {
      emit(const RecurringState.error(message: 'An unexpected error occurred'));
    }
  }

  Future<void> _onDetectRecurringPatterns(
    DetectRecurringPatterns event,
    Emitter<RecurringState> emit,
  ) async {
    try {
      emit(const RecurringState.loading());
      final result = await _recurringRepository.detectRecurringTransactions(
        userId: event.userId,
      );
      result.fold(
        (error) => emit(RecurringState.error(message: error)),
        (detected) =>
            emit(RecurringState.detected(detectedTransactions: detected)),
      );
    } catch (e) {
      emit(const RecurringState.error(message: 'An unexpected error occurred'));
    }
  }

  Future<void> _onProcessRecurringTransactions(
    ProcessRecurringTransactions event,
    Emitter<RecurringState> emit,
  ) async {
    try {
      final result = await _recurringRepository.processRecurringTransactions(
        userId: event.userId,
      );
      result.fold(
        (error) => AppLogger.warning(
          'Processing recurring transactions failed: $error',
        ),
        (_) => AppLogger.info('Recurring transactions processed successfully'),
      );
    } catch (e) {
      AppLogger.error('Process recurring transactions error', error: e);
    }
  }
}
