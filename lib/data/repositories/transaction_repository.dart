import 'package:dartz/dartz.dart';
import 'package:uuid/uuid.dart';
import '../services/firebase_service.dart';
import '../services/hive_service.dart';
import '../models/transaction.dart' as models;
import '../../core/utils/app_logger.dart';
import '../../core/extensions/date_extensions.dart';
import '../../services/subscription_service.dart';

class TransactionRepository {
  final FirebaseService _firebaseService;
  final HiveService _hiveService;
  final SubscriptionService _subscriptionService;
  final Uuid _uuid;

  TransactionRepository({
    required FirebaseService firebaseService,
    required HiveService hiveService,
    required SubscriptionService subscriptionService,
    Uuid? uuid,
  }) : _firebaseService = firebaseService,
       _hiveService = hiveService,
       _subscriptionService = subscriptionService,
       _uuid = uuid ?? const Uuid();

  Future<Either<String, models.Transaction>> createTransaction({
    required String userId,
    required double amount,
    required String category,
    required String description,
    required DateTime date,
    required String paymentMethod,
    bool isRecurring = false,
    String? recurringId,
    String? notes,
  }) async {
    try {
      final transaction = models.Transaction(
        id: _uuid.v4(),
        userId: userId,
        amount: amount,
        category: category,
        description: description,
        date: date,
        paymentMethod: paymentMethod,
        isRecurring: isRecurring,
        recurringId: recurringId,
        notes: notes,
        createdAt: DateTime.now(),
      );

      // Save to local storage first
      await _hiveService.saveTransaction(transaction);

      if (!_subscriptionService.canUseCloudSync()) {
        return Right(transaction);
      }

      // Then sync to Firestore for paid tiers
      final result = await _firebaseService.saveTransaction(transaction);

      return result.fold(
        (error) {
          AppLogger.warning(
            'Transaction saved locally but failed to sync: $error',
          );
          return Right(transaction);
        },
        (_) {
          AppLogger.info('Transaction created and synced: ${transaction.id}');
          return Right(transaction);
        },
      );
    } catch (e, stackTrace) {
      AppLogger.error(
        'Failed to create transaction',
        error: e,
        stackTrace: stackTrace,
      );
      return Left('Failed to create transaction: ${e.toString()}');
    }
  }

  Future<Either<String, models.Transaction>> updateTransaction({
    required models.Transaction transaction,
  }) async {
    try {
      final updatedTransaction = transaction.copyWith(
        updatedAt: DateTime.now(),
      );

      await _hiveService.saveTransaction(updatedTransaction);
      if (!_subscriptionService.canUseCloudSync()) {
        return Right(updatedTransaction);
      }

      final result = await _firebaseService.saveTransaction(updatedTransaction);

      return result.fold(
        (error) {
          AppLogger.warning(
            'Transaction updated locally but failed to sync: $error',
          );
          return Right(updatedTransaction);
        },
        (_) {
          AppLogger.info(
            'Transaction updated and synced: ${updatedTransaction.id}',
          );
          return Right(updatedTransaction);
        },
      );
    } catch (e, stackTrace) {
      AppLogger.error(
        'Failed to update transaction',
        error: e,
        stackTrace: stackTrace,
      );
      return Left('Failed to update transaction: ${e.toString()}');
    }
  }

  Future<Either<String, void>> deleteTransaction({
    required String userId,
    required String transactionId,
  }) async {
    try {
      await _hiveService.deleteTransaction(transactionId);
      if (!_subscriptionService.canUseCloudSync()) {
        return const Right(null);
      }

      final result = await _firebaseService.deleteTransaction(
        userId,
        transactionId,
      );

      return result.fold(
        (error) {
          AppLogger.warning(
            'Transaction deleted locally but failed to sync: $error',
          );
          return const Right(null);
        },
        (_) {
          AppLogger.info('Transaction deleted and synced: $transactionId');
          return const Right(null);
        },
      );
    } catch (e, stackTrace) {
      AppLogger.error(
        'Failed to delete transaction',
        error: e,
        stackTrace: stackTrace,
      );
      return Left('Failed to delete transaction: ${e.toString()}');
    }
  }

  Future<Either<String, List<models.Transaction>>> getAllTransactions({
    required String userId,
  }) async {
    try {
      // Try to load from local storage first
      final localTransactions = _applyHistoryLimit(
        await _hiveService.getAllTransactions(),
      );

      // Sync from Firestore in the background
      _syncTransactionsFromFirestore(userId);

      return Right(localTransactions);
    } catch (e, stackTrace) {
      AppLogger.error(
        'Failed to get all transactions',
        error: e,
        stackTrace: stackTrace,
      );
      return Left('Failed to get transactions: ${e.toString()}');
    }
  }

  Future<Either<String, List<models.Transaction>>> getTransactionsByDateRange({
    required String userId,
    required DateTime startDate,
    required DateTime endDate,
  }) async {
    try {
      final allTransactions = _applyHistoryLimit(
        await _hiveService.getAllTransactions(),
      );

      final filtered = allTransactions.where((transaction) {
        return transaction.date.isAfter(
              startDate.subtract(const Duration(days: 1)),
            ) &&
            transaction.date.isBefore(endDate.add(const Duration(days: 1)));
      }).toList();

      filtered.sort((a, b) => b.date.compareTo(a.date));

      return Right(filtered);
    } catch (e, stackTrace) {
      AppLogger.error(
        'Failed to get transactions by date range',
        error: e,
        stackTrace: stackTrace,
      );
      return Left('Failed to get transactions: ${e.toString()}');
    }
  }

  Future<Either<String, List<models.Transaction>>> getTransactionsByCategory({
    required String userId,
    required String category,
  }) async {
    try {
      final allTransactions = _applyHistoryLimit(
        await _hiveService.getAllTransactions(),
      );

      final filtered = allTransactions
          .where((transaction) => transaction.category == category)
          .toList();

      filtered.sort((a, b) => b.date.compareTo(a.date));

      return Right(filtered);
    } catch (e, stackTrace) {
      AppLogger.error(
        'Failed to get transactions by category',
        error: e,
        stackTrace: stackTrace,
      );
      return Left('Failed to get transactions: ${e.toString()}');
    }
  }

  Future<Either<String, List<models.Transaction>>> getTransactionsForMonth({
    required String userId,
    required DateTime month,
  }) async {
    try {
      final startOfMonth = month.startOfMonth;
      final endOfMonth = month.endOfMonth;

      return await getTransactionsByDateRange(
        userId: userId,
        startDate: startOfMonth,
        endDate: endOfMonth,
      );
    } catch (e, stackTrace) {
      AppLogger.error(
        'Failed to get transactions for month',
        error: e,
        stackTrace: stackTrace,
      );
      return Left('Failed to get transactions: ${e.toString()}');
    }
  }

  Future<Either<String, double>> getTotalSpentForMonth({
    required String userId,
    required DateTime month,
  }) async {
    try {
      final result = await getTransactionsForMonth(
        userId: userId,
        month: month,
      );

      return result.fold((error) => Left(error), (transactions) {
        final total = transactions.fold<double>(
          0.0,
          (sum, transaction) => sum + transaction.amount,
        );
        return Right(total);
      });
    } catch (e, stackTrace) {
      AppLogger.error(
        'Failed to calculate total spent',
        error: e,
        stackTrace: stackTrace,
      );
      return Left('Failed to calculate total: ${e.toString()}');
    }
  }

  Future<Either<String, Map<String, double>>> getCategoryWiseSpending({
    required String userId,
    required DateTime month,
  }) async {
    try {
      final result = await getTransactionsForMonth(
        userId: userId,
        month: month,
      );

      return result.fold((error) => Left(error), (transactions) {
        final categoryTotals = <String, double>{};

        for (final transaction in transactions) {
          categoryTotals[transaction.category] =
              (categoryTotals[transaction.category] ?? 0.0) +
              transaction.amount;
        }

        return Right(categoryTotals);
      });
    } catch (e, stackTrace) {
      AppLogger.error(
        'Failed to calculate category-wise spending',
        error: e,
        stackTrace: stackTrace,
      );
      return Left('Failed to calculate spending: ${e.toString()}');
    }
  }

  Future<Either<String, List<models.Transaction>>> searchTransactions({
    required String query,
  }) async {
    try {
      final allTransactions = _applyHistoryLimit(
        await _hiveService.getAllTransactions(),
      );

      final filtered = allTransactions.where((transaction) {
        final lowerQuery = query.toLowerCase();
        return transaction.description.toLowerCase().contains(lowerQuery) ||
            transaction.category.toLowerCase().contains(lowerQuery) ||
            transaction.paymentMethod.toLowerCase().contains(lowerQuery) ||
            (transaction.notes?.toLowerCase().contains(lowerQuery) ?? false);
      }).toList();

      filtered.sort((a, b) => b.date.compareTo(a.date));

      return Right(filtered);
    } catch (e, stackTrace) {
      AppLogger.error(
        'Failed to search transactions',
        error: e,
        stackTrace: stackTrace,
      );
      return Left('Failed to search transactions: ${e.toString()}');
    }
  }

  Future<void> _syncTransactionsFromFirestore(String userId) async {
    try {
      if (!_subscriptionService.canUseCloudSync()) {
        return;
      }
      final result = await _firebaseService.getTransactions(userId);

      result.fold(
        (error) => AppLogger.warning(
          'Failed to sync transactions from Firestore: $error',
        ),
        (transactions) async {
          await _hiveService.saveTransactions(transactions);
          AppLogger.info(
            'Synced ${transactions.length} transactions from Firestore',
          );
        },
      );
    } catch (e) {
      AppLogger.warning('Background sync failed: $e');
    }
  }

  Future<Either<String, void>> syncAllTransactions(String userId) async {
    try {
      if (!_subscriptionService.canUseCloudSync()) {
        return const Right(null);
      }
      final result = await _firebaseService.getTransactions(userId);

      return result.fold((error) => Left(error), (transactions) async {
        await _hiveService.saveTransactions(transactions);
        AppLogger.info('Successfully synced all transactions');
        return const Right(null);
      });
    } catch (e, stackTrace) {
      AppLogger.error(
        'Failed to sync transactions',
        error: e,
        stackTrace: stackTrace,
      );
      return Left('Failed to sync: ${e.toString()}');
    }
  }

  List<models.Transaction> _applyHistoryLimit(
    List<models.Transaction> transactions,
  ) {
    if (_subscriptionService.isOwner()) {
      return transactions;
    }

    final cutoff = DateTime.now().subtract(const Duration(days: 62));
    final shouldLimit = !_subscriptionService.canViewHistory(3);
    if (!shouldLimit) {
      return transactions;
    }

    return transactions
        .where((transaction) => transaction.date.isAfter(cutoff))
        .toList();
  }
}
