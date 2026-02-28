import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';

import '../../core/utils/app_logger.dart';
import '../models/budget.dart';
import '../models/category.dart';
import '../models/income.dart';
import '../models/recurring_transaction.dart';
import '../models/transaction.dart' as models;
import '../models/user_profile.dart';

class FirebaseService {
  FirebaseService({FirebaseFirestore? firestore})
    : _firestore = firestore ?? FirebaseFirestore.instance;

  final FirebaseFirestore _firestore;

  CollectionReference<Map<String, dynamic>> _collection(
    String uid,
    String name,
  ) {
    return _firestore.collection('users').doc(uid).collection(name);
  }

  DateTime _asDateTime(dynamic value) {
    if (value is Timestamp) return value.toDate();
    if (value is String) return DateTime.tryParse(value) ?? DateTime.now();
    return DateTime.now();
  }

  Future<Either<String, void>> saveUserProfile(UserProfile profile) async {
    try {
      await _firestore.collection('users').doc(profile.id).set({
        'profile': {
          'email': profile.email,
          'displayName': profile.name,
          'avatarUrl': profile.profilePicture,
          'isOwner': false,
          'createdAt': profile.createdAt.toIso8601String(),
        },
      }, SetOptions(merge: true));
      return const Right(null);
    } catch (e) {
      return Left('Failed to save profile: $e');
    }
  }

  Future<Either<String, UserProfile>> getUserProfile(String userId) async {
    try {
      final snapshot = await _firestore.collection('users').doc(userId).get();
      final data = snapshot.data();
      final profile = data?['profile'];
      if (profile is! Map<String, dynamic>) {
        return const Left('User profile not found');
      }

      return Right(
        UserProfile(
          id: userId,
          email: profile['email'] as String? ?? '',
          name: profile['displayName'] as String? ?? '',
          profilePicture: profile['avatarUrl'] as String?,
          currency: 'INR',
          createdAt: _asDateTime(profile['createdAt']),
        ),
      );
    } catch (e) {
      return Left('Failed to get profile: $e');
    }
  }

  Future<Either<String, void>> saveTransaction(models.Transaction t) async {
    try {
      await _collection(t.userId, 'transactions').doc(t.id).set({
        'type': 'expense',
        'amount': t.amount,
        'categoryId': t.category,
        'note': t.description,
        'date': t.date.toIso8601String(),
        'createdAt': t.createdAt.toIso8601String(),
        'paymentMethod': t.paymentMethod,
        'isRecurring': t.isRecurring,
        'recurringId': t.recurringId,
        'notes': t.notes,
      }, SetOptions(merge: true));
      return const Right(null);
    } catch (e) {
      return Left('Failed to save transaction: $e');
    }
  }

  Future<Either<String, List<models.Transaction>>> getTransactions(
    String userId, {
    int? limit,
  }) async {
    try {
      Query<Map<String, dynamic>> query = _collection(
        userId,
        'transactions',
      ).orderBy('date', descending: true);
      if (limit != null) {
        query = query.limit(limit);
      }

      final rows = await query.get();
      final transactions = rows.docs.map<models.Transaction>((doc) {
        final map = doc.data();
        return models.Transaction(
          id: doc.id,
          userId: userId,
          amount: (map['amount'] as num?)?.toDouble() ?? 0,
          category: map['categoryId'] as String? ?? 'Other',
          description: map['note'] as String? ?? '',
          date:
              DateTime.tryParse(map['date'] as String? ?? '') ?? DateTime.now(),
          paymentMethod: map['paymentMethod'] as String? ?? 'Cash',
          isRecurring: map['isRecurring'] as bool? ?? false,
          recurringId: map['recurringId'] as String?,
          notes: map['notes'] as String?,
          createdAt:
              DateTime.tryParse(map['createdAt'] as String? ?? '') ??
              DateTime.now(),
          syncedAt: DateTime.now(),
        );
      }).toList();

      return Right(transactions);
    } catch (e) {
      return Left('Failed to get transactions: $e');
    }
  }

  Future<Either<String, void>> deleteTransaction(
    String userId,
    String transactionId,
  ) async {
    try {
      await _collection(userId, 'transactions').doc(transactionId).delete();
      return const Right(null);
    } catch (e) {
      return Left('Failed to delete transaction: $e');
    }
  }

  Future<Either<String, void>> saveCategory(Category category) async {
    try {
      await _collection(category.userId, 'categories').doc(category.id).set({
        'name': category.name,
        'icon': category.icon,
        'color': category.color,
        'isDefault': !category.isCustom,
        'createdAt': category.createdAt.toIso8601String(),
      }, SetOptions(merge: true));
      return const Right(null);
    } catch (e) {
      return Left('Failed to save category: $e');
    }
  }

  Future<Either<String, List<Category>>> getCategories(String userId) async {
    try {
      final rows = await _collection(userId, 'categories').get();
      return Right(
        rows.docs.map<Category>((doc) {
          final map = doc.data();
          return Category(
            id: doc.id,
            userId: userId,
            name: map['name'] as String? ?? '',
            icon: map['icon'] as String? ?? '📦',
            color: map['color'] as String? ?? 'FF607D8B',
            isCustom: !(map['isDefault'] as bool? ?? false),
            createdAt:
                DateTime.tryParse(map['createdAt'] as String? ?? '') ??
                DateTime.now(),
          );
        }).toList(),
      );
    } catch (e) {
      return Left('Failed to get categories: $e');
    }
  }

  Future<Either<String, void>> deleteCategory(
    String userId,
    String categoryId,
  ) async {
    try {
      await _collection(userId, 'categories').doc(categoryId).delete();
      return const Right(null);
    } catch (e) {
      return Left('Failed to delete category: $e');
    }
  }

  Future<Either<String, void>> saveBudget(Budget budget) async {
    try {
      final parts = budget.month.split('-');
      final year = int.tryParse(parts.first) ?? DateTime.now().year;
      final month = int.tryParse(parts.last) ?? DateTime.now().month;

      await _collection(budget.userId, 'budgets').doc(budget.id).set({
        'categoryId': budget.category,
        'amount': budget.limit,
        'month': month,
        'year': year,
        'createdAt': budget.createdAt.toIso8601String(),
      }, SetOptions(merge: true));
      return const Right(null);
    } catch (e) {
      return Left('Failed to save budget: $e');
    }
  }

  Future<Either<String, List<Budget>>> getBudgets(String userId) async {
    try {
      final rows = await _collection(userId, 'budgets').get();
      return Right(
        rows.docs.map<Budget>((doc) {
          final map = doc.data();
          final year = (map['year'] as num?)?.toInt() ?? DateTime.now().year;
          final month = (map['month'] as num?)?.toInt() ?? DateTime.now().month;
          return Budget(
            id: doc.id,
            userId: userId,
            category: map['categoryId'] as String? ?? 'Other',
            limit: (map['amount'] as num?)?.toDouble() ?? 0,
            month:
                '${year.toString().padLeft(4, '0')}-${month.toString().padLeft(2, '0')}',
            createdAt:
                DateTime.tryParse(map['createdAt'] as String? ?? '') ??
                DateTime.now(),
          );
        }).toList(),
      );
    } catch (e) {
      return Left('Failed to get budgets: $e');
    }
  }

  Future<Either<String, void>> deleteBudget(
    String userId,
    String budgetId,
  ) async {
    try {
      await _collection(userId, 'budgets').doc(budgetId).delete();
      return const Right(null);
    } catch (e) {
      return Left('Failed to delete budget: $e');
    }
  }

  Future<Either<String, void>> saveRecurringTransaction(
    RecurringTransaction transaction,
  ) async {
    try {
      await _collection(
        transaction.userId,
        'recurringTransactions',
      ).doc(transaction.id).set({
        'type': 'expense',
        'amount': transaction.amount,
        'categoryId': transaction.category,
        'frequency': transaction.frequency.name,
        'nextDueDate': transaction.nextDueDate.toIso8601String(),
        'isActive': transaction.isActive,
        'note': transaction.description,
        'createdAt': transaction.createdAt.toIso8601String(),
      }, SetOptions(merge: true));
      return const Right(null);
    } catch (e) {
      return Left('Failed to save recurring transaction: $e');
    }
  }

  Future<Either<String, List<RecurringTransaction>>> getRecurringTransactions(
    String userId,
  ) async {
    try {
      final rows = await _collection(userId, 'recurringTransactions').get();
      return Right(
        rows.docs.map<RecurringTransaction>((doc) {
          final map = doc.data();
          final frequency = (map['frequency'] as String? ?? 'monthly')
              .toLowerCase();
          RecurringFrequency parsed = RecurringFrequency.monthly;
          switch (frequency) {
            case 'daily':
              parsed = RecurringFrequency.daily;
              break;
            case 'weekly':
              parsed = RecurringFrequency.weekly;
              break;
            case 'yearly':
              parsed = RecurringFrequency.yearly;
              break;
            default:
              parsed = RecurringFrequency.monthly;
          }
          return RecurringTransaction(
            id: doc.id,
            userId: userId,
            amount: (map['amount'] as num?)?.toDouble() ?? 0,
            category: map['categoryId'] as String? ?? 'Other',
            description: map['note'] as String? ?? '',
            frequency: parsed,
            nextDueDate:
                DateTime.tryParse(map['nextDueDate'] as String? ?? '') ??
                DateTime.now(),
            isActive: map['isActive'] as bool? ?? true,
            createdAt:
                DateTime.tryParse(map['createdAt'] as String? ?? '') ??
                DateTime.now(),
          );
        }).toList(),
      );
    } catch (e) {
      return Left('Failed to get recurring transactions: $e');
    }
  }

  Future<Either<String, void>> deleteRecurringTransaction(
    String userId,
    String transactionId,
  ) async {
    try {
      await _collection(
        userId,
        'recurringTransactions',
      ).doc(transactionId).delete();
      return const Right(null);
    } catch (e) {
      return Left('Failed to delete recurring transaction: $e');
    }
  }

  Future<Either<String, void>> createIncome(Income income) async {
    try {
      await _collection(income.userId, 'transactions').doc(income.id).set({
        'type': 'income',
        'amount': income.amount,
        'categoryId': income.source,
        'note': income.description,
        'date': income.date.toIso8601String(),
        'createdAt': income.createdAt.toIso8601String(),
        'isSynced': true,
      }, SetOptions(merge: true));
      return const Right(null);
    } catch (e) {
      return Left('Failed to save income: $e');
    }
  }

  Future<Either<String, List<Income>>> getIncomes(String userId) async {
    try {
      final rows = await _collection(userId, 'transactions')
          .where('type', isEqualTo: 'income')
          .orderBy('date', descending: true)
          .get();

      return Right(
        rows.docs.map<Income>((doc) {
          final map = doc.data();
          return Income(
            id: doc.id,
            userId: userId,
            amount: (map['amount'] as num?)?.toDouble() ?? 0,
            source: map['categoryId'] as String? ?? 'Other',
            description: map['note'] as String? ?? '',
            date:
                DateTime.tryParse(map['date'] as String? ?? '') ??
                DateTime.now(),
            createdAt:
                DateTime.tryParse(map['createdAt'] as String? ?? '') ??
                DateTime.now(),
            isSynced: true,
          );
        }).toList(),
      );
    } catch (e) {
      return Left('Failed to get incomes: $e');
    }
  }

  Future<Either<String, void>> updateIncome(Income income) =>
      createIncome(income);

  Future<Either<String, void>> deleteIncome(
    String userId,
    String incomeId,
  ) async {
    try {
      await _collection(userId, 'transactions').doc(incomeId).delete();
      return const Right(null);
    } catch (e) {
      AppLogger.warning('Failed to delete income: $e');
      return Left('Failed to delete income: $e');
    }
  }
}
