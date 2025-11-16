import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import '../models/transaction.dart' as models;
import '../models/category.dart';
import '../models/budget.dart';
import '../models/user_profile.dart';
import '../models/recurring_transaction.dart';
import '../models/income.dart';
import '../../core/utils/app_logger.dart';

class FirebaseService {
  final FirebaseFirestore _firestore;

  FirebaseService({FirebaseFirestore? firestore})
      : _firestore = firestore ?? FirebaseFirestore.instance;

  // User Profile Operations
  Future<Either<String, void>> saveUserProfile(UserProfile profile) async {
    try {
      await _firestore
          .collection('users')
          .doc(profile.id)
          .set(profile.toFirestore());
      AppLogger.info('User profile saved to Firestore: ${profile.email}');
      return const Right(null);
    } catch (e, stackTrace) {
      AppLogger.error('Failed to save user profile', error: e, stackTrace: stackTrace);
      return Left('Failed to save profile: ${e.toString()}');
    }
  }

  Future<Either<String, UserProfile>> getUserProfile(String userId) async {
    try {
      final doc = await _firestore.collection('users').doc(userId).get();
      if (!doc.exists) {
        return const Left('User profile not found');
      }
      final profile = UserProfile.fromFirestore(doc.data()!, doc.id);
      return Right(profile);
    } catch (e, stackTrace) {
      AppLogger.error('Failed to get user profile', error: e, stackTrace: stackTrace);
      return Left('Failed to get profile: ${e.toString()}');
    }
  }

  // Transaction Operations
  Future<Either<String, void>> saveTransaction(models.Transaction transaction) async {
    try {
      await _firestore
          .collection('transactions')
          .doc(transaction.userId)
          .collection('userTransactions')
          .doc(transaction.id)
          .set(transaction.toFirestore());
      AppLogger.debug('Transaction saved to Firestore: ${transaction.id}');
      return const Right(null);
    } catch (e, stackTrace) {
      AppLogger.error('Failed to save transaction', error: e, stackTrace: stackTrace);
      return Left('Failed to save transaction: ${e.toString()}');
    }
  }

  Future<Either<String, List<models.Transaction>>> getTransactions(String userId, {int? limit}) async {
    try {
      Query query = _firestore
          .collection('transactions')
          .doc(userId)
          .collection('userTransactions')
          .orderBy('date', descending: true);

      if (limit != null) {
        query = query.limit(limit);
      }

      final snapshot = await query.get();
      final transactions = snapshot.docs
          .map((doc) => models.Transaction.fromFirestore(
                doc.data() as Map<String, dynamic>, doc.id))
          .toList();

      return Right(transactions);
    } catch (e, stackTrace) {
      AppLogger.error('Failed to get transactions', error: e, stackTrace: stackTrace);
      return Left('Failed to get transactions: ${e.toString()}');
    }
  }

  Future<Either<String, void>> deleteTransaction(String userId, String transactionId) async {
    try {
      await _firestore
          .collection('transactions')
          .doc(userId)
          .collection('userTransactions')
          .doc(transactionId)
          .delete();
      AppLogger.debug('Transaction deleted from Firestore: $transactionId');
      return const Right(null);
    } catch (e, stackTrace) {
      AppLogger.error('Failed to delete transaction', error: e, stackTrace: stackTrace);
      return Left('Failed to delete transaction: ${e.toString()}');
    }
  }

  // Category Operations
  Future<Either<String, void>> saveCategory(Category category) async {
    try {
      await _firestore
          .collection('categories')
          .doc(category.userId)
          .collection('userCategories')
          .doc(category.id)
          .set(category.toFirestore());
      AppLogger.debug('Category saved to Firestore: ${category.name}');
      return const Right(null);
    } catch (e, stackTrace) {
      AppLogger.error('Failed to save category', error: e, stackTrace: stackTrace);
      return Left('Failed to save category: ${e.toString()}');
    }
  }

  Future<Either<String, List<Category>>> getCategories(String userId) async {
    try {
      final snapshot = await _firestore
          .collection('categories')
          .doc(userId)
          .collection('userCategories')
          .get();

      final categories = snapshot.docs
          .map((doc) => Category.fromFirestore(doc.data(), doc.id))
          .toList();

      return Right(categories);
    } catch (e, stackTrace) {
      AppLogger.error('Failed to get categories', error: e, stackTrace: stackTrace);
      return Left('Failed to get categories: ${e.toString()}');
    }
  }

  Future<Either<String, void>> deleteCategory(String userId, String categoryId) async {
    try {
      await _firestore
          .collection('categories')
          .doc(userId)
          .collection('userCategories')
          .doc(categoryId)
          .delete();
      AppLogger.debug('Category deleted from Firestore: $categoryId');
      return const Right(null);
    } catch (e, stackTrace) {
      AppLogger.error('Failed to delete category', error: e, stackTrace: stackTrace);
      return Left('Failed to delete category: ${e.toString()}');
    }
  }

  // Budget Operations
  Future<Either<String, void>> saveBudget(Budget budget) async {
    try {
      await _firestore
          .collection('budgets')
          .doc(budget.userId)
          .collection('userBudgets')
          .doc(budget.id)
          .set(budget.toFirestore());
      AppLogger.debug('Budget saved to Firestore: ${budget.category}');
      return const Right(null);
    } catch (e, stackTrace) {
      AppLogger.error('Failed to save budget', error: e, stackTrace: stackTrace);
      return Left('Failed to save budget: ${e.toString()}');
    }
  }

  Future<Either<String, List<Budget>>> getBudgets(String userId) async {
    try {
      final snapshot = await _firestore
          .collection('budgets')
          .doc(userId)
          .collection('userBudgets')
          .get();

      final budgets = snapshot.docs
          .map((doc) => Budget.fromFirestore(doc.data(), doc.id))
          .toList();

      return Right(budgets);
    } catch (e, stackTrace) {
      AppLogger.error('Failed to get budgets', error: e, stackTrace: stackTrace);
      return Left('Failed to get budgets: ${e.toString()}');
    }
  }

  Future<Either<String, void>> deleteBudget(String userId, String budgetId) async {
    try {
      await _firestore
          .collection('budgets')
          .doc(userId)
          .collection('userBudgets')
          .doc(budgetId)
          .delete();
      AppLogger.debug('Budget deleted from Firestore: $budgetId');
      return const Right(null);
    } catch (e, stackTrace) {
      AppLogger.error('Failed to delete budget', error: e, stackTrace: stackTrace);
      return Left('Failed to delete budget: ${e.toString()}');
    }
  }

  // Recurring Transaction Operations
  Future<Either<String, void>> saveRecurringTransaction(RecurringTransaction transaction) async {
    try {
      await _firestore
          .collection('recurringTransactions')
          .doc(transaction.userId)
          .collection('userRecurringTransactions')
          .doc(transaction.id)
          .set(transaction.toFirestore());
      AppLogger.debug('Recurring transaction saved to Firestore: ${transaction.id}');
      return const Right(null);
    } catch (e, stackTrace) {
      AppLogger.error('Failed to save recurring transaction', error: e, stackTrace: stackTrace);
      return Left('Failed to save recurring transaction: ${e.toString()}');
    }
  }

  Future<Either<String, List<RecurringTransaction>>> getRecurringTransactions(String userId) async {
    try {
      final snapshot = await _firestore
          .collection('recurringTransactions')
          .doc(userId)
          .collection('userRecurringTransactions')
          .get();

      final transactions = snapshot.docs
          .map((doc) => RecurringTransaction.fromFirestore(doc.data(), doc.id))
          .toList();

      return Right(transactions);
    } catch (e, stackTrace) {
      AppLogger.error('Failed to get recurring transactions', error: e, stackTrace: stackTrace);
      return Left('Failed to get recurring transactions: ${e.toString()}');
    }
  }

  Future<Either<String, void>> deleteRecurringTransaction(String userId, String transactionId) async {
    try {
      await _firestore
          .collection('recurringTransactions')
          .doc(userId)
          .collection('userRecurringTransactions')
          .doc(transactionId)
          .delete();
      AppLogger.debug('Recurring transaction deleted from Firestore: $transactionId');
      return const Right(null);
    } catch (e, stackTrace) {
      AppLogger.error('Failed to delete recurring transaction', error: e, stackTrace: stackTrace);
      return Left('Failed to delete recurring transaction: ${e.toString()}');
    }
  }

  // Income Operations
  Future<Either<String, void>> createIncome(Income income) async {
    try {
      await _firestore
          .collection('incomes')
          .doc(income.userId)
          .collection('userIncomes')
          .doc(income.id)
          .set(income.toFirestore());
      AppLogger.debug('Income saved to Firestore: ${income.id}');
      return const Right(null);
    } catch (e, stackTrace) {
      AppLogger.error('Failed to save income', error: e, stackTrace: stackTrace);
      return Left('Failed to save income: ${e.toString()}');
    }
  }

  Future<Either<String, List<Income>>> getIncomes(String userId) async {
    try {
      final snapshot = await _firestore
          .collection('incomes')
          .doc(userId)
          .collection('userIncomes')
          .orderBy('date', descending: true)
          .get();

      final incomes = snapshot.docs
          .map((doc) => Income.fromFirestore(
                doc.data(), doc.id))
          .toList();

      return Right(incomes);
    } catch (e, stackTrace) {
      AppLogger.error('Failed to get incomes', error: e, stackTrace: stackTrace);
      return Left('Failed to get incomes: ${e.toString()}');
    }
  }

  Future<Either<String, void>> updateIncome(Income income) async {
    try {
      await _firestore
          .collection('incomes')
          .doc(income.userId)
          .collection('userIncomes')
          .doc(income.id)
          .update(income.toFirestore());
      AppLogger.debug('Income updated in Firestore: ${income.id}');
      return const Right(null);
    } catch (e, stackTrace) {
      AppLogger.error('Failed to update income', error: e, stackTrace: stackTrace);
      return Left('Failed to update income: ${e.toString()}');
    }
  }

  Future<Either<String, void>> deleteIncome(String userId, String incomeId) async {
    try {
      await _firestore
          .collection('incomes')
          .doc(userId)
          .collection('userIncomes')
          .doc(incomeId)
          .delete();
      AppLogger.debug('Income deleted from Firestore: $incomeId');
      return const Right(null);
    } catch (e, stackTrace) {
      AppLogger.error('Failed to delete income', error: e, stackTrace: stackTrace);
      return Left('Failed to delete income: ${e.toString()}');
    }
  }
}
