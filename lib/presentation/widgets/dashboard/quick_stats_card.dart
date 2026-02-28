import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_constants.dart';
import '../../../core/constants/app_text_styles.dart';
import '../../../core/extensions/num_extensions.dart';

class QuickStatsCard extends StatelessWidget {
  final double currentMonthSpending;
  final double lastMonthSpending;
  final int transactionCount;
  final String currency;

  const QuickStatsCard({
    super.key,
    required this.currentMonthSpending,
    required this.lastMonthSpending,
    required this.transactionCount,
    this.currency = 'INR',
  });

  double get percentageChange {
    if (lastMonthSpending == 0) return 0;
    return ((currentMonthSpending - lastMonthSpending) / lastMonthSpending) *
        100;
  }

  bool get isIncrease => percentageChange > 0;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(AppConstants.spacing16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'This Month',
                  style: isDark
                      ? AppTextStyles.labelLargeDark
                      : AppTextStyles.labelLargeLight,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppConstants.spacing8,
                    vertical: AppConstants.spacing4,
                  ),
                  decoration: BoxDecoration(
                    color: isIncrease
                        ? AppColors.error.withValues(alpha: 0.1)
                        : AppColors.success.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        isIncrease ? Icons.trending_up : Icons.trending_down,
                        size: 16,
                        color: isIncrease ? AppColors.error : AppColors.success,
                      ),
                      const SizedBox(width: AppConstants.spacing4),
                      Text(
                        '${percentageChange.abs().toStringAsFixed(1)}%',
                        style:
                            (isDark
                                    ? AppTextStyles.labelSmallDark
                                    : AppTextStyles.labelSmallLight)
                                .copyWith(
                                  color: isIncrease
                                      ? AppColors.error
                                      : AppColors.success,
                                  fontWeight: FontWeight.w600,
                                ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: AppConstants.spacing12),
            Text(
              currentMonthSpending.toCurrency(currency: currency),
              style: isDark
                  ? AppTextStyles.heading2Dark.copyWith(
                      fontWeight: FontWeight.bold,
                    )
                  : AppTextStyles.heading2Light.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
            ),
            const SizedBox(height: AppConstants.spacing4),
            Text(
              'Last month: ${lastMonthSpending.toCurrency(currency: currency)}',
              style: isDark
                  ? AppTextStyles.bodySmallDark
                  : AppTextStyles.bodySmallLight,
            ),
            const SizedBox(height: AppConstants.spacing16),
            Divider(
              color: isDark ? AppColors.borderDark : AppColors.borderLight,
            ),
            const SizedBox(height: AppConstants.spacing12),
            Row(
              children: [
                Icon(Icons.receipt_long, size: 20, color: AppColors.primary),
                const SizedBox(width: AppConstants.spacing8),
                Text(
                  '$transactionCount transactions',
                  style: isDark
                      ? AppTextStyles.bodyMediumDark
                      : AppTextStyles.bodyMediumLight,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
