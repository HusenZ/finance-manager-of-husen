import 'package:dartz/dartz.dart';
import '../../domain/entities/ai_message.dart';
import '../../domain/entities/financial_insight.dart';
import '../../domain/repositories/ai_repository.dart';
import '../datasources/gemini_datasource.dart';

/// Implementation of AIRepository
///
/// This class bridges the domain layer with the data layer,
/// implementing the repository interface and handling errors
class AIRepositoryImpl implements AIRepository {
  final GeminiDatasource _datasource;

  AIRepositoryImpl(this._datasource);

  @override
  Future<Either<String, AIMessage>> chat(
    String message, {
    String? context,
  }) async {
    try {
      final response = await _datasource.chat(message, context: context);
      return Right(response);
    } catch (e) {
      return Left('Failed to chat with AI: ${e.toString()}');
    }
  }

  @override
  Future<Either<String, String>> categorizeExpense(String description) async {
    try {
      final category = await _datasource.categorizeExpense(description);
      return Right(category);
    } catch (e) {
      return Left('Failed to categorize expense: ${e.toString()}');
    }
  }

  @override
  Future<Either<String, List<FinancialInsight>>> generateInsights({
    required double totalIncome,
    required double totalExpenses,
    required Map<String, double> categoryBreakdown,
    required double savingsRate,
    required List<String> topSpendingCategories,
  }) async {
    try {
      final insights = await _datasource.generateInsights(
        totalIncome: totalIncome,
        totalExpenses: totalExpenses,
        categoryBreakdown: categoryBreakdown,
        savingsRate: savingsRate,
        topSpendingCategories: topSpendingCategories,
      );
      return Right(insights);
    } catch (e) {
      return Left('Failed to generate insights: ${e.toString()}');
    }
  }

  @override
  Future<Either<String, String>> shouldIBuy({
    required String itemName,
    required double itemPrice,
    required double userIncome,
    required double userExpenses,
    required double userSavings,
  }) async {
    try {
      final advice = await _datasource.shouldIBuy(
        itemName: itemName,
        itemPrice: itemPrice,
        userIncome: userIncome,
        userExpenses: userExpenses,
        userSavings: userSavings,
      );
      return Right(advice);
    } catch (e) {
      return Left('Failed to get purchase advice: ${e.toString()}');
    }
  }

  @override
  Future<Either<String, Map<String, double>>> recommendBudget({
    required double monthlyIncome,
    required Map<String, double> currentSpending,
  }) async {
    try {
      final budget = await _datasource.recommendBudget(
        monthlyIncome: monthlyIncome,
        currentSpending: currentSpending,
      );
      return Right(budget);
    } catch (e) {
      return Left('Failed to recommend budget: ${e.toString()}');
    }
  }

  @override
  Future<Either<String, String>> detectAnomaly({
    required String category,
    required double currentSpending,
    required double averageSpending,
  }) async {
    try {
      final analysis = await _datasource.detectAnomaly(
        category: category,
        currentSpending: currentSpending,
        averageSpending: averageSpending,
      );
      return Right(analysis);
    } catch (e) {
      return Left('Failed to detect anomaly: ${e.toString()}');
    }
  }
}
