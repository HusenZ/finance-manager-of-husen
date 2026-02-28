import 'package:hive_flutter/hive_flutter.dart';
import '../models/transaction.dart';
import '../models/category.dart';
import '../models/budget.dart';
import '../models/user_profile.dart';
import '../models/recurring_transaction.dart';
import '../models/income.dart';
import '../../core/constants/app_constants.dart';
import '../../core/utils/app_logger.dart';

class HiveService {
  static final HiveService _instance = HiveService._internal();
  factory HiveService() => _instance;
  HiveService._internal();

  bool _isInitialized = false;

  Future<void> init() async {
    if (_isInitialized) {
      AppLogger.warning('HiveService already initialized');
      return;
    }

    try {
      await Hive.initFlutter();

      // Register adapters if they're not already registered
      if (!Hive.isAdapterRegistered(0)) {
        // Transaction adapter will be registered by generated code
      }

      _isInitialized = true;
      AppLogger.info('HiveService initialized successfully');
    } catch (e, stackTrace) {
      AppLogger.error(
        'Failed to initialize HiveService',
        error: e,
        stackTrace: stackTrace,
      );
      rethrow;
    }
  }

  Future<Box<T>> _openBox<T>(String boxName) async {
    try {
      if (Hive.isBoxOpen(boxName)) {
        return Hive.box<T>(boxName);
      }
      return await Hive.openBox<T>(boxName);
    } catch (e, stackTrace) {
      AppLogger.error(
        'Failed to open box: $boxName',
        error: e,
        stackTrace: stackTrace,
      );
      rethrow;
    }
  }

  // Transaction Operations
  Future<Box<Map>> getTransactionsBox() async {
    return await _openBox<Map>(AppConstants.transactionsBox);
  }

  Future<void> saveTransaction(Transaction transaction) async {
    try {
      final box = await getTransactionsBox();
      await box.put(transaction.id, transaction.toJson());
      AppLogger.debug('Transaction saved: ${transaction.id}');
    } catch (e, stackTrace) {
      AppLogger.error(
        'Failed to save transaction',
        error: e,
        stackTrace: stackTrace,
      );
      rethrow;
    }
  }

  Future<void> saveTransactions(List<Transaction> transactions) async {
    try {
      final box = await getTransactionsBox();
      final Map<String, Map<String, dynamic>> transactionsMap = {
        for (var transaction in transactions)
          transaction.id: transaction.toJson(),
      };
      await box.putAll(transactionsMap);
      AppLogger.debug('Saved ${transactions.length} transactions');
    } catch (e, stackTrace) {
      AppLogger.error(
        'Failed to save transactions',
        error: e,
        stackTrace: stackTrace,
      );
      rethrow;
    }
  }

  Future<Transaction?> getTransaction(String id) async {
    try {
      final box = await getTransactionsBox();
      final data = box.get(id);
      if (data == null) return null;
      return Transaction.fromJson(Map<String, dynamic>.from(data));
    } catch (e, stackTrace) {
      AppLogger.error(
        'Failed to get transaction: $id',
        error: e,
        stackTrace: stackTrace,
      );
      return null;
    }
  }

  Future<List<Transaction>> getAllTransactions() async {
    try {
      final box = await getTransactionsBox();
      return box.values
          .map((data) => Transaction.fromJson(Map<String, dynamic>.from(data)))
          .toList();
    } catch (e, stackTrace) {
      AppLogger.error(
        'Failed to get all transactions',
        error: e,
        stackTrace: stackTrace,
      );
      return [];
    }
  }

  Future<void> deleteTransaction(String id) async {
    try {
      final box = await getTransactionsBox();
      await box.delete(id);
      AppLogger.debug('Transaction deleted: $id');
    } catch (e, stackTrace) {
      AppLogger.error(
        'Failed to delete transaction: $id',
        error: e,
        stackTrace: stackTrace,
      );
      rethrow;
    }
  }

  // Category Operations
  Future<Box<Map>> getCategoriesBox() async {
    return await _openBox<Map>(AppConstants.categoriesBox);
  }

  Future<void> saveCategory(Category category) async {
    try {
      final box = await getCategoriesBox();
      await box.put(category.id, category.toJson());
      AppLogger.debug('Category saved: ${category.name}');
    } catch (e, stackTrace) {
      AppLogger.error(
        'Failed to save category',
        error: e,
        stackTrace: stackTrace,
      );
      rethrow;
    }
  }

  Future<void> saveCategories(List<Category> categories) async {
    try {
      final box = await getCategoriesBox();
      final Map<String, Map<String, dynamic>> categoriesMap = {
        for (var category in categories) category.id: category.toJson(),
      };
      await box.putAll(categoriesMap);
      AppLogger.debug('Saved ${categories.length} categories');
    } catch (e, stackTrace) {
      AppLogger.error(
        'Failed to save categories',
        error: e,
        stackTrace: stackTrace,
      );
      rethrow;
    }
  }

  Future<List<Category>> getAllCategories() async {
    try {
      final box = await getCategoriesBox();
      return box.values
          .map((data) => Category.fromJson(Map<String, dynamic>.from(data)))
          .toList();
    } catch (e, stackTrace) {
      AppLogger.error(
        'Failed to get all categories',
        error: e,
        stackTrace: stackTrace,
      );
      return [];
    }
  }

  Future<void> deleteCategory(String id) async {
    try {
      final box = await getCategoriesBox();
      await box.delete(id);
      AppLogger.debug('Category deleted: $id');
    } catch (e, stackTrace) {
      AppLogger.error(
        'Failed to delete category: $id',
        error: e,
        stackTrace: stackTrace,
      );
      rethrow;
    }
  }

  // Budget Operations
  Future<Box<Map>> getBudgetsBox() async {
    return await _openBox<Map>(AppConstants.budgetsBox);
  }

  Future<void> saveBudget(Budget budget) async {
    try {
      final box = await getBudgetsBox();
      await box.put(budget.id, budget.toJson());
      AppLogger.debug('Budget saved: ${budget.category}');
    } catch (e, stackTrace) {
      AppLogger.error(
        'Failed to save budget',
        error: e,
        stackTrace: stackTrace,
      );
      rethrow;
    }
  }

  Future<void> saveBudgets(List<Budget> budgets) async {
    try {
      final box = await getBudgetsBox();
      final Map<String, Map<String, dynamic>> budgetsMap = {
        for (var budget in budgets) budget.id: budget.toJson(),
      };
      await box.putAll(budgetsMap);
      AppLogger.debug('Saved ${budgets.length} budgets');
    } catch (e, stackTrace) {
      AppLogger.error(
        'Failed to save budgets',
        error: e,
        stackTrace: stackTrace,
      );
      rethrow;
    }
  }

  Future<List<Budget>> getAllBudgets() async {
    try {
      final box = await getBudgetsBox();
      return box.values
          .map((data) => Budget.fromJson(Map<String, dynamic>.from(data)))
          .toList();
    } catch (e, stackTrace) {
      AppLogger.error(
        'Failed to get all budgets',
        error: e,
        stackTrace: stackTrace,
      );
      return [];
    }
  }

  Future<void> deleteBudget(String id) async {
    try {
      final box = await getBudgetsBox();
      await box.delete(id);
      AppLogger.debug('Budget deleted: $id');
    } catch (e, stackTrace) {
      AppLogger.error(
        'Failed to delete budget: $id',
        error: e,
        stackTrace: stackTrace,
      );
      rethrow;
    }
  }

  // Recurring Transaction Operations
  Future<Box<Map>> getRecurringTransactionsBox() async {
    return await _openBox<Map>(AppConstants.recurringTransactionsBox);
  }

  Future<void> saveRecurringTransaction(
    RecurringTransaction recurringTransaction,
  ) async {
    try {
      final box = await getRecurringTransactionsBox();
      await box.put(recurringTransaction.id, recurringTransaction.toJson());
      AppLogger.debug(
        'Recurring transaction saved: ${recurringTransaction.id}',
      );
    } catch (e, stackTrace) {
      AppLogger.error(
        'Failed to save recurring transaction',
        error: e,
        stackTrace: stackTrace,
      );
      rethrow;
    }
  }

  Future<void> saveRecurringTransactions(
    List<RecurringTransaction> transactions,
  ) async {
    try {
      final box = await getRecurringTransactionsBox();
      final Map<String, Map<String, dynamic>> transactionsMap = {
        for (var transaction in transactions)
          transaction.id: transaction.toJson(),
      };
      await box.putAll(transactionsMap);
      AppLogger.debug('Saved ${transactions.length} recurring transactions');
    } catch (e, stackTrace) {
      AppLogger.error(
        'Failed to save recurring transactions',
        error: e,
        stackTrace: stackTrace,
      );
      rethrow;
    }
  }

  Future<List<RecurringTransaction>> getAllRecurringTransactions() async {
    try {
      final box = await getRecurringTransactionsBox();
      return box.values
          .map(
            (data) =>
                RecurringTransaction.fromJson(Map<String, dynamic>.from(data)),
          )
          .toList();
    } catch (e, stackTrace) {
      AppLogger.error(
        'Failed to get all recurring transactions',
        error: e,
        stackTrace: stackTrace,
      );
      return [];
    }
  }

  Future<void> deleteRecurringTransaction(String id) async {
    try {
      final box = await getRecurringTransactionsBox();
      await box.delete(id);
      AppLogger.debug('Recurring transaction deleted: $id');
    } catch (e, stackTrace) {
      AppLogger.error(
        'Failed to delete recurring transaction: $id',
        error: e,
        stackTrace: stackTrace,
      );
      rethrow;
    }
  }

  // Income Operations
  Future<Box<Map>> getIncomesBox() async {
    return await _openBox<Map>('incomes');
  }

  Future<void> saveIncome(Income income) async {
    try {
      final box = await getIncomesBox();
      await box.put(income.id, income.toJson());
      AppLogger.debug('Income saved: ${income.id}');
    } catch (e, stackTrace) {
      AppLogger.error(
        'Failed to save income',
        error: e,
        stackTrace: stackTrace,
      );
      rethrow;
    }
  }

  Future<void> saveIncomes(List<Income> incomes) async {
    try {
      final box = await getIncomesBox();
      final Map<String, Map<String, dynamic>> incomesMap = {
        for (var income in incomes) income.id: income.toJson(),
      };
      await box.putAll(incomesMap);
      AppLogger.debug('Saved ${incomes.length} incomes');
    } catch (e, stackTrace) {
      AppLogger.error(
        'Failed to save incomes',
        error: e,
        stackTrace: stackTrace,
      );
      rethrow;
    }
  }

  Future<Income?> getIncome(String id) async {
    try {
      final box = await getIncomesBox();
      final data = box.get(id);
      if (data == null) return null;
      return Income.fromJson(Map<String, dynamic>.from(data));
    } catch (e, stackTrace) {
      AppLogger.error(
        'Failed to get income: $id',
        error: e,
        stackTrace: stackTrace,
      );
      return null;
    }
  }

  Future<List<Income>> getIncomes(String userId) async {
    try {
      final box = await getIncomesBox();
      return box.values
          .map((data) => Income.fromJson(Map<String, dynamic>.from(data)))
          .where((income) => income.userId == userId)
          .toList();
    } catch (e, stackTrace) {
      AppLogger.error(
        'Failed to get incomes for user: $userId',
        error: e,
        stackTrace: stackTrace,
      );
      return [];
    }
  }

  Future<void> deleteIncome(String id) async {
    try {
      final box = await getIncomesBox();
      await box.delete(id);
      AppLogger.debug('Income deleted: $id');
    } catch (e, stackTrace) {
      AppLogger.error(
        'Failed to delete income: $id',
        error: e,
        stackTrace: stackTrace,
      );
      rethrow;
    }
  }

  // User Profile Operations
  Future<Box<Map>> getUserProfileBox() async {
    return await _openBox<Map>(AppConstants.userProfileBox);
  }

  Future<void> saveUserProfile(UserProfile profile) async {
    try {
      final box = await getUserProfileBox();
      await box.put('current_user', profile.toJson());
      AppLogger.debug('User profile saved: ${profile.email}');
    } catch (e, stackTrace) {
      AppLogger.error(
        'Failed to save user profile',
        error: e,
        stackTrace: stackTrace,
      );
      rethrow;
    }
  }

  Future<UserProfile?> getUserProfile() async {
    try {
      final box = await getUserProfileBox();
      final data = box.get('current_user');
      if (data == null) return null;
      return UserProfile.fromJson(Map<String, dynamic>.from(data));
    } catch (e, stackTrace) {
      AppLogger.error(
        'Failed to get user profile',
        error: e,
        stackTrace: stackTrace,
      );
      return null;
    }
  }

  Future<void> deleteUserProfile() async {
    try {
      final box = await getUserProfileBox();
      await box.delete('current_user');
      AppLogger.debug('User profile deleted');
    } catch (e, stackTrace) {
      AppLogger.error(
        'Failed to delete user profile',
        error: e,
        stackTrace: stackTrace,
      );
      rethrow;
    }
  }

  // Clear All Data
  Future<void> clearAllData() async {
    try {
      await Hive.deleteBoxFromDisk(AppConstants.transactionsBox);
      await Hive.deleteBoxFromDisk(AppConstants.categoriesBox);
      await Hive.deleteBoxFromDisk(AppConstants.budgetsBox);
      await Hive.deleteBoxFromDisk(AppConstants.recurringTransactionsBox);
      await Hive.deleteBoxFromDisk(AppConstants.userProfileBox);
      await Hive.deleteBoxFromDisk('incomes');
      AppLogger.info('All Hive data cleared');
    } catch (e, stackTrace) {
      AppLogger.error(
        'Failed to clear all data',
        error: e,
        stackTrace: stackTrace,
      );
      rethrow;
    }
  }

  // Close all boxes
  Future<void> closeAll() async {
    try {
      await Hive.close();
      _isInitialized = false;
      AppLogger.info('All Hive boxes closed');
    } catch (e, stackTrace) {
      AppLogger.error(
        'Failed to close Hive boxes',
        error: e,
        stackTrace: stackTrace,
      );
      rethrow;
    }
  }
}
