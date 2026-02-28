import 'package:dartz/dartz.dart';
import 'package:uuid/uuid.dart';
import '../services/firebase_service.dart';
import '../services/hive_service.dart';
import '../models/budget.dart';
import '../../core/utils/app_logger.dart';
import '../../core/extensions/date_extensions.dart';
import '../../services/subscription_service.dart';
import 'transaction_repository.dart';

class BudgetRepository {
  final FirebaseService _firebaseService;
  final HiveService _hiveService;
  final TransactionRepository _transactionRepository;
  final SubscriptionService _subscriptionService;
  final Uuid _uuid;

  BudgetRepository({
    required FirebaseService firebaseService,
    required HiveService hiveService,
    required TransactionRepository transactionRepository,
    required SubscriptionService subscriptionService,
    Uuid? uuid,
  }) : _firebaseService = firebaseService,
       _hiveService = hiveService,
       _transactionRepository = transactionRepository,
       _subscriptionService = subscriptionService,
       _uuid = uuid ?? const Uuid();

  Future<Either<String, Budget>> createBudget({
    required String userId,
    required String category,
    required double limit,
    required DateTime month,
  }) async {
    try {
      final monthKey = month.monthYearKey;

      final budget = Budget(
        id: _uuid.v4(),
        userId: userId,
        category: category,
        limit: limit,
        month: monthKey,
        spent: 0.0,
        createdAt: DateTime.now(),
      );

      // Calculate current spending for this category/month
      final updatedBudget = await _updateBudgetSpent(budget, userId);

      await _hiveService.saveBudget(updatedBudget);
      if (!_subscriptionService.canUseCloudSync()) {
        return Right(updatedBudget);
      }

      final result = await _firebaseService.saveBudget(updatedBudget);

      return result.fold(
        (error) {
          AppLogger.warning('Budget saved locally but failed to sync: $error');
          return Right(updatedBudget);
        },
        (_) {
          AppLogger.info(
            'Budget created and synced: ${updatedBudget.category}',
          );
          return Right(updatedBudget);
        },
      );
    } catch (e, stackTrace) {
      AppLogger.error(
        'Failed to create budget',
        error: e,
        stackTrace: stackTrace,
      );
      return Left('Failed to create budget: ${e.toString()}');
    }
  }

  Future<Either<String, Budget>> updateBudget({required Budget budget}) async {
    try {
      final updatedBudget = budget.copyWith(updatedAt: DateTime.now());

      await _hiveService.saveBudget(updatedBudget);
      if (!_subscriptionService.canUseCloudSync()) {
        return Right(updatedBudget);
      }

      final result = await _firebaseService.saveBudget(updatedBudget);

      return result.fold(
        (error) {
          AppLogger.warning(
            'Budget updated locally but failed to sync: $error',
          );
          return Right(updatedBudget);
        },
        (_) {
          AppLogger.info(
            'Budget updated and synced: ${updatedBudget.category}',
          );
          return Right(updatedBudget);
        },
      );
    } catch (e, stackTrace) {
      AppLogger.error(
        'Failed to update budget',
        error: e,
        stackTrace: stackTrace,
      );
      return Left('Failed to update budget: ${e.toString()}');
    }
  }

  Future<Either<String, void>> deleteBudget({
    required String userId,
    required String budgetId,
  }) async {
    try {
      await _hiveService.deleteBudget(budgetId);
      if (!_subscriptionService.canUseCloudSync()) {
        return const Right(null);
      }

      final result = await _firebaseService.deleteBudget(userId, budgetId);

      return result.fold(
        (error) {
          AppLogger.warning(
            'Budget deleted locally but failed to sync: $error',
          );
          return const Right(null);
        },
        (_) {
          AppLogger.info('Budget deleted and synced: $budgetId');
          return const Right(null);
        },
      );
    } catch (e, stackTrace) {
      AppLogger.error(
        'Failed to delete budget',
        error: e,
        stackTrace: stackTrace,
      );
      return Left('Failed to delete budget: ${e.toString()}');
    }
  }

  Future<Either<String, List<Budget>>> getAllBudgets({
    required String userId,
  }) async {
    try {
      final localBudgets = await _hiveService.getAllBudgets();

      // Update spent amounts
      final updatedBudgets = <Budget>[];
      for (final budget in localBudgets) {
        final updated = await _updateBudgetSpent(budget, userId);
        updatedBudgets.add(updated);
      }

      // Save updated budgets
      await _hiveService.saveBudgets(updatedBudgets);

      // Sync from Firestore in the background for paid tiers
      if (_subscriptionService.canUseCloudSync()) {
        _syncBudgetsFromFirestore(userId);
      }

      return Right(updatedBudgets);
    } catch (e, stackTrace) {
      AppLogger.error(
        'Failed to get all budgets',
        error: e,
        stackTrace: stackTrace,
      );
      return Left('Failed to get budgets: ${e.toString()}');
    }
  }

  Future<Either<String, List<Budget>>> getBudgetsForMonth({
    required String userId,
    required DateTime month,
  }) async {
    try {
      final result = await getAllBudgets(userId: userId);

      return result.fold((error) => Left(error), (budgets) {
        final monthKey = month.monthYearKey;
        final filteredBudgets = budgets
            .where((budget) => budget.month == monthKey)
            .toList();
        return Right(filteredBudgets);
      });
    } catch (e, stackTrace) {
      AppLogger.error(
        'Failed to get budgets for month',
        error: e,
        stackTrace: stackTrace,
      );
      return Left('Failed to get budgets: ${e.toString()}');
    }
  }

  Future<Either<String, Budget?>> getBudgetForCategoryAndMonth({
    required String userId,
    required String category,
    required DateTime month,
  }) async {
    try {
      final result = await getBudgetsForMonth(userId: userId, month: month);

      return result.fold((error) => Left(error), (budgets) {
        final budget = budgets.firstWhere(
          (b) => b.category == category,
          orElse: () => Budget(
            id: '',
            userId: '',
            category: '',
            limit: 0,
            month: '',
            createdAt: DateTime.now(),
          ),
        );

        if (budget.id.isEmpty) {
          return const Right(null);
        }

        return Right(budget);
      });
    } catch (e, stackTrace) {
      AppLogger.error(
        'Failed to get budget for category',
        error: e,
        stackTrace: stackTrace,
      );
      return Left('Failed to get budget: ${e.toString()}');
    }
  }

  Future<Either<String, List<Budget>>> getExceededBudgets({
    required String userId,
    required DateTime month,
  }) async {
    try {
      final result = await getBudgetsForMonth(userId: userId, month: month);

      return result.fold((error) => Left(error), (budgets) {
        final exceeded = budgets.where((budget) => budget.isExceeded).toList();
        return Right(exceeded);
      });
    } catch (e, stackTrace) {
      AppLogger.error(
        'Failed to get exceeded budgets',
        error: e,
        stackTrace: stackTrace,
      );
      return Left('Failed to get budgets: ${e.toString()}');
    }
  }

  Future<Either<String, List<Budget>>> getWarningBudgets({
    required String userId,
    required DateTime month,
  }) async {
    try {
      final result = await getBudgetsForMonth(userId: userId, month: month);

      return result.fold((error) => Left(error), (budgets) {
        final warning = budgets
            .where((budget) => budget.isWarning && !budget.isExceeded)
            .toList();
        return Right(warning);
      });
    } catch (e, stackTrace) {
      AppLogger.error(
        'Failed to get warning budgets',
        error: e,
        stackTrace: stackTrace,
      );
      return Left('Failed to get budgets: ${e.toString()}');
    }
  }

  Future<Budget> _updateBudgetSpent(Budget budget, String userId) async {
    try {
      // Parse month from budget (format: YYYY-MM)
      final parts = budget.month.split('-');
      final year = int.parse(parts[0]);
      final month = int.parse(parts[1]);
      final monthDate = DateTime(year, month, 1);

      // Get category-wise spending for the month
      final spendingResult = await _transactionRepository
          .getCategoryWiseSpending(userId: userId, month: monthDate);

      return spendingResult.fold((error) => budget, (categoryTotals) {
        final spent = categoryTotals[budget.category] ?? 0.0;
        return budget.copyWith(spent: spent);
      });
    } catch (e) {
      AppLogger.warning('Failed to update budget spent amount: $e');
      return budget;
    }
  }

  Future<void> _syncBudgetsFromFirestore(String userId) async {
    try {
      final result = await _firebaseService.getBudgets(userId);

      result.fold(
        (error) =>
            AppLogger.warning('Failed to sync budgets from Firestore: $error'),
        (budgets) async {
          await _hiveService.saveBudgets(budgets);
          AppLogger.info('Synced ${budgets.length} budgets from Firestore');
        },
      );
    } catch (e) {
      AppLogger.warning('Background budget sync failed: $e');
    }
  }

  Future<Either<String, void>> syncAllBudgets(String userId) async {
    try {
      if (!_subscriptionService.canUseCloudSync()) {
        return const Right(null);
      }
      final result = await _firebaseService.getBudgets(userId);

      return result.fold((error) => Left(error), (budgets) async {
        await _hiveService.saveBudgets(budgets);
        AppLogger.info('Successfully synced all budgets');
        return const Right(null);
      });
    } catch (e, stackTrace) {
      AppLogger.error(
        'Failed to sync budgets',
        error: e,
        stackTrace: stackTrace,
      );
      return Left('Failed to sync: ${e.toString()}');
    }
  }

  Future<Either<String, void>> updateAllBudgetsSpent(String userId) async {
    try {
      final budgets = await _hiveService.getAllBudgets();
      final updatedBudgets = <Budget>[];

      for (final budget in budgets) {
        final updated = await _updateBudgetSpent(budget, userId);
        updatedBudgets.add(updated);
      }

      await _hiveService.saveBudgets(updatedBudgets);

      // Sync to Firestore for paid tiers
      if (_subscriptionService.canUseCloudSync()) {
        for (final budget in updatedBudgets) {
          await _firebaseService.saveBudget(budget);
        }
      }

      AppLogger.info('All budgets updated with current spending');
      return const Right(null);
    } catch (e, stackTrace) {
      AppLogger.error(
        'Failed to update budgets spent',
        error: e,
        stackTrace: stackTrace,
      );
      return Left('Failed to update budgets: ${e.toString()}');
    }
  }
}
