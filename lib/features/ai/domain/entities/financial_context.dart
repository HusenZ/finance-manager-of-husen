import 'package:freezed_annotation/freezed_annotation.dart';

part 'financial_context.freezed.dart';
part 'financial_context.g.dart';

/// Entity representing a user's complete financial context
///
/// This aggregates all financial data for AI to provide personalized advice
@freezed
class FinancialContext with _$FinancialContext {
  const FinancialContext._();

  const factory FinancialContext({
    required double totalIncome,
    required double totalExpenses,
    required double savings,
    required double savingsRate,
    required Map<String, double> categoryBreakdown,
    required List<String> topSpendingCategories,
    required Map<String, double> incomeSourceBreakdown,
    required int transactionCount,
    required DateTime periodStart,
    required DateTime periodEnd,
  }) = _FinancialContext;

  factory FinancialContext.fromJson(Map<String, dynamic> json) =>
      _$FinancialContextFromJson(json);

  /// Format financial context as a string for AI prompts
  ///
  /// This creates a well-structured prompt that provides the AI with
  /// all necessary context about the user's actual financial situation
  String toPromptContext() {
    final monthName = _getMonthName(periodStart.month);
    final year = periodStart.year;

    return '''
User's Financial Profile ($monthName $year):

💰 Income & Expenses:
- Total Income: ₹${totalIncome.toStringAsFixed(0)}
- Total Expenses: ₹${totalExpenses.toStringAsFixed(0)}
- Net Savings: ₹${savings.toStringAsFixed(0)}
- Savings Rate: ${savingsRate.toStringAsFixed(1)}%

📊 Spending by Category:
${categoryBreakdown.isEmpty ? '- No expenses recorded yet' : categoryBreakdown.entries.map((e) => '- ${e.key}: ₹${e.value.toStringAsFixed(0)} (${((e.value / totalExpenses) * 100).toStringAsFixed(1)}%)').join('\n')}

🔝 Top Spending Areas: ${topSpendingCategories.isEmpty ? 'None yet' : topSpendingCategories.join(', ')}

📈 Income Sources:
${incomeSourceBreakdown.isEmpty ? '- No income recorded yet' : incomeSourceBreakdown.entries.map((e) => '- ${e.key}: ₹${e.value.toStringAsFixed(0)} (${((e.value / totalIncome) * 100).toStringAsFixed(1)}%)').join('\n')}

📝 Total Transactions: $transactionCount

Use this ACTUAL user data to provide personalized financial advice. Be specific and reference their real numbers.
''';
  }

  /// Get month name from month number
  String _getMonthName(int month) {
    const months = [
      'January',
      'February',
      'March',
      'April',
      'May',
      'June',
      'July',
      'August',
      'September',
      'October',
      'November',
      'December',
    ];
    return months[month - 1];
  }

  /// Check if user has any financial data
  bool get hasData => totalIncome > 0 || totalExpenses > 0;

  /// Get financial health score (0-100)
  double get healthScore {
    if (!hasData) return 0;

    double score = 0;

    // Savings rate contributes 40% to score
    if (savingsRate >= 20) {
      score += 40;
    } else if (savingsRate >= 10) {
      score += 30;
    } else if (savingsRate > 0) {
      score += 20;
    }

    // Income-to-expense ratio contributes 30%
    if (totalIncome > totalExpenses) {
      final ratio = totalExpenses / totalIncome;
      if (ratio <= 0.7) {
        score += 30;
      } else if (ratio <= 0.85) {
        score += 20;
      } else {
        score += 10;
      }
    }

    // Diversification contributes 30%
    final categoryCount = categoryBreakdown.length;
    if (categoryCount >= 5) {
      score += 30;
    } else if (categoryCount >= 3) {
      score += 20;
    } else if (categoryCount > 0) {
      score += 10;
    }

    return score.clamp(0, 100);
  }
}
