import 'package:firebase_auth/firebase_auth.dart';

import '../../../../data/repositories/budget_repository.dart';
import '../../../../data/repositories/income_repository.dart';
import '../../../../data/repositories/transaction_repository.dart';
import '../entities/financial_context.dart';

class GetFinancialContext {
  final TransactionRepository _transactionRepository;
  final IncomeRepository _incomeRepository;
  final BudgetRepository _budgetRepository;

  GetFinancialContext({
    required TransactionRepository transactionRepository,
    required IncomeRepository incomeRepository,
    required BudgetRepository budgetRepository,
  }) : _transactionRepository = transactionRepository,
       _incomeRepository = incomeRepository,
       _budgetRepository = budgetRepository;

  Future<FinancialContext> call() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      throw Exception('User not authenticated');
    }

    final now = DateTime.now();
    final periodStart = DateTime(now.year, now.month, 1);
    final periodEnd = DateTime(now.year, now.month + 1, 0, 23, 59, 59, 999);

    double totalExpenses = 0;
    final categoryBreakdown = <String, double>{};
    int transactionCount = 0;
    double totalIncome = 0;
    final incomeSourceBreakdown = <String, double>{};

    final transactionsResult = await _transactionRepository
        .getTransactionsForMonth(userId: user.uid, month: periodStart);

    transactionsResult.fold((_) {}, (transactions) {
      transactionCount = transactions.length;
      for (final transaction in transactions) {
        if (transaction.date.isAfter(
              periodStart.subtract(const Duration(days: 1)),
            ) &&
            transaction.date.isBefore(periodEnd.add(const Duration(days: 1)))) {
          totalExpenses += transaction.amount;
          categoryBreakdown[transaction.category] =
              (categoryBreakdown[transaction.category] ?? 0) +
              transaction.amount;
        }
      }
    });

    final incomeResult = await _incomeRepository.getIncomesForMonth(
      user.uid,
      periodStart,
    );
    incomeResult.fold((_) {}, (incomes) {
      for (final income in incomes) {
        if (income.date.isAfter(
              periodStart.subtract(const Duration(days: 1)),
            ) &&
            income.date.isBefore(periodEnd.add(const Duration(days: 1)))) {
          totalIncome += income.amount;
          incomeSourceBreakdown[income.source] =
              (incomeSourceBreakdown[income.source] ?? 0) + income.amount;
        }
      }
    });

    final savings = totalIncome - totalExpenses;
    final savingsRate = totalIncome > 0 ? (savings / totalIncome) * 100 : 0.0;

    final sortedCategories = categoryBreakdown.entries.toList()
      ..sort((a, b) => b.value.compareTo(a.value));

    final topSpendingCategories = sortedCategories
        .take(3)
        .map((e) => e.key)
        .toList();

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
  }

  Future<FinancialContext> forMonth(DateTime month) async {
    return call();
  }
}
