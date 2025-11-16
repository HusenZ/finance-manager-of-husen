import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/repositories/transaction_repository.dart';
import '../../../data/repositories/category_repository.dart';
import '../../../data/models/transaction.dart';
import '../../../core/utils/app_logger.dart';
import 'transaction_event.dart';
import 'transaction_state.dart';

class TransactionBloc extends Bloc<TransactionEvent, TransactionState> {
  final TransactionRepository _transactionRepository;
  final CategoryRepository _categoryRepository;

  TransactionBloc({
    required TransactionRepository transactionRepository,
    required CategoryRepository categoryRepository,
  })  : _transactionRepository = transactionRepository,
        _categoryRepository = categoryRepository,
        super(const TransactionState.initial()) {
    on<LoadTransactions>(_onLoadTransactions);
    on<LoadTransactionsForMonth>(_onLoadTransactionsForMonth);
    on<CreateTransaction>(_onCreateTransaction);
    on<UpdateTransaction>(_onUpdateTransaction);
    on<DeleteTransaction>(_onDeleteTransaction);
    on<SearchTransactions>(_onSearchTransactions);
    on<FilterByCategory>(_onFilterByCategory);
    on<SyncTransactions>(_onSyncTransactions);
  }

  Future<void> _onLoadTransactions(
    LoadTransactions event,
    Emitter<TransactionState> emit,
  ) async {
    try {
      emit(const TransactionState.loading());

      final result = await _transactionRepository.getAllTransactions(
        userId: event.userId,
      );

      result.fold(
        (error) {
          AppLogger.error('Failed to load transactions: $error');
          emit(TransactionState.error(message: error));
        },
        (transactions) {
          emit(TransactionState.loaded(transactions: transactions));
        },
      );
    } catch (e) {
      AppLogger.error('Load transactions error', error: e);
      emit(const TransactionState.error(message: 'An unexpected error occurred'));
    }
  }

  Future<void> _onLoadTransactionsForMonth(
    LoadTransactionsForMonth event,
    Emitter<TransactionState> emit,
  ) async {
    try {
      emit(const TransactionState.loading());

      final result = await _transactionRepository.getTransactionsForMonth(
        userId: event.userId,
        month: event.month,
      );

      result.fold(
        (error) {
          AppLogger.error('Failed to load transactions for month: $error');
          emit(TransactionState.error(message: error));
        },
        (transactions) {
          emit(TransactionState.loaded(transactions: transactions));
        },
      );
    } catch (e) {
      AppLogger.error('Load transactions for month error', error: e);
      emit(const TransactionState.error(message: 'An unexpected error occurred'));
    }
  }

  Future<void> _onCreateTransaction(
    CreateTransaction event,
    Emitter<TransactionState> emit,
  ) async {
    try {
      emit(const TransactionState.loading());

      // Get smart category suggestion if description is provided
      String category = event.category;
      if (category.isEmpty && event.description.isNotEmpty) {
        final suggestion = await _categoryRepository.suggestCategory(event.description);
        if (suggestion != null) {
          category = suggestion;
        }
      }

      final result = await _transactionRepository.createTransaction(
        userId: event.userId,
        amount: event.amount,
        category: category.isNotEmpty ? category : 'Other',
        description: event.description,
        date: event.date,
        paymentMethod: event.paymentMethod,
        notes: event.notes,
      );

      result.fold(
        (error) {
          AppLogger.error('Failed to create transaction: $error');
          emit(TransactionState.error(message: error));
        },
        (transaction) {
          AppLogger.info('Transaction created: ${transaction.id}');
          emit(const TransactionState.success(message: 'Transaction added successfully'));
          add(LoadTransactions(userId: event.userId));
        },
      );
    } catch (e) {
      AppLogger.error('Create transaction error', error: e);
      emit(const TransactionState.error(message: 'An unexpected error occurred'));
    }
  }

  Future<void> _onUpdateTransaction(
    UpdateTransaction event,
    Emitter<TransactionState> emit,
  ) async {
    try {
      emit(const TransactionState.loading());

      final transaction = Transaction(
        id: event.id,
        userId: event.userId,
        amount: event.amount,
        category: event.category,
        description: event.description,
        date: event.date,
        paymentMethod: event.paymentMethod,
        notes: event.notes,
        createdAt: event.createdAt,
      );

      final result = await _transactionRepository.updateTransaction(
        transaction: transaction,
      );

      result.fold(
        (error) {
          AppLogger.error('Failed to update transaction: $error');
          emit(TransactionState.error(message: error));
        },
        (updatedTransaction) {
          AppLogger.info('Transaction updated: ${updatedTransaction.id}');
          emit(const TransactionState.success(message: 'Transaction updated successfully'));
          add(LoadTransactions(userId: event.userId));
        },
      );
    } catch (e) {
      AppLogger.error('Update transaction error', error: e);
      emit(const TransactionState.error(message: 'An unexpected error occurred'));
    }
  }

  Future<void> _onDeleteTransaction(
    DeleteTransaction event,
    Emitter<TransactionState> emit,
  ) async {
    try {
      emit(const TransactionState.loading());

      final result = await _transactionRepository.deleteTransaction(
        userId: event.userId,
        transactionId: event.transactionId,
      );

      result.fold(
        (error) {
          AppLogger.error('Failed to delete transaction: $error');
          emit(TransactionState.error(message: error));
        },
        (_) {
          AppLogger.info('Transaction deleted: ${event.transactionId}');
          emit(const TransactionState.success(message: 'Transaction deleted successfully'));
          add(LoadTransactions(userId: event.userId));
        },
      );
    } catch (e) {
      AppLogger.error('Delete transaction error', error: e);
      emit(const TransactionState.error(message: 'An unexpected error occurred'));
    }
  }

  Future<void> _onSearchTransactions(
    SearchTransactions event,
    Emitter<TransactionState> emit,
  ) async {
    try {
      emit(const TransactionState.loading());

      final result = await _transactionRepository.searchTransactions(
        query: event.query,
      );

      result.fold(
        (error) {
          AppLogger.error('Failed to search transactions: $error');
          emit(TransactionState.error(message: error));
        },
        (transactions) {
          emit(TransactionState.loaded(transactions: transactions));
        },
      );
    } catch (e) {
      AppLogger.error('Search transactions error', error: e);
      emit(const TransactionState.error(message: 'An unexpected error occurred'));
    }
  }

  Future<void> _onFilterByCategory(
    FilterByCategory event,
    Emitter<TransactionState> emit,
  ) async {
    try {
      emit(const TransactionState.loading());

      final result = await _transactionRepository.getTransactionsByCategory(
        userId: event.userId,
        category: event.category,
      );

      result.fold(
        (error) {
          AppLogger.error('Failed to filter transactions: $error');
          emit(TransactionState.error(message: error));
        },
        (transactions) {
          emit(TransactionState.loaded(transactions: transactions));
        },
      );
    } catch (e) {
      AppLogger.error('Filter transactions error', error: e);
      emit(const TransactionState.error(message: 'An unexpected error occurred'));
    }
  }

  Future<void> _onSyncTransactions(
    SyncTransactions event,
    Emitter<TransactionState> emit,
  ) async {
    try {
      final result = await _transactionRepository.syncAllTransactions(event.userId);

      result.fold(
        (error) => AppLogger.warning('Sync failed: $error'),
        (_) {
          AppLogger.info('Transactions synced successfully');
          add(LoadTransactions(userId: event.userId));
        },
      );
    } catch (e) {
      AppLogger.error('Sync transactions error', error: e);
    }
  }
}
