import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_constants.dart';
import '../../../core/router/app_router.dart';
import '../../../data/models/budget.dart';
import '../../bloc/auth/auth_bloc.dart';
import '../../bloc/auth/auth_state.dart';
import '../../bloc/budget/budget_bloc.dart';
import '../../bloc/budget/budget_event.dart';
import '../../bloc/budget/budget_state.dart';
import '../../widgets/budget/budget_card.dart';
import '../../widgets/common/custom_app_bar.dart';
import '../../widgets/common/error_widget.dart';
import '../../widgets/common/loading_widget.dart';

class BudgetsScreen extends StatefulWidget {
  const BudgetsScreen({super.key});

  @override
  State<BudgetsScreen> createState() => _BudgetsScreenState();
}

class _BudgetsScreenState extends State<BudgetsScreen> {
  DateTime _selectedMonth = DateTime.now();

  @override
  void initState() {
    super.initState();
    _loadBudgets();
  }

  void _loadBudgets() {
    final authState = context.read<AuthBloc>().state;
    if (authState is AuthAuthenticated) {
      context.read<BudgetBloc>().add(
            BudgetEvent.loadBudgetsForMonth(
              userId: authState.user.id,
              month: _selectedMonth,
            ),
          );
    }
  }

  void _deleteBudget(Budget budget) {
    final authState = context.read<AuthBloc>().state;
    if (authState is! AuthAuthenticated) return;

    context.read<BudgetBloc>().add(
          BudgetEvent.deleteBudget(
            userId: authState.user.id,
            budgetId: budget.id,
          ),
        );

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('${budget.category} budget deleted'),
        backgroundColor: AppColors.success,
      ),
    );
  }

  Future<void> _selectMonth(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedMonth,
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
      helpText: 'Select Month',
    );
    if (picked != null && picked != _selectedMonth) {
      setState(() {
        _selectedMonth = DateTime(picked.year, picked.month);
      });
      _loadBudgets();
    }
  }

  void _changeMonth(int months) {
    setState(() {
      _selectedMonth = DateTime(
        _selectedMonth.year,
        _selectedMonth.month + months,
      );
    });
    _loadBudgets();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final authState = context.read<AuthBloc>().state;

    if (authState is! AuthAuthenticated) {
      return Scaffold(
        appBar: const CustomAppBar(title: 'Budgets'),
        body: Center(
          child: CustomErrorWidget(
            message: 'Please sign in to view budgets',
            onRetry: () => context.go(AppRouter.login),
          ),
        ),
      );
    }

    final currencyCode = authState.user.currency ?? 'INR';

    return Scaffold(
      backgroundColor:
          isDark ? AppColors.backgroundDark : AppColors.backgroundLight,
      appBar: const CustomAppBar(title: 'Budgets'),
      body: Column(
        children: [
          _buildMonthSelector(isDark),
          Expanded(
            child: BlocConsumer<BudgetBloc, BudgetState>(
              listener: (context, state) {
                state.whenOrNull(
                  success: (message) {
                    _loadBudgets();
                  },
                  error: (message) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(message),
                        backgroundColor: AppColors.error,
                      ),
                    );
                  },
                );
              },
              builder: (context, state) {
                return state.when(
                  initial: () => const LoadingWidget(message: 'Loading...'),
                  loading: () =>
                      const LoadingWidget(message: 'Loading budgets...'),
                  loaded: (budgets) {
                    if (budgets.isEmpty) {
                      return _buildEmptyState(context);
                    }

                    // Sort budgets: exceeded first, then warning, then on track
                    final sortedBudgets = List<Budget>.from(budgets)
                      ..sort((a, b) {
                        if (a.isExceeded && !b.isExceeded) return -1;
                        if (!a.isExceeded && b.isExceeded) return 1;
                        if (a.isWarning && !b.isWarning) return -1;
                        if (!a.isWarning && b.isWarning) return 1;
                        return a.category.compareTo(b.category);
                      });

                    return RefreshIndicator(
                      onRefresh: () async {
                        _loadBudgets();
                      },
                      child: Column(
                        children: [
                          _buildSummaryCard(sortedBudgets, currencyCode, isDark),
                          Expanded(
                            child: ListView.builder(
                              itemCount: sortedBudgets.length,
                              itemBuilder: (context, index) {
                                final budget = sortedBudgets[index];
                                return BudgetCard(
                                  budget: budget,
                                  currency: currencyCode,
                                  onTap: () {
                                    // Navigate to edit budget screen
                                    context.push(
                                      '${AppRouter.budgets}/edit/${budget.id}',
                                    );
                                  },
                                  onDelete: () => _showDeleteConfirmation(budget),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                  error: (message) => CustomErrorWidget(
                    message: message,
                    onRetry: _loadBudgets,
                  ),
                  success: (_) => const LoadingWidget(message: 'Updating...'),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          context.push(AppRouter.addBudget);
        },
        icon: const Icon(Icons.add),
        label: const Text('Add Budget'),
      ),
    );
  }

  Widget _buildMonthSelector(bool isDark) {
    return Container(
      padding: const EdgeInsets.all(AppConstants.spacing16),
      decoration: BoxDecoration(
        color: isDark ? AppColors.surfaceDark : AppColors.surfaceLight,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            icon: const Icon(Icons.chevron_left),
            onPressed: () => _changeMonth(-1),
            tooltip: 'Previous month',
          ),
          InkWell(
            onTap: () => _selectMonth(context),
            borderRadius: BorderRadius.circular(8),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppConstants.spacing16,
                vertical: AppConstants.spacing8,
              ),
              child: Row(
                children: [
                  const Icon(Icons.calendar_today, size: 20),
                  const SizedBox(width: AppConstants.spacing8),
                  Text(
                    DateFormat('MMMM yyyy').format(_selectedMonth),
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const SizedBox(width: AppConstants.spacing4),
                  const Icon(Icons.arrow_drop_down),
                ],
              ),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.chevron_right),
            onPressed: () => _changeMonth(1),
            tooltip: 'Next month',
          ),
        ],
      ),
    );
  }

  Widget _buildSummaryCard(List<Budget> budgets, String currency, bool isDark) {
    final totalLimit = budgets.fold<double>(0, (sum, b) => sum + b.limit);
    final totalSpent = budgets.fold<double>(0, (sum, b) => sum + b.spent);
    final totalRemaining = totalLimit - totalSpent;
    final exceededCount = budgets.where((b) => b.isExceeded).length;
    final warningCount = budgets.where((b) => b.isWarning && !b.isExceeded).length;

    return Card(
      margin: const EdgeInsets.all(AppConstants.spacing16),
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              AppColors.primary,
              AppColors.primary.withValues(alpha: 0.8),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(16),
        ),
        padding: const EdgeInsets.all(AppConstants.spacing24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Budget Overview',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: AppConstants.spacing16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildSummaryItem(
                  context,
                  'Total Budget',
                  _formatCurrency(totalLimit, currency),
                  Icons.account_balance_wallet,
                ),
                _buildSummaryItem(
                  context,
                  'Spent',
                  _formatCurrency(totalSpent, currency),
                  Icons.payments,
                ),
                _buildSummaryItem(
                  context,
                  'Remaining',
                  _formatCurrency(totalRemaining, currency),
                  Icons.savings,
                ),
              ],
            ),
            if (exceededCount > 0 || warningCount > 0) ...[
              const SizedBox(height: AppConstants.spacing16),
              Container(
                padding: const EdgeInsets.all(AppConstants.spacing12),
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    if (exceededCount > 0) ...[
                      const Icon(Icons.error, color: Colors.white, size: 20),
                      const SizedBox(width: AppConstants.spacing8),
                      Text(
                        '$exceededCount exceeded',
                        style: const TextStyle(color: Colors.white),
                      ),
                    ],
                    if (exceededCount > 0 && warningCount > 0)
                      const SizedBox(width: AppConstants.spacing16),
                    if (warningCount > 0) ...[
                      const Icon(Icons.warning, color: Colors.white, size: 20),
                      const SizedBox(width: AppConstants.spacing8),
                      Text(
                        '$warningCount near limit',
                        style: const TextStyle(color: Colors.white),
                      ),
                    ],
                  ],
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildSummaryItem(
    BuildContext context,
    String label,
    String value,
    IconData icon,
  ) {
    return Column(
      children: [
        Icon(icon, color: Colors.white.withValues(alpha: 0.9), size: 24),
        const SizedBox(height: AppConstants.spacing8),
        Text(
          label,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: Colors.white.withValues(alpha: 0.9),
              ),
        ),
        const SizedBox(height: AppConstants.spacing4),
        Text(
          value,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
        ),
      ],
    );
  }

  Widget _buildEmptyState(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AppConstants.spacing24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.account_balance_wallet_outlined,
              size: 80,
              color: AppColors.primary.withValues(alpha: 0.5),
            ),
            const SizedBox(height: AppConstants.spacing24),
            Text(
              'No budgets yet',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: AppConstants.spacing8),
            Text(
              'Create your first budget to track spending',
              style: Theme.of(context).textTheme.bodyMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: AppConstants.spacing24),
            FilledButton.icon(
              onPressed: () => context.push(AppRouter.addBudget),
              icon: const Icon(Icons.add),
              label: const Text('Create Budget'),
              style: FilledButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppConstants.spacing24,
                  vertical: AppConstants.spacing12,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showDeleteConfirmation(Budget budget) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete Budget'),
        content: Text(
          'Are you sure you want to delete the ${budget.category} budget?',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              _deleteBudget(budget);
            },
            style: TextButton.styleFrom(
              foregroundColor: AppColors.error,
            ),
            child: const Text('Delete'),
          ),
        ],
      ),
    );
  }

  String _formatCurrency(double amount, String currency) {
    final formatter = NumberFormat.currency(
      symbol: _getCurrencySymbol(currency),
      decimalDigits: 0,
    );
    return formatter.format(amount);
  }

  String _getCurrencySymbol(String currency) {
    switch (currency) {
      case 'USD':
        return '\$';
      case 'EUR':
        return '€';
      case 'GBP':
        return '£';
      case 'INR':
        return '₹';
      default:
        return currency;
    }
  }
}
