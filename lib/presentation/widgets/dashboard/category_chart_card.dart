import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_constants.dart';
import '../../../core/constants/app_text_styles.dart';
import '../../../core/extensions/num_extensions.dart';

class CategoryChartCard extends StatelessWidget {
  final Map<String, double> categorySpending;
  final String currency;

  const CategoryChartCard({
    super.key,
    required this.categorySpending,
    this.currency = 'INR',
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    if (categorySpending.isEmpty) {
      return Card(
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Padding(
          padding: const EdgeInsets.all(AppConstants.spacing24),
          child: Column(
            children: [
              Icon(
                Icons.pie_chart_outline,
                size: 64,
                color: isDark
                    ? AppColors.textSecondaryDark
                    : AppColors.textSecondaryLight,
              ),
              const SizedBox(height: AppConstants.spacing16),
              Text(
                'No spending data yet',
                style: isDark
                    ? AppTextStyles.bodyMediumDark
                    : AppTextStyles.bodyMediumLight,
              ),
            ],
          ),
        ),
      );
    }

    final sortedEntries = categorySpending.entries.toList()
      ..sort((a, b) => b.value.compareTo(a.value));

    final totalSpending = categorySpending.values.fold(
      0.0,
      (sum, value) => sum + value,
    );

    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(AppConstants.spacing16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Spending by Category',
              style: isDark
                  ? AppTextStyles.labelLargeDark
                  : AppTextStyles.labelLargeLight,
            ),
            const SizedBox(height: AppConstants.spacing24),
            SizedBox(
              height: 200,
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: PieChart(
                      PieChartData(
                        sectionsSpace: 2,
                        centerSpaceRadius: 40,
                        sections: _buildPieChartSections(
                          sortedEntries,
                          totalSpending,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: AppConstants.spacing16),
                  Expanded(
                    flex: 3,
                    child: _buildLegend(sortedEntries, totalSpending, isDark),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<PieChartSectionData> _buildPieChartSections(
    List<MapEntry<String, double>> entries,
    double total,
  ) {
    final colors = AppColors.chartColors;
    return List.generate(entries.length > 5 ? 5 : entries.length, (index) {
      final entry = entries[index];
      final percentage = (entry.value / total) * 100;
      return PieChartSectionData(
        value: entry.value,
        title: '${percentage.toStringAsFixed(0)}%',
        color: colors[index % colors.length],
        radius: 50,
        titleStyle: AppTextStyles.labelSmallLight.copyWith(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      );
    });
  }

  Widget _buildLegend(
    List<MapEntry<String, double>> entries,
    double total,
    bool isDark,
  ) {
    final colors = AppColors.chartColors;
    final topEntries = entries.take(5).toList();

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: List.generate(topEntries.length, (index) {
        final entry = topEntries[index];
        final percentage = (entry.value / total) * 100;
        return Padding(
          padding: const EdgeInsets.only(bottom: AppConstants.spacing8),
          child: Row(
            children: [
              Container(
                width: 12,
                height: 12,
                decoration: BoxDecoration(
                  color: colors[index % colors.length],
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(width: AppConstants.spacing8),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      entry.key,
                      style: isDark
                          ? AppTextStyles.labelSmallDark
                          : AppTextStyles.labelSmallLight,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      '${entry.value.toCurrency(currency: currency)} (${percentage.toStringAsFixed(1)}%)',
                      style: isDark
                          ? AppTextStyles.bodySmallDark
                          : AppTextStyles.bodySmallLight,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
