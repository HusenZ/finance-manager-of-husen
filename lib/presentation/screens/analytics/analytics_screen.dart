import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_constants.dart';
import '../../../core/router/app_router.dart';
import '../../../core/extensions/num_extensions.dart';
import '../../../data/models/transaction.dart';
import '../../bloc/auth/auth_bloc.dart';
import '../../bloc/auth/auth_state.dart';
import '../../bloc/transaction/transaction_bloc.dart';
import '../../bloc/transaction/transaction_event.dart';
import '../../bloc/transaction/transaction_state.dart';
import '../../bloc/income/income_bloc.dart';
import '../../bloc/income/income_event.dart';
import '../../bloc/income/income_state.dart';
import '../../widgets/common/custom_app_bar.dart';
import '../../widgets/common/error_widget.dart';
import '../../widgets/common/loading_widget.dart';

class AnalyticsScreen extends StatefulWidget {
  const AnalyticsScreen({super.key});

  @override
  State<AnalyticsScreen> createState() => _AnalyticsScreenState();
}

class _AnalyticsScreenState extends State<AnalyticsScreen> {
  DateTime _selectedMonth = DateTime.now();
  String _selectedPeriod = 'Month'; // Month, 3 Months, 6 Months, Year

  @override
  void initState() {
    super.initState();
    _loadTransactions();
  }

  void _loadTransactions() {
    final authState = context.read<AuthBloc>().state;
    if (authState is AuthAuthenticated) {
      context.read<TransactionBloc>().add(
            TransactionEvent.loadTransactions(userId: authState.user.id),
          );
      context.read<IncomeBloc>().add(
            IncomeEvent.loadIncomes(userId: authState.user.id),
          );
    }
  }

  void _changeMonth(int months) {
    setState(() {
      _selectedMonth = DateTime(
        _selectedMonth.year,
        _selectedMonth.month + months,
      );
    });
  }

  List<Transaction> _getFilteredTransactions(List<Transaction> transactions) {
    final now = _selectedMonth;
    switch (_selectedPeriod) {
      case 'Month':
        return transactions.where((t) {
          return t.date.year == now.year && t.date.month == now.month;
        }).toList();
      case '3 Months':
        final threeMonthsAgo = DateTime(now.year, now.month - 3);
        return transactions.where((t) => t.date.isAfter(threeMonthsAgo)).toList();
      case '6 Months':
        final sixMonthsAgo = DateTime(now.year, now.month - 6);
        return transactions.where((t) => t.date.isAfter(sixMonthsAgo)).toList();
      case 'Year':
        final oneYearAgo = DateTime(now.year - 1, now.month);
        return transactions.where((t) => t.date.isAfter(oneYearAgo)).toList();
      default:
        return transactions;
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final authState = context.read<AuthBloc>().state;

    if (authState is! AuthAuthenticated) {
      return Scaffold(
        appBar: const CustomAppBar(title: 'Analytics'),
        body: Center(
          child: CustomErrorWidget(
            message: 'Please sign in to view analytics',
            onRetry: () => context.go(AppRouter.login),
          ),
        ),
      );
    }

    final currency = authState.user.currency ?? 'INR';

    return Scaffold(
      backgroundColor:
          isDark ? AppColors.backgroundDark : AppColors.backgroundLight,
      appBar: const CustomAppBar(title: 'Analytics'),
      body: BlocBuilder<TransactionBloc, TransactionState>(
        builder: (context, transactionState) {
          return BlocBuilder<IncomeBloc, IncomeState>(
            builder: (context, incomeState) {
              // Show loading if either is loading
              if (transactionState is TransactionLoading ||
                  incomeState is IncomeLoading) {
                return const LoadingWidget(message: 'Loading analytics...');
              }

              // Handle errors
              if (transactionState is TransactionError) {
                return CustomErrorWidget(
                  message: transactionState.message,
                  onRetry: _loadTransactions,
                );
              }

              // Get data
              final transactions = transactionState is TransactionLoaded
                  ? transactionState.transactions
                  : <Transaction>[];

              final incomes = incomeState is IncomeLoaded
                  ? incomeState.incomes
                  : [];

              if (transactions.isEmpty && incomes.isEmpty) {
                return _buildEmptyState(context);
              }

              final filteredTransactions = _getFilteredTransactions(transactions);

              return RefreshIndicator(
                onRefresh: () async {
                  _loadTransactions();
                },
                child: SingleChildScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  child: Column(
                    children: [
                      _buildPeriodSelector(isDark),
                      _buildSummaryCards(filteredTransactions, incomes, currency, isDark),
                      _buildCategoryBreakdown(filteredTransactions, currency, isDark),
                      _buildSpendingTrend(transactions, currency, isDark),
                      _buildTopCategories(filteredTransactions, currency, isDark),
                      const SizedBox(height: AppConstants.spacing24),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }

  Widget _buildPeriodSelector(bool isDark) {
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
      child: Column(
        children: [
          // Month selector (only for Month period)
          if (_selectedPeriod == 'Month')
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: const Icon(Icons.chevron_left),
                  onPressed: () => _changeMonth(-1),
                ),
                Text(
                  DateFormat('MMMM yyyy').format(_selectedMonth),
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                IconButton(
                  icon: const Icon(Icons.chevron_right),
                  onPressed: () => _changeMonth(1),
                ),
              ],
            ),
          const SizedBox(height: AppConstants.spacing8),
          // Period chips
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: ['Month', '3 Months', '6 Months', 'Year'].map((period) {
                final isSelected = _selectedPeriod == period;
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: ChoiceChip(
                    label: Text(period),
                    selected: isSelected,
                    onSelected: (selected) {
                      if (selected) {
                        setState(() {
                          _selectedPeriod = period;
                        });
                      }
                    },
                    selectedColor: AppColors.primary.withValues(alpha: 0.2),
                    checkmarkColor: AppColors.primary,
                    labelStyle: TextStyle(
                      color: isSelected ? AppColors.primary : null,
                      fontWeight: isSelected ? FontWeight.bold : null,
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSummaryCards(
      List<Transaction> transactions, List<dynamic> incomes, String currency, bool isDark) {
    final totalSpent = transactions.fold<double>(0, (sum, t) => sum + t.amount);
    final totalIncome = incomes.fold<double>(0, (sum, income) => sum + (income.amount as double));
    final avgPerTransaction = transactions.isNotEmpty ? totalSpent / transactions.length : 0;
    final transactionCount = transactions.length;

    return Padding(
      padding: const EdgeInsets.all(AppConstants.spacing16),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: _buildSummaryCard(
                  context: context,
                  title: 'Total Income',
                  value: totalIncome.toCurrency(currency: currency),
                  icon: Icons.trending_up,
                  color: AppColors.success,
                  isDark: isDark,
                ),
              ),
              const SizedBox(width: AppConstants.spacing12),
              Expanded(
                child: _buildSummaryCard(
                  context: context,
                  title: 'Total Spent',
                  value: totalSpent.toCurrency(currency: currency),
                  icon: Icons.payments,
                  color: AppColors.error,
                  isDark: isDark,
                ),
              ),
            ],
          ),
          const SizedBox(height: AppConstants.spacing12),
          Row(
            children: [
              Expanded(
                child: _buildSummaryCard(
                  context: context,
                  title: 'Net Balance',
                  value: (totalIncome - totalSpent).toCurrency(currency: currency),
                  icon: Icons.account_balance_wallet,
                  color: totalIncome >= totalSpent ? AppColors.success : AppColors.error,
                  isDark: isDark,
                ),
              ),
              const SizedBox(width: AppConstants.spacing12),
              Expanded(
                child: _buildSummaryCard(
                  context: context,
                  title: 'Transactions',
                  value: transactionCount.toString(),
                  icon: Icons.receipt,
                  color: AppColors.primary,
                  isDark: isDark,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSummaryCard({
    required BuildContext context,
    required String title,
    required String value,
    required IconData icon,
    required Color color,
    required bool isDark,
  }) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(AppConstants.spacing12),
        child: Column(
          children: [
            Icon(icon, color: color, size: 24),
            const SizedBox(height: AppConstants.spacing8),
            Text(
              title,
              style: Theme.of(context).textTheme.bodySmall,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: AppConstants.spacing4),
            Text(
              value,
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: color,
                  ),
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryBreakdown(
      List<Transaction> transactions, String currency, bool isDark) {
    final categorySpending = <String, double>{};
    for (var transaction in transactions) {
      categorySpending[transaction.category] =
          (categorySpending[transaction.category] ?? 0) + transaction.amount;
    }

    final entries = categorySpending.entries.toList()
      ..sort((a, b) => b.value.compareTo(a.value));

    final total = entries.fold<double>(0, (sum, e) => sum + e.value);
    final topEntries = entries.take(5).toList();

    if (topEntries.isEmpty) return const SizedBox.shrink();

    return Card(
      margin: const EdgeInsets.symmetric(
        horizontal: AppConstants.spacing16,
        vertical: AppConstants.spacing8,
      ),
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(AppConstants.spacing16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Category Breakdown',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: AppConstants.spacing16),
            SizedBox(
              height: 200,
              child: PieChart(
                PieChartData(
                  sectionsSpace: 2,
                  centerSpaceRadius: 40,
                  sections: _buildPieChartSections(topEntries, total),
                ),
              ),
            ),
            const SizedBox(height: AppConstants.spacing16),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: topEntries.map((entry) {
                final percentage = (entry.value / total) * 100;
                final index = topEntries.indexOf(entry);
                final color = _getCategoryChartColor(index);
                return _buildLegendItem(
                  entry.key,
                  '${percentage.toStringAsFixed(1)}%',
                  color,
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }

  List<PieChartSectionData> _buildPieChartSections(
      List<MapEntry<String, double>> entries, double total) {
    final colors = [
      AppColors.primary,
      AppColors.success,
      AppColors.error,
      Colors.orange,
      Colors.purple,
    ];

    return List.generate(entries.length, (index) {
      final entry = entries[index];
      final percentage = (entry.value / total) * 100;
      return PieChartSectionData(
        value: entry.value,
        title: '${percentage.toStringAsFixed(0)}%',
        color: colors[index % colors.length],
        radius: 60,
        titleStyle: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      );
    });
  }

  Widget _buildSpendingTrend(
      List<Transaction> transactions, String currency, bool isDark) {
    // Group by month
    final monthlySpending = <String, double>{};

    for (var transaction in transactions) {
      final monthKey = DateFormat('MMM yy').format(transaction.date);
      monthlySpending[monthKey] = (monthlySpending[monthKey] ?? 0) + transaction.amount;
    }

    final sortedEntries = monthlySpending.entries.toList()
      ..sort((a, b) => a.key.compareTo(b.key));

    // Take last 6 months
    final last6Months = sortedEntries.length > 6
        ? sortedEntries.sublist(sortedEntries.length - 6)
        : sortedEntries;

    if (last6Months.isEmpty) return const SizedBox.shrink();

    final maxValue = last6Months.fold<double>(0, (max, e) => e.value > max ? e.value : max);

    return Card(
      margin: const EdgeInsets.symmetric(
        horizontal: AppConstants.spacing16,
        vertical: AppConstants.spacing8,
      ),
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(AppConstants.spacing16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Spending Trend',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: AppConstants.spacing16),
            SizedBox(
              height: 200,
              child: LineChart(
                LineChartData(
                  gridData: FlGridData(
                    show: true,
                    drawVerticalLine: false,
                    horizontalInterval: maxValue / 5,
                  ),
                  titlesData: FlTitlesData(
                    leftTitles: const AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                    rightTitles: const AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                    topTitles: const AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        getTitlesWidget: (value, meta) {
                          if (value.toInt() >= 0 && value.toInt() < last6Months.length) {
                            return Padding(
                              padding: const EdgeInsets.only(top: 8),
                              child: Text(
                                last6Months[value.toInt()].key,
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                            );
                          }
                          return const Text('');
                        },
                      ),
                    ),
                  ),
                  borderData: FlBorderData(show: false),
                  lineBarsData: [
                    LineChartBarData(
                      spots: List.generate(
                        last6Months.length,
                        (index) => FlSpot(
                          index.toDouble(),
                          last6Months[index].value,
                        ),
                      ),
                      isCurved: true,
                      color: AppColors.primary,
                      barWidth: 3,
                      dotData: const FlDotData(show: true),
                      belowBarData: BarAreaData(
                        show: true,
                        color: AppColors.primary.withValues(alpha: 0.2),
                      ),
                    ),
                  ],
                  minY: 0,
                  maxY: maxValue * 1.2,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTopCategories(
      List<Transaction> transactions, String currency, bool isDark) {
    final categorySpending = <String, double>{};
    for (var transaction in transactions) {
      categorySpending[transaction.category] =
          (categorySpending[transaction.category] ?? 0) + transaction.amount;
    }

    final entries = categorySpending.entries.toList()
      ..sort((a, b) => b.value.compareTo(a.value));

    final topCategories = entries.take(5).toList();

    if (topCategories.isEmpty) return const SizedBox.shrink();

    final maxValue = topCategories.first.value;

    return Card(
      margin: const EdgeInsets.symmetric(
        horizontal: AppConstants.spacing16,
        vertical: AppConstants.spacing8,
      ),
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(AppConstants.spacing16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Top Categories',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: AppConstants.spacing16),
            ...topCategories.map((entry) {
              final percentage = (entry.value / maxValue);
              return Padding(
                padding: const EdgeInsets.only(bottom: AppConstants.spacing12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(
                              _getCategoryIcon(entry.key),
                              size: 20,
                              color: AppColors.getCategoryColor(entry.key),
                            ),
                            const SizedBox(width: AppConstants.spacing8),
                            Text(
                              entry.key,
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ],
                        ),
                        Text(
                          entry.value.toCurrency(currency: currency),
                          style: Theme.of(context).textTheme.titleSmall?.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                      ],
                    ),
                    const SizedBox(height: AppConstants.spacing4),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(4),
                      child: LinearProgressIndicator(
                        value: percentage,
                        minHeight: 8,
                        backgroundColor:
                            isDark ? AppColors.borderDark : AppColors.borderLight,
                        valueColor: AlwaysStoppedAnimation<Color>(
                          AppColors.getCategoryColor(entry.key),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }),
          ],
        ),
      ),
    );
  }

  Widget _buildLegendItem(String label, String value, Color color) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 12,
          height: 12,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
        ),
        const SizedBox(width: 4),
        Text(
          '$label ($value)',
          style: Theme.of(context).textTheme.bodySmall,
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
              Icons.analytics_outlined,
              size: 80,
              color: AppColors.primary.withValues(alpha: 0.5),
            ),
            const SizedBox(height: AppConstants.spacing24),
            Text(
              'No data yet',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: AppConstants.spacing8),
            Text(
              'Add transactions to see analytics',
              style: Theme.of(context).textTheme.bodyMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: AppConstants.spacing24),
            FilledButton.icon(
              onPressed: () => context.push(AppRouter.addTransaction),
              icon: const Icon(Icons.add),
              label: const Text('Add Transaction'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNoDataState(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AppConstants.spacing24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.filter_list_off,
              size: 80,
              color: AppColors.primary.withValues(alpha: 0.5),
            ),
            const SizedBox(height: AppConstants.spacing24),
            Text(
              'No data for this period',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: AppConstants.spacing8),
            Text(
              'Try selecting a different time period',
              style: Theme.of(context).textTheme.bodyMedium,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Color _getCategoryChartColor(int index) {
    final colors = [
      AppColors.primary,
      AppColors.success,
      AppColors.error,
      Colors.orange,
      Colors.purple,
    ];
    return colors[index % colors.length];
  }

  IconData _getCategoryIcon(String category) {
    switch (category.toLowerCase()) {
      case 'food':
        return Icons.restaurant;
      case 'entertainment':
        return Icons.movie;
      case 'transportation':
        return Icons.directions_car;
      case 'shopping':
        return Icons.shopping_bag;
      case 'utilities':
        return Icons.bolt;
      case 'healthcare':
        return Icons.local_hospital;
      case 'education':
        return Icons.school;
      case 'travel':
        return Icons.flight;
      case 'groceries':
        return Icons.shopping_cart;
      default:
        return Icons.category;
    }
  }
}
