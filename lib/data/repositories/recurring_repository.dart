import 'package:dartz/dartz.dart';
import 'package:uuid/uuid.dart';
import '../services/firebase_service.dart';
import '../services/hive_service.dart';
import '../models/recurring_transaction.dart';
import '../models/transaction.dart' as models;
import '../../core/utils/app_logger.dart';
import '../../core/constants/app_constants.dart';
import 'transaction_repository.dart';

class RecurringRepository {
  final FirebaseService _firebaseService;
  final HiveService _hiveService;
  final TransactionRepository _transactionRepository;
  final Uuid _uuid;

  RecurringRepository({
    required FirebaseService firebaseService,
    required HiveService hiveService,
    required TransactionRepository transactionRepository,
    Uuid? uuid,
  })  : _firebaseService = firebaseService,
        _hiveService = hiveService,
        _transactionRepository = transactionRepository,
        _uuid = uuid ?? const Uuid();

  Future<Either<String, RecurringTransaction>> createRecurringTransaction({
    required String userId,
    required double amount,
    required String category,
    required String description,
    required RecurringFrequency frequency,
    required DateTime nextDueDate,
    String? paymentMethod,
    String? notes,
  }) async {
    try {
      final recurringTransaction = RecurringTransaction(
        id: _uuid.v4(),
        userId: userId,
        amount: amount,
        category: category,
        description: description,
        frequency: frequency,
        nextDueDate: nextDueDate,
        isActive: true,
        paymentMethod: paymentMethod,
        notes: notes,
        createdAt: DateTime.now(),
      );

      await _hiveService.saveRecurringTransaction(recurringTransaction);

      final result = await _firebaseService.saveRecurringTransaction(recurringTransaction);

      return result.fold(
        (error) {
          AppLogger.warning('Recurring transaction saved locally but failed to sync: $error');
          return Right(recurringTransaction);
        },
        (_) {
          AppLogger.info('Recurring transaction created and synced: ${recurringTransaction.id}');
          return Right(recurringTransaction);
        },
      );
    } catch (e, stackTrace) {
      AppLogger.error('Failed to create recurring transaction', error: e, stackTrace: stackTrace);
      return Left('Failed to create recurring transaction: ${e.toString()}');
    }
  }

  Future<Either<String, RecurringTransaction>> updateRecurringTransaction({
    required RecurringTransaction transaction,
  }) async {
    try {
      final updatedTransaction = transaction.copyWith(
        updatedAt: DateTime.now(),
      );

      await _hiveService.saveRecurringTransaction(updatedTransaction);

      final result = await _firebaseService.saveRecurringTransaction(updatedTransaction);

      return result.fold(
        (error) {
          AppLogger.warning('Recurring transaction updated locally but failed to sync: $error');
          return Right(updatedTransaction);
        },
        (_) {
          AppLogger.info('Recurring transaction updated and synced: ${updatedTransaction.id}');
          return Right(updatedTransaction);
        },
      );
    } catch (e, stackTrace) {
      AppLogger.error('Failed to update recurring transaction', error: e, stackTrace: stackTrace);
      return Left('Failed to update recurring transaction: ${e.toString()}');
    }
  }

  Future<Either<String, RecurringTransaction>> toggleActiveStatus({
    required RecurringTransaction transaction,
  }) async {
    try {
      final updated = transaction.copyWith(
        isActive: !transaction.isActive,
        updatedAt: DateTime.now(),
      );

      return await updateRecurringTransaction(transaction: updated);
    } catch (e, stackTrace) {
      AppLogger.error('Failed to toggle recurring transaction status', error: e, stackTrace: stackTrace);
      return Left('Failed to toggle status: ${e.toString()}');
    }
  }

  Future<Either<String, void>> deleteRecurringTransaction({
    required String userId,
    required String transactionId,
  }) async {
    try {
      await _hiveService.deleteRecurringTransaction(transactionId);

      final result = await _firebaseService.deleteRecurringTransaction(userId, transactionId);

      return result.fold(
        (error) {
          AppLogger.warning('Recurring transaction deleted locally but failed to sync: $error');
          return const Right(null);
        },
        (_) {
          AppLogger.info('Recurring transaction deleted and synced: $transactionId');
          return const Right(null);
        },
      );
    } catch (e, stackTrace) {
      AppLogger.error('Failed to delete recurring transaction', error: e, stackTrace: stackTrace);
      return Left('Failed to delete recurring transaction: ${e.toString()}');
    }
  }

  Future<Either<String, List<RecurringTransaction>>> getAllRecurringTransactions({
    required String userId,
  }) async {
    try {
      final localTransactions = await _hiveService.getAllRecurringTransactions();

      // Sync from Firestore in the background
      _syncRecurringTransactionsFromFirestore(userId);

      return Right(localTransactions);
    } catch (e, stackTrace) {
      AppLogger.error('Failed to get all recurring transactions', error: e, stackTrace: stackTrace);
      return Left('Failed to get recurring transactions: ${e.toString()}');
    }
  }

  Future<Either<String, List<RecurringTransaction>>> getActiveRecurringTransactions({
    required String userId,
  }) async {
    try {
      final result = await getAllRecurringTransactions(userId: userId);

      return result.fold(
        (error) => Left(error),
        (transactions) {
          final active = transactions.where((t) => t.isActive).toList();
          return Right(active);
        },
      );
    } catch (e, stackTrace) {
      AppLogger.error('Failed to get active recurring transactions', error: e, stackTrace: stackTrace);
      return Left('Failed to get recurring transactions: ${e.toString()}');
    }
  }

  Future<Either<String, List<RecurringTransaction>>> getDueRecurringTransactions({
    required String userId,
  }) async {
    try {
      final result = await getActiveRecurringTransactions(userId: userId);

      return result.fold(
        (error) => Left(error),
        (transactions) {
          final now = DateTime.now();
          final due = transactions.where((t) {
            return t.nextDueDate.isBefore(now) ||
                   t.nextDueDate.day == now.day &&
                   t.nextDueDate.month == now.month &&
                   t.nextDueDate.year == now.year;
          }).toList();
          return Right(due);
        },
      );
    } catch (e, stackTrace) {
      AppLogger.error('Failed to get due recurring transactions', error: e, stackTrace: stackTrace);
      return Left('Failed to get recurring transactions: ${e.toString()}');
    }
  }

  Future<Either<String, double>> getTotalMonthlyRecurringCost({
    required String userId,
  }) async {
    try {
      final result = await getActiveRecurringTransactions(userId: userId);

      return result.fold(
        (error) => Left(error),
        (transactions) {
          final total = transactions.fold<double>(
            0.0,
            (sum, transaction) => sum + transaction.getMonthlyCost(),
          );
          return Right(total);
        },
      );
    } catch (e, stackTrace) {
      AppLogger.error('Failed to calculate monthly recurring cost', error: e, stackTrace: stackTrace);
      return Left('Failed to calculate cost: ${e.toString()}');
    }
  }

  Future<Either<String, double>> getTotalAnnualRecurringCost({
    required String userId,
  }) async {
    try {
      final result = await getActiveRecurringTransactions(userId: userId);

      return result.fold(
        (error) => Left(error),
        (transactions) {
          final total = transactions.fold<double>(
            0.0,
            (sum, transaction) => sum + transaction.getAnnualCost(),
          );
          return Right(total);
        },
      );
    } catch (e, stackTrace) {
      AppLogger.error('Failed to calculate annual recurring cost', error: e, stackTrace: stackTrace);
      return Left('Failed to calculate cost: ${e.toString()}');
    }
  }

  Future<Either<String, void>> processRecurringTransactions({
    required String userId,
  }) async {
    try {
      final dueResult = await getDueRecurringTransactions(userId: userId);

      return dueResult.fold(
        (error) => Left(error),
        (dueTransactions) async {
          for (final recurring in dueTransactions) {
            // Create actual transaction
            await _transactionRepository.createTransaction(
              userId: userId,
              amount: recurring.amount,
              category: recurring.category,
              description: recurring.description,
              date: recurring.nextDueDate,
              paymentMethod: recurring.paymentMethod ?? 'Auto',
              isRecurring: true,
              recurringId: recurring.id,
              notes: recurring.notes,
            );

            // Update next due date
            final nextDueDate = recurring.getNextDueDate();
            final updated = recurring.copyWith(
              nextDueDate: nextDueDate,
              updatedAt: DateTime.now(),
            );

            await updateRecurringTransaction(transaction: updated);

            AppLogger.info('Processed recurring transaction: ${recurring.description}');
          }

          return const Right(null);
        },
      );
    } catch (e, stackTrace) {
      AppLogger.error('Failed to process recurring transactions', error: e, stackTrace: stackTrace);
      return Left('Failed to process recurring transactions: ${e.toString()}');
    }
  }

  Future<Either<String, List<RecurringTransaction>>> detectRecurringTransactions({
    required String userId,
  }) async {
    try {
      final now = DateTime.now();
      final startDate = DateTime(now.year, now.month - AppConstants.recurringDetectionMonths, 1);

      final transactionsResult = await _transactionRepository.getTransactionsByDateRange(
        userId: userId,
        startDate: startDate,
        endDate: now,
      );

      return transactionsResult.fold(
        (error) => Left(error),
        (transactions) {
          final detected = <RecurringTransaction>[];
          final grouped = <String, List<models.Transaction>>{};

          // Group transactions by category and similar amount
          for (final transaction in transactions) {
            final key = '${transaction.category}_${(transaction.amount / 100).round() * 100}';
            grouped[key] = [...(grouped[key] ?? []), transaction];
          }

          // Detect patterns
          for (final group in grouped.values) {
            if (group.length >= 3) {
              // Check if dates are consistent
              final sortedByDate = group..sort((a, b) => a.date.compareTo(b.date));

              bool isPotentiallyRecurring = true;
              int? daysBetween;

              for (int i = 1; i < sortedByDate.length; i++) {
                final diff = sortedByDate[i].date.difference(sortedByDate[i - 1].date).inDays;

                if (daysBetween == null) {
                  daysBetween = diff;
                } else {
                  // Check if difference is within tolerance
                  if ((diff - daysBetween).abs() > AppConstants.recurringDateTolerance) {
                    isPotentiallyRecurring = false;
                    break;
                  }
                }
              }

              if (isPotentiallyRecurring && daysBetween != null) {
                final frequency = _determineFrequency(daysBetween);
                final latest = sortedByDate.last;

                final recurring = RecurringTransaction(
                  id: _uuid.v4(),
                  userId: userId,
                  amount: latest.amount,
                  category: latest.category,
                  description: latest.description,
                  frequency: frequency,
                  nextDueDate: latest.date.add(Duration(days: daysBetween)),
                  isActive: false, // User needs to confirm
                  paymentMethod: latest.paymentMethod,
                  notes: 'Auto-detected recurring pattern',
                  createdAt: DateTime.now(),
                );

                detected.add(recurring);
                AppLogger.info('Detected recurring pattern: ${recurring.description}');
              }
            }
          }

          return Right(detected);
        },
      );
    } catch (e, stackTrace) {
      AppLogger.error('Failed to detect recurring transactions', error: e, stackTrace: stackTrace);
      return Left('Failed to detect recurring transactions: ${e.toString()}');
    }
  }

  RecurringFrequency _determineFrequency(int daysBetween) {
    if (daysBetween <= 2) {
      return RecurringFrequency.daily;
    } else if (daysBetween >= 5 && daysBetween <= 9) {
      return RecurringFrequency.weekly;
    } else if (daysBetween >= 12 && daysBetween <= 16) {
      return RecurringFrequency.biweekly;
    } else if (daysBetween >= 28 && daysBetween <= 32) {
      return RecurringFrequency.monthly;
    } else if (daysBetween >= 88 && daysBetween <= 95) {
      return RecurringFrequency.quarterly;
    } else if (daysBetween >= 360 && daysBetween <= 370) {
      return RecurringFrequency.yearly;
    } else {
      return RecurringFrequency.monthly; // Default
    }
  }

  Future<void> _syncRecurringTransactionsFromFirestore(String userId) async {
    try {
      final result = await _firebaseService.getRecurringTransactions(userId);

      result.fold(
        (error) => AppLogger.warning('Failed to sync recurring transactions from Firestore: $error'),
        (transactions) async {
          await _hiveService.saveRecurringTransactions(transactions);
          AppLogger.info('Synced ${transactions.length} recurring transactions from Firestore');
        },
      );
    } catch (e) {
      AppLogger.warning('Background recurring transaction sync failed: $e');
    }
  }

  Future<Either<String, void>> syncAllRecurringTransactions(String userId) async {
    try {
      final result = await _firebaseService.getRecurringTransactions(userId);

      return result.fold(
        (error) => Left(error),
        (transactions) async {
          await _hiveService.saveRecurringTransactions(transactions);
          AppLogger.info('Successfully synced all recurring transactions');
          return const Right(null);
        },
      );
    } catch (e, stackTrace) {
      AppLogger.error('Failed to sync recurring transactions', error: e, stackTrace: stackTrace);
      return Left('Failed to sync: ${e.toString()}');
    }
  }
}
