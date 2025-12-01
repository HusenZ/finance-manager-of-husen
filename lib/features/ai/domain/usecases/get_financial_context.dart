import 'package:firebase_auth/firebase_auth.dart';
import '../../../../data/repositories/transaction_repository.dart';
import '../../../../data/repositories/income_repository.dart';
import '../../../../data/repositories/budget_repository.dart';
import '../entities/financial_context.dart';

/// UseCase to fetch and aggregate user's financial data
///
/// This usecase:
/// 1. Gets current authenticated user
/// 2. Fetches transactions, income, and budgets for current month
/// 3. Calculates totals and breakdowns
/// 4. Returns a FinancialContext object with all data
class GetFinancialContext {
  final TransactionRepository _transactionRepository;
  final IncomeRepository _incomeRepository;
  final BudgetRepository _budgetRepository;
  final FirebaseAuth _firebaseAuth;

  GetFinancialContext({
    required TransactionRepository transactionRepository,
    required IncomeRepository incomeRepository,
    required BudgetRepository budgetRepository,
    required FirebaseAuth firebaseAuth,
  })  : _transactionRepository = transactionRepository,
        _incomeRepository = incomeRepository,
        _budgetRepository = budgetRepository,
        _firebaseAuth = firebaseAuth;

  /// Execute the usecase to get financial context
  ///
  /// Returns FinancialContext with all aggregated financial data
  /// Throws Exception if user is not authenticated or data fetch fails
  Future<FinancialContext> call() async {
    try {
      // Get current authenticated user
      final user = _firebaseAuth.currentUser;
      if (user == null) {
        throw Exception('User not authenticated');
      }

      // Get current month date range
      final now = DateTime.now();
      final periodStart = DateTime(now.year, now.month, 1);
      final periodEnd =
          DateTime(now.year, now.month + 1, 0, 23, 59, 59, 999);

      // Initialize aggregation variables
      double totalExpenses = 0;
      Map<String, double> categoryBreakdown = {};
      int transactionCount = 0;

      double totalIncome = 0;
      Map<String, double> incomeSourceBreakdown = {};

      // Fetch all transactions for current month
      final transactionsResult =
          await _transactionRepository.getTransactionsForMonth(
        userId: user.uid,
        month: periodStart,
      );

      transactionsResult.fold(
        (failure) {
          // Log failure but continue with empty data
        },
        (transactions) {
          transactionCount = transactions.length;

          for (final transaction in transactions) {
            // Only count transactions within the current month
            if (transaction.date.isAfter(periodStart.subtract(const Duration(days: 1))) &&
                transaction.date.isBefore(periodEnd.add(const Duration(days: 1)))) {
              totalExpenses += transaction.amount;

              // Aggregate by category
              final category = transaction.category;
              categoryBreakdown[category] =
                  (categoryBreakdown[category] ?? 0) + transaction.amount;
            }
          }
        },
      );

      // Fetch all income for current month
      final incomeResult = await _incomeRepository.getIncomesForMonth(
        user.uid,
        periodStart,
      );

      incomeResult.fold(
        (failure) {
          // Log failure but continue with empty data
        },
        (incomes) {
          for (final income in incomes) {
            // Only count income within the current month
            if (income.date.isAfter(periodStart.subtract(const Duration(days: 1))) &&
                income.date.isBefore(periodEnd.add(const Duration(days: 1)))) {
              totalIncome += income.amount;

              // Aggregate by source
              final source = income.source;
              incomeSourceBreakdown[source] =
                  (incomeSourceBreakdown[source] ?? 0) + income.amount;
            }
          }
        },
      );

      // Calculate savings and savings rate
      final savings = totalIncome - totalExpenses;
      final savingsRate =
          totalIncome > 0 ? (savings / totalIncome) * 100 : 0.0;

      // Get top 3 spending categories
      final sortedCategories = categoryBreakdown.entries.toList()
        ..sort((a, b) => b.value.compareTo(a.value));

      final topSpendingCategories =
          sortedCategories.take(3).map((e) => e.key).toList();

      // Create and return FinancialContext
      return FinancialContext(
        totalIncome: totalIncome,
        totalExpenses: totalExpenses,
        savings: savings,
        savingsRate: savingsRate,
        categoryBreakdown: categoryBreakdown,
        topSpendingCategories: topSpendingCategories,
        incomeSourceBreakdown: incomeSourceBreakdown,
        transactionCount: transactionCount,
        periodStart: periodStart,
        periodEnd: periodEnd,
      );
    } catch (e) {
      throw Exception('Failed to get financial context: $e');
    }
  }

  /// Get financial context for a specific month
  ///
  /// [month] - DateTime representing the month (day is ignored)
  Future<FinancialContext> forMonth(DateTime month) async {
    try {
      final user = _firebaseAuth.currentUser;
      if (user == null) {
        throw Exception('User not authenticated');
      }

      final periodStart = DateTime(month.year, month.month, 1);
      final periodEnd =
          DateTime(month.year, month.month + 1, 0, 23, 59, 59, 999);

      double totalExpenses = 0;
      Map<String, double> categoryBreakdown = {};
      int transactionCount = 0;

      double totalIncome = 0;
      Map<String, double> incomeSourceBreakdown = {};

      final transactionsResult =
          await _transactionRepository.getTransactionsForMonth(
        userId: user.uid,
        month: periodStart,
      );

      transactionsResult.fold(
        (failure) {
          // Log failure but continue
        },
        (transactions) {
          transactionCount = transactions.length;
          for (final transaction in transactions) {
            if (transaction.date.isAfter(periodStart.subtract(const Duration(days: 1))) &&
                transaction.date.isBefore(periodEnd.add(const Duration(days: 1)))) {
              totalExpenses += transaction.amount;
              categoryBreakdown[transaction.category] =
                  (categoryBreakdown[transaction.category] ?? 0) +
                      transaction.amount;
            }
          }
        },
      );

      final incomeResult = await _incomeRepository.getIncomesForMonth(
        user.uid,
        periodStart,
      );

      incomeResult.fold(
        (failure) {
          // Log failure but continue
        },
        (incomes) {
          for (final income in incomes) {
            if (income.date.isAfter(periodStart.subtract(const Duration(days: 1))) &&
                income.date.isBefore(periodEnd.add(const Duration(days: 1)))) {
              totalIncome += income.amount;
              incomeSourceBreakdown[income.source] =
                  (incomeSourceBreakdown[income.source] ?? 0) + income.amount;
            }
          }
        },
      );

      final savings = totalIncome - totalExpenses;
      final savingsRate =
          totalIncome > 0 ? (savings / totalIncome) * 100 : 0.0;

      final sortedCategories = categoryBreakdown.entries.toList()
        ..sort((a, b) => b.value.compareTo(a.value));
      final topSpendingCategories =
          sortedCategories.take(3).map((e) => e.key).toList();

      return FinancialContext(
        totalIncome: totalIncome,
        totalExpenses: totalExpenses,
        savings: savings,
        savingsRate: savingsRate,
        categoryBreakdown: categoryBreakdown,
        topSpendingCategories: topSpendingCategories,
        incomeSourceBreakdown: incomeSourceBreakdown,
        transactionCount: transactionCount,
        periodStart: periodStart,
        periodEnd: periodEnd,
      );
    } catch (e) {
      throw Exception('Failed to get financial context for month: $e');
    }
  }
}
