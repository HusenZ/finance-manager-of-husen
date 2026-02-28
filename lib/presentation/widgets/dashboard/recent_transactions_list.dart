import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_constants.dart';
import '../../../core/constants/app_text_styles.dart';
import '../../../core/router/app_router.dart';
import '../../../core/extensions/num_extensions.dart';
import '../../../core/utils/date_formatter.dart';
import '../../../data/models/transaction.dart';

class RecentTransactionsList extends StatelessWidget {
  final List<Transaction> transactions;
  final String currency;

  const RecentTransactionsList({
    super.key,
    required this.transactions,
    this.currency = 'INR',
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    if (transactions.isEmpty) {
      return Card(
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Padding(
          padding: const EdgeInsets.all(AppConstants.spacing24),
          child: Column(
            children: [
              Icon(
                Icons.receipt_long_outlined,
                size: 64,
                color: isDark
                    ? AppColors.textSecondaryDark
                    : AppColors.textSecondaryLight,
              ),
              const SizedBox(height: AppConstants.spacing16),
              Text(
                'No transactions yet',
                style: isDark
                    ? AppTextStyles.bodyMediumDark
                    : AppTextStyles.bodyMediumLight,
              ),
              const SizedBox(height: AppConstants.spacing8),
              Text(
                'Add your first transaction to get started',
                style: isDark
                    ? AppTextStyles.bodySmallDark
                    : AppTextStyles.bodySmallLight,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      );
    }

    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(AppConstants.spacing16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Recent Transactions',
                  style: isDark
                      ? AppTextStyles.labelLargeDark
                      : AppTextStyles.labelLargeLight,
                ),
                TextButton(
                  onPressed: () {
                    context.push(AppRouter.transactions);
                  },
                  child: Text(
                    'See All',
                    style: AppTextStyles.labelMediumLight.copyWith(
                      color: AppColors.primary,
                    ),
                  ),
                ),
              ],
            ),
          ),
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: transactions.length > 5 ? 5 : transactions.length,
            separatorBuilder: (context, index) => Divider(
              height: 1,
              color: isDark ? AppColors.borderDark : AppColors.borderLight,
            ),
            itemBuilder: (context, index) {
              final transaction = transactions[index];
              return _buildTransactionItem(transaction, isDark, context);
            },
          ),
        ],
      ),
    );
  }

  Widget _buildTransactionItem(
    Transaction transaction,
    bool isDark,
    BuildContext context,
  ) {
    final categoryColor = AppColors.getCategoryColor(transaction.category);

    return InkWell(
      onTap: () {
        context.push('${AppRouter.transactions}/${transaction.id}');
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppConstants.spacing16,
          vertical: AppConstants.spacing12,
        ),
        child: Row(
          children: [
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: categoryColor.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(
                _getCategoryIcon(transaction.category),
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
                    transaction.description,
                    style: isDark
                        ? AppTextStyles.bodyMediumDark
                        : AppTextStyles.bodyMediumLight,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: AppConstants.spacing4),
                  Row(
                    children: [
                      Text(
                        transaction.category,
                        style: isDark
                            ? AppTextStyles.bodySmallDark
                            : AppTextStyles.bodySmallLight,
                      ),
                      const SizedBox(width: AppConstants.spacing8),
                      Text(
                        '•',
                        style: isDark
                            ? AppTextStyles.bodySmallDark
                            : AppTextStyles.bodySmallLight,
                      ),
                      const SizedBox(width: AppConstants.spacing8),
                      Text(
                        DateFormatter.getRelativeDate(transaction.date),
                        style: isDark
                            ? AppTextStyles.bodySmallDark
                            : AppTextStyles.bodySmallLight,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(width: AppConstants.spacing12),
            Text(
              transaction.amount.toCurrency(currency: currency),
              style:
                  (isDark
                          ? AppTextStyles.labelMediumDark
                          : AppTextStyles.labelMediumLight)
                      .copyWith(
                        color: AppColors.error,
                        fontWeight: FontWeight.w600,
                      ),
            ),
          ],
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
