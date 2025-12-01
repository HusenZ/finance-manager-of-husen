import 'package:dartz/dartz.dart';
import '../entities/ai_message.dart';
import '../entities/financial_insight.dart';

/// Repository interface for AI operations
///
/// This follows the repository pattern to abstract away the data source
/// and provide a clean interface for the domain layer
abstract class AIRepository {
  /// Send a message to the AI and get a response
  ///
  /// [message] - The user's message
  /// [context] - Optional context about user's financial data
  ///
  /// Returns Either<String, AIMessage>
  /// - Left: Error message
  /// - Right: AI response message
  Future<Either<String, AIMessage>> chat(String message, {String? context});

  /// Get AI to categorize an expense description
  ///
  /// [description] - The expense description
  ///
  /// Returns Either<String, String>
  /// - Left: Error message
  /// - Right: Category name
  Future<Either<String, String>> categorizeExpense(String description);

  /// Generate financial insights based on user's data
  ///
  /// Returns Either<String, List<FinancialInsight>>
  /// - Left: Error message
  /// - Right: List of insights
  Future<Either<String, List<FinancialInsight>>> generateInsights({
    required double totalIncome,
    required double totalExpenses,
    required Map<String, double> categoryBreakdown,
    required double savingsRate,
    required List<String> topSpendingCategories,
  });

  /// Get AI advice on whether user should make a purchase
  ///
  /// Returns Either<String, String>
  /// - Left: Error message
  /// - Right: Purchase advice
  Future<Either<String, String>> shouldIBuy({
    required String itemName,
    required double itemPrice,
    required double userIncome,
    required double userExpenses,
    required double userSavings,
  });

  /// Get budget recommendations from AI
  ///
  /// Returns Either<String, Map<String, double>>
  /// - Left: Error message
  /// - Right: Recommended budget by category
  Future<Either<String, Map<String, double>>> recommendBudget({
    required double monthlyIncome,
    required Map<String, double> currentSpending,
  });

  /// Detect spending anomalies
  ///
  /// Returns Either<String, String>
  /// - Left: Error message
  /// - Right: Anomaly analysis
  Future<Either<String, String>> detectAnomaly({
    required String category,
    required double currentSpending,
    required double averageSpending,
  });
}
