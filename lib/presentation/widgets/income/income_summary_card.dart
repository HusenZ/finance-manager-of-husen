import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_constants.dart';
import '../../../data/models/income.dart';

class IncomeSummaryCard extends StatelessWidget {
  final List<Income> incomes;
  final String currencyCode;
  final DateTime month;

  const IncomeSummaryCard({
    super.key,
    required this.incomes,
    this.currencyCode = 'INR',
    required this.month,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final currencySymbol = _getCurrencySymbol(currencyCode);

    final totalIncome = incomes.fold<double>(
      0,
      (sum, income) => sum + income.amount,
    );
    final recurringIncome = incomes
        .where((income) => income.isRecurring)
        .fold<double>(0, (sum, income) => sum + income.amount);
    final oneTimeIncome = totalIncome - recurringIncome;

    // Group by source
    final Map<String, double> sourceBreakdown = {};
    for (var income in incomes) {
      sourceBreakdown[income.source] =
          (sourceBreakdown[income.source] ?? 0) + income.amount;
    }

    // Get top source
    String topSource = 'N/A';
    double topAmount = 0;
    if (sourceBreakdown.isNotEmpty) {
      final sorted = sourceBreakdown.entries.toList()
        ..sort((a, b) => b.value.compareTo(a.value));
      topSource = sorted.first.key;
      topAmount = sorted.first.value;
    }

    return Card(
      margin: const EdgeInsets.all(AppConstants.spacing16),
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: LinearGradient(
            colors: [
              AppColors.success,
              AppColors.success.withValues(alpha: 0.8),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(AppConstants.spacing24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Total Income',
                        style: Theme.of(context).textTheme.titleMedium
                            ?.copyWith(
                              color: Colors.white.withValues(alpha: 0.9),
                              fontWeight: FontWeight.w500,
                            ),
                      ),
                      const SizedBox(height: AppConstants.spacing4),
                      Text(
                        DateFormat('MMMM yyyy').format(month),
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: Colors.white.withValues(alpha: 0.7),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    padding: const EdgeInsets.all(AppConstants.spacing12),
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.2),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Icon(
                      Icons.account_balance_wallet,
                      color: Colors.white,
                      size: 28,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: AppConstants.spacing20),

              // Total amount
              Text(
                '$currencySymbol${NumberFormat('#,##,##0.00').format(totalIncome)}',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: AppConstants.spacing8),

              // Income count
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppConstants.spacing8,
                      vertical: AppConstants.spacing4,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.2),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      '${incomes.length} ${incomes.length == 1 ? 'income' : 'incomes'}',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: AppConstants.spacing20),

              // Divider
              Container(height: 1, color: Colors.white.withValues(alpha: 0.3)),
              const SizedBox(height: AppConstants.spacing16),

              // Income breakdown
              Row(
                children: [
                  Expanded(
                    child: _buildStatItem(
                      context,
                      'Recurring',
                      '$currencySymbol${NumberFormat('#,##,##0').format(recurringIncome)}',
                      Icons.repeat,
                    ),
                  ),
                  Container(
                    width: 1,
                    height: 40,
                    color: Colors.white.withValues(alpha: 0.3),
                  ),
                  Expanded(
                    child: _buildStatItem(
                      context,
                      'One-time',
                      '$currencySymbol${NumberFormat('#,##,##0').format(oneTimeIncome)}',
                      Icons.event_note,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: AppConstants.spacing16),

              // Top source
              if (topSource != 'N/A')
                Container(
                  padding: const EdgeInsets.all(AppConstants.spacing12),
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.2),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        _getSourceIcon(topSource),
                        color: Colors.white,
                        size: 20,
                      ),
                      const SizedBox(width: AppConstants.spacing8),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Top Source',
                              style: Theme.of(context).textTheme.bodySmall
                                  ?.copyWith(
                                    color: Colors.white.withValues(alpha: 0.7),
                                  ),
                            ),
                            Text(
                              topSource,
                              style: Theme.of(context).textTheme.titleSmall
                                  ?.copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                  ),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        '$currencySymbol${NumberFormat('#,##,##0').format(topAmount)}',
                        style: Theme.of(context).textTheme.titleMedium
                            ?.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ],
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStatItem(
    BuildContext context,
    String label,
    String value,
    IconData icon,
  ) {
    return Column(
      children: [
        Icon(icon, color: Colors.white.withValues(alpha: 0.7), size: 20),
        const SizedBox(height: AppConstants.spacing4),
        Text(
          label,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
            color: Colors.white.withValues(alpha: 0.7),
          ),
        ),
        const SizedBox(height: AppConstants.spacing4),
        Text(
          value,
          style: Theme.of(context).textTheme.titleSmall?.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  String _getCurrencySymbol(String code) {
    switch (code.toUpperCase()) {
      case 'USD':
        return '\$';
      case 'EUR':
        return '€';
      case 'GBP':
        return '£';
      case 'JPY':
        return '¥';
      case 'INR':
      default:
        return '₹';
    }
  }

  IconData _getSourceIcon(String source) {
    switch (source.toLowerCase()) {
      case 'salary':
        return Icons.work;
      case 'freelance':
        return Icons.laptop;
      case 'business':
        return Icons.business;
      case 'investment':
        return Icons.trending_up;
      case 'rental':
        return Icons.home;
      case 'bonus':
        return Icons.card_giftcard;
      default:
        return Icons.attach_money;
    }
  }
}
