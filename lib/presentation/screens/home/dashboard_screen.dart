import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_constants.dart';
import '../../../core/router/app_router.dart';
import '../../../core/utils/date_formatter.dart';
import '../../../data/models/transaction.dart';
import '../../bloc/auth/auth_bloc.dart';
import '../../bloc/auth/auth_state.dart';
import '../../bloc/transaction/transaction_bloc.dart';
import '../../bloc/transaction/transaction_event.dart';
import '../../bloc/transaction/transaction_state.dart';
import '../../bloc/income/income_bloc.dart';
import '../../bloc/income/income_event.dart';
import '../../bloc/income/income_state.dart';
import '../../widgets/common/loading_widget.dart';
import '../../widgets/common/error_widget.dart';
import '../../widgets/dashboard/balance_card.dart';
import '../../widgets/dashboard/quick_stats_card.dart';
import '../../widgets/dashboard/category_chart_card.dart';
import '../../widgets/dashboard/recent_transactions_list.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  void initState() {
    super.initState();
    _loadData();
  }

  void _loadData() {
    final authState = context.read<AuthBloc>().state;
    if (authState is AuthAuthenticated) {
      final now = DateTime.now();
      final currentMonth = DateTime(now.year, now.month);

      context.read<TransactionBloc>().add(
        TransactionEvent.loadTransactions(userId: authState.user.id),
      );

      context.read<IncomeBloc>().add(
        IncomeEvent.loadIncomesForMonth(
          userId: authState.user.id,
          month: currentMonth,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final authState = context.read<AuthBloc>().state;

    if (authState is! AuthAuthenticated) {
      return Scaffold(
        body: Center(
          child: CustomErrorWidget(
            message: 'Please sign in to continue',
            onRetry: () => context.go(AppRouter.login),
          ),
        ),
      );
    }

    final user = authState.user;

    return Scaffold(
      backgroundColor: isDark
          ? AppColors.backgroundDark
          : AppColors.backgroundLight,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: isDark
                  ? AppColors.backgroundDark
                  : AppColors.backgroundLight,
              elevation: 0,
              pinned: true,
              expandedHeight: 100,
              flexibleSpace: LayoutBuilder(
                builder: (context, constraints) {
                  return FlexibleSpaceBar(
                    titlePadding: EdgeInsets.zero,
                    title: Container(
                      padding: const EdgeInsets.only(
                        left: AppConstants.spacing16,
                        right: 120, // Space for action buttons
                        bottom: AppConstants.spacing8,
                      ),
                      alignment: Alignment.bottomLeft,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'Hello,',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: isDark
                                  ? AppColors.textPrimaryDark
                                  : AppColors.textPrimaryLight,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            user.name,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: isDark
                                  ? AppColors.textPrimaryDark
                                  : AppColors.textPrimaryLight,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            DateFormatter.formatDate(DateTime.now()),
                            style: TextStyle(
                              fontSize: 11,
                              color: isDark
                                  ? AppColors.textSecondaryDark
                                  : AppColors.textSecondaryLight,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
              actions: [
                IconButton(
                  icon: const Icon(Icons.notifications_outlined),
                  onPressed: () {
                    // TODO: Show notifications
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.settings_outlined),
                  onPressed: () {
                    context.push(AppRouter.settings);
                  },
                ),
              ],
            ),
            SliverPadding(
              padding: const EdgeInsets.all(AppConstants.spacing16),
              sliver: BlocBuilder<TransactionBloc, TransactionState>(
                builder: (context, transactionState) {
                  return BlocBuilder<IncomeBloc, IncomeState>(
                    builder: (context, incomeState) {
                      // Show loading if either is loading initially
                      if (transactionState is TransactionLoading ||
                          incomeState is IncomeLoading) {
                        return SliverToBoxAdapter(
                          child: LoadingWidget(message: 'Loading dashboard...'),
                        );
                      }

                      // Handle transaction errors
                      if (transactionState is TransactionError) {
                        return SliverToBoxAdapter(
                          child: CustomErrorWidget(
                            message: transactionState.message,
                            onRetry: _loadData,
                          ),
                        );
                      }

                      // Get transactions and incomes
                      final transactions = transactionState is TransactionLoaded
                          ? transactionState.transactions
                          : <Transaction>[];

                      final incomes = incomeState is IncomeLoaded
                          ? incomeState.incomes
                          : [];

                      return _buildDashboardContent(
                        transactions,
                        incomes,
                        user.currency,
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          context.push(AppRouter.addTransaction);
        },
        icon: const Icon(Icons.add),
        label: const Text('Add Transaction'),
      ),
      bottomNavigationBar: _buildBottomNavBar(context, isDark),
    );
  }

  Widget _buildDashboardContent(
    List<Transaction> transactions,
    List<dynamic> incomes,
    String? currency,
  ) {
    final currencyCode = currency ?? 'INR';
    final now = DateTime.now();
    final currentMonth = DateTime(now.year, now.month);
    final lastMonth = DateTime(now.year, now.month - 1);

    // Filter transactions for current month
    final currentMonthTransactions = transactions.where((t) {
      return t.date.year == currentMonth.year &&
          t.date.month == currentMonth.month;
    }).toList();

    // Filter transactions for last month
    final lastMonthTransactions = transactions.where((t) {
      return t.date.year == lastMonth.year && t.date.month == lastMonth.month;
    }).toList();

    // Calculate income totals
    final totalIncome = incomes.fold<double>(
      0.0,
      (sum, income) => sum + (income.amount as double),
    );

    final totalExpenses = currentMonthTransactions.fold<double>(
      0.0,
      (sum, t) => sum + t.amount,
    );

    final lastMonthExpenses = lastMonthTransactions.fold<double>(
      0.0,
      (sum, t) => sum + t.amount,
    );

    // Calculate category spending
    final Map<String, double> categorySpending = {};
    for (var transaction in currentMonthTransactions) {
      categorySpending[transaction.category] =
          (categorySpending[transaction.category] ?? 0) + transaction.amount;
    }

    // Sort transactions by date (newest first)
    final sortedTransactions = List<Transaction>.from(transactions)
      ..sort((a, b) => b.date.compareTo(a.date));

    return SliverList(
      delegate: SliverChildListDelegate([
        BalanceCard(
          totalIncome: totalIncome,
          totalExpenses: totalExpenses,
          currency: currencyCode,
        ),
        const SizedBox(height: AppConstants.spacing16),
        // AI Assistant Card
        _buildAIAssistantCard(context),
        const SizedBox(height: AppConstants.spacing16),
        Row(
          children: [
            Expanded(
              child: QuickStatsCard(
                currentMonthSpending: totalExpenses,
                lastMonthSpending: lastMonthExpenses,
                transactionCount: currentMonthTransactions.length,
                currency: currencyCode,
              ),
            ),
          ],
        ),
        const SizedBox(height: AppConstants.spacing16),
        CategoryChartCard(
          categorySpending: categorySpending,
          currency: currencyCode,
        ),
        const SizedBox(height: AppConstants.spacing16),
        RecentTransactionsList(
          transactions: sortedTransactions,
          currency: currencyCode,
        ),
        const SizedBox(height: 80), // Space for FAB
      ]),
    );
  }

  Widget _buildAIAssistantCard(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: InkWell(
        onTap: () => context.push(AppRouter.aiChat),
        borderRadius: BorderRadius.circular(16),
        child: Container(
          padding: const EdgeInsets.all(AppConstants.spacing16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            gradient: LinearGradient(
              colors: [
                theme.colorScheme.primary.withOpacity(0.1),
                theme.colorScheme.secondary.withOpacity(0.1),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Row(
            children: [
              // AI Icon
              Container(
                width: 56,
                height: 56,
                decoration: BoxDecoration(
                  color: theme.colorScheme.primary.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Center(
                  child: Text('🤖', style: TextStyle(fontSize: 32)),
                ),
              ),
              const SizedBox(width: AppConstants.spacing16),
              // Content
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          'AI Financial Assistant',
                          style: theme.textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: isDark
                                ? AppColors.textPrimaryDark
                                : AppColors.textPrimaryLight,
                          ),
                        ),
                        const SizedBox(width: 4),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 6,
                            vertical: 2,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.green.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(4),
                            border: Border.all(color: Colors.green, width: 1),
                          ),
                          child: Text(
                            'NEW',
                            style: theme.textTheme.bodySmall?.copyWith(
                              color: Colors.green,
                              fontWeight: FontWeight.bold,
                              fontSize: 9,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Get personalized insights, spending tips, and smart purchase advice',
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: isDark
                            ? AppColors.textSecondaryDark
                            : AppColors.textSecondaryLight,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              // Arrow
              Icon(
                Icons.arrow_forward_ios,
                size: 16,
                color: isDark
                    ? AppColors.textSecondaryDark
                    : AppColors.textSecondaryLight,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBottomNavBar(BuildContext context, bool isDark) {
    return BottomNavigationBar(
      currentIndex: 0,
      type: BottomNavigationBarType.fixed,
      backgroundColor: isDark ? AppColors.surfaceDark : AppColors.surfaceLight,
      selectedItemColor: AppColors.primary,
      unselectedItemColor: isDark
          ? AppColors.textSecondaryDark
          : AppColors.textSecondaryLight,
      onTap: (index) {
        switch (index) {
          case 0:
            // Already on dashboard
            break;
          case 1:
            context.push(AppRouter.transactions);
            break;
          case 2:
            context.push(AppRouter.incomes);
            break;
          case 3:
            context.push(AppRouter.budgets);
            break;
          case 4:
            context.push(AppRouter.analytics);
            break;
        }
      },
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.dashboard_outlined),
          activeIcon: Icon(Icons.dashboard),
          label: 'Dashboard',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.receipt_long_outlined),
          activeIcon: Icon(Icons.receipt_long),
          label: 'Transactions',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.account_balance_wallet_outlined),
          activeIcon: Icon(Icons.account_balance_wallet),
          label: 'Income',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.savings_outlined),
          activeIcon: Icon(Icons.savings),
          label: 'Budgets',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.analytics_outlined),
          activeIcon: Icon(Icons.analytics),
          label: 'Analytics',
        ),
      ],
    );
  }
}
