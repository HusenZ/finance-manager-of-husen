import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_constants.dart';
import '../../../core/constants/app_text_styles.dart';
import '../../../core/extensions/num_extensions.dart';
import '../../../data/models/budget.dart';

class BudgetCard extends StatelessWidget {
  final Budget budget;
  final String currency;
  final VoidCallback onTap;
  final VoidCallback? onDelete;

  const BudgetCard({
    super.key,
    required this.budget,
    required this.currency,
    required this.onTap,
    this.onDelete,
  });

  Color _getStatusColor() {
    if (budget.isExceeded) {
      return AppColors.error;
    } else if (budget.isWarning) {
      return Colors.orange;
    } else {
      return AppColors.success;
    }
  }

  IconData _getStatusIcon() {
    if (budget.isExceeded) {
      return Icons.error;
    } else if (budget.isWarning) {
      return Icons.warning;
    } else {
      return Icons.check_circle;
    }
  }

  String _getStatusText() {
    if (budget.isExceeded) {
      return 'Budget exceeded';
    } else if (budget.isWarning) {
      return 'Near limit';
    } else {
      return 'On track';
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final categoryColor = AppColors.getCategoryColor(budget.category);
    final statusColor = _getStatusColor();
    final percentage = budget.percentage;

    return Card(
      margin: const EdgeInsets.symmetric(
        horizontal: AppConstants.spacing16,
        vertical: AppConstants.spacing8,
      ),
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.all(AppConstants.spacing16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Row(
                children: [
                  Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                      color: categoryColor.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Icon(
                      _getCategoryIcon(budget.category),
                      color: categoryColor,
                      size: 24,
                    ),
                  ),
                  const SizedBox(width: AppConstants.spacing12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          budget.category,
                          style: isDark
                              ? AppTextStyles.labelLargeDark
                              : AppTextStyles.labelLargeLight,
                        ),
                        const SizedBox(height: AppConstants.spacing4),
                        Row(
                          children: [
                            Icon(
                              _getStatusIcon(),
                              size: 14,
                              color: statusColor,
                            ),
                            const SizedBox(width: AppConstants.spacing4),
                            Text(
                              _getStatusText(),
                              style:
                                  (isDark
                                          ? AppTextStyles.bodySmallDark
                                          : AppTextStyles.bodySmallLight)
                                      .copyWith(color: statusColor),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  if (onDelete != null)
                    IconButton(
                      icon: Icon(Icons.delete_outline, color: AppColors.error),
                      onPressed: onDelete,
                    ),
                ],
              ),
              const SizedBox(height: AppConstants.spacing16),

              // Progress Bar
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Spent',
                        style: isDark
                            ? AppTextStyles.bodySmallDark
                            : AppTextStyles.bodySmallLight,
                      ),
                      Text(
                        '${percentage.toStringAsFixed(1)}%',
                        style:
                            (isDark
                                    ? AppTextStyles.labelMediumDark
                                    : AppTextStyles.labelMediumLight)
                                .copyWith(
                                  color: statusColor,
                                  fontWeight: FontWeight.bold,
                                ),
                      ),
                    ],
                  ),
                  const SizedBox(height: AppConstants.spacing8),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: LinearProgressIndicator(
                      value: percentage / 100,
                      minHeight: 8,
                      backgroundColor: isDark
                          ? AppColors.borderDark
                          : AppColors.borderLight,
                      valueColor: AlwaysStoppedAnimation<Color>(statusColor),
                    ),
                  ),
                  const SizedBox(height: AppConstants.spacing8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        budget.spent.toCurrency(currency: currency),
                        style: isDark
                            ? AppTextStyles.bodyMediumDark
                            : AppTextStyles.bodyMediumLight,
                      ),
                      Text(
                        'of ${budget.limit.toCurrency(currency: currency)}',
                        style: isDark
                            ? AppTextStyles.bodySmallDark
                            : AppTextStyles.bodySmallLight,
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: AppConstants.spacing8),

              // Remaining Amount
              Container(
                padding: const EdgeInsets.all(AppConstants.spacing12),
                decoration: BoxDecoration(
                  color: isDark
                      ? AppColors.surfaceDark
                      : AppColors.backgroundLight,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Remaining',
                      style: isDark
                          ? AppTextStyles.bodySmallDark
                          : AppTextStyles.bodySmallLight,
                    ),
                    Text(
                      budget.remaining.toCurrency(currency: currency),
                      style:
                          (isDark
                                  ? AppTextStyles.labelMediumDark
                                  : AppTextStyles.labelMediumLight)
                              .copyWith(
                                color: budget.remaining >= 0
                                    ? AppColors.success
                                    : AppColors.error,
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
