import 'package:google_generative_ai/google_generative_ai.dart';
import '../../domain/entities/ai_message.dart';
import '../../domain/entities/financial_insight.dart';
import 'package:uuid/uuid.dart';

class GeminiDatasource {
  // TODO: Replace with your actual Gemini API key
  static const String _apiKey = 'add yours';

  late final GenerativeModel _model;

  GeminiDatasource() {
    _model = GenerativeModel(
      model: 'gemini-2.5-flash',
      apiKey: _apiKey,
      generationConfig: GenerationConfig(
        temperature: 0.7,
        topK: 40,
        topP: 0.95,
        maxOutputTokens: 1024,
      ),
      // safetySettings: [
      //   SafetySetting(HarmCategory.harassment, HarmBlockThreshold.medium),
      //   SafetySetting(HarmCategory.hateSpeech, HarmBlockThreshold.medium),
      //   SafetySetting(HarmCategory.sexuallyExplicit, HarmBlockThreshold.medium),
      //   SafetySetting(HarmCategory.dangerousContent, HarmBlockThreshold.medium),
      // ],
    );
  }

  /// General chat with AI assistant
  ///
  /// [message] - User's message
  /// [context] - Optional financial context for better responses
  ///
  /// Returns AI response as AIMessage
  Future<AIMessage> chat(String message, {String? context}) async {
    try {
      final prompt = context != null
          ? '''You are a helpful financial assistant. Here's the user's financial context:
$context

User question: $message

Provide helpful, concise, and actionable financial advice.'''
          : '''You are a helpful financial assistant.

User question: $message

Provide helpful, concise, and actionable financial advice.''';

      final content = [Content.text(prompt)];
      final response = await _model.generateContent(content);

      if (response.text == null || response.text!.isEmpty) {
        throw Exception('Empty response from AI');
      }

      return AIMessageX.ai(response.text!);
    } catch (e) {
      throw Exception('Failed to chat with AI: $e');
    }
  }

  /// Categorize an expense based on its description
  ///
  /// [description] - The expense description
  ///
  /// Returns one of: Food, Entertainment, Transport, Shopping, Bills,
  ///                 Healthcare, Education, Utilities, Other
  Future<String> categorizeExpense(String description) async {
    try {
      final prompt =
          '''You are an expense categorization expert.

Categorize the following expense into EXACTLY ONE of these categories:
- Food
- Entertainment
- Transport
- Shopping
- Bills
- Healthcare
- Education
- Utilities
- Other

Expense description: "$description"

Respond with ONLY the category name, nothing else.''';

      final content = [Content.text(prompt)];
      final response = await _model.generateContent(content);

      if (response.text == null || response.text!.isEmpty) {
        return 'Other';
      }

      // Clean up the response and validate
      final category = response.text!.trim();
      final validCategories = [
        'Food',
        'Entertainment',
        'Transport',
        'Shopping',
        'Bills',
        'Healthcare',
        'Education',
        'Utilities',
        'Other',
      ];

      if (validCategories.contains(category)) {
        return category;
      }

      return 'Other';
    } catch (e) {
      // Default to Other on error
      return 'Other';
    }
  }

  /// Generate financial insights based on user's financial data
  ///
  /// Returns a list of FinancialInsight objects
  Future<List<FinancialInsight>> generateInsights({
    required double totalIncome,
    required double totalExpenses,
    required Map<String, double> categoryBreakdown,
    required double savingsRate,
    required List<String> topSpendingCategories,
  }) async {
    try {
      final prompt =
          '''You are a financial advisor analyzing monthly finances.

Financial Summary:
- Total Income: \$${totalIncome.toStringAsFixed(2)}
- Total Expenses: \$${totalExpenses.toStringAsFixed(2)}
- Savings Rate: ${savingsRate.toStringAsFixed(1)}%
- Top Spending Categories: ${topSpendingCategories.join(', ')}

Category Breakdown:
${categoryBreakdown.entries.map((e) => '- ${e.key}: \$${e.value.toStringAsFixed(2)}').join('\n')}

Generate 3-5 specific, actionable financial insights. For each insight, provide:
1. A short title (max 50 characters)
2. A detailed description (2-3 sentences)
3. Priority: HIGH, MEDIUM, or LOW
4. Type: SPENDING, SAVING, BUDGET, GOAL, ANOMALY, or ACHIEVEMENT

Format each insight as:
TITLE: [title]
DESCRIPTION: [description]
PRIORITY: [priority]
TYPE: [type]
---

Generate insights now:''';

      final content = [Content.text(prompt)];
      final response = await _model.generateContent(content);

      if (response.text == null || response.text!.isEmpty) {
        throw Exception('Empty response from AI');
      }

      // Parse the response into insights
      return _parseInsights(response.text!);
    } catch (e) {
      throw Exception('Failed to generate insights: $e');
    }
  }

  /// Parse AI response into FinancialInsight objects
  List<FinancialInsight> _parseInsights(String text) {
    final insights = <FinancialInsight>[];
    final blocks = text.split('---').where((block) => block.trim().isNotEmpty);

    for (final block in blocks) {
      try {
        final lines = block.split('\n').where((line) => line.trim().isNotEmpty);
        String? title;
        String? description;
        String? priority;
        String? type;

        for (final line in lines) {
          if (line.toUpperCase().startsWith('TITLE:')) {
            title = line.substring(6).trim();
          } else if (line.toUpperCase().startsWith('DESCRIPTION:')) {
            description = line.substring(12).trim();
          } else if (line.toUpperCase().startsWith('PRIORITY:')) {
            priority = line.substring(9).trim().toUpperCase();
          } else if (line.toUpperCase().startsWith('TYPE:')) {
            type = line.substring(5).trim().toUpperCase();
          }
        }

        if (title != null && description != null) {
          insights.add(
            FinancialInsight(
              id: const Uuid().v4(),
              title: title,
              description: description,
              priority: _parsePriority(priority ?? 'MEDIUM'),
              type: _parseType(type ?? 'SPENDING'),
              generatedAt: DateTime.now(),
            ),
          );
        }
      } catch (e) {
        // Skip invalid insights
        continue;
      }
    }

    // If parsing failed, return a default insight
    if (insights.isEmpty) {
      insights.add(
        FinancialInsight(
          id: const Uuid().v4(),
          title: 'Review Your Spending',
          description: text.length > 200 ? text.substring(0, 200) : text,
          priority: InsightPriority.medium,
          type: InsightType.spending,
          generatedAt: DateTime.now(),
        ),
      );
    }

    return insights;
  }

  /// Parse priority string to enum
  InsightPriority _parsePriority(String priority) {
    switch (priority) {
      case 'HIGH':
        return InsightPriority.high;
      case 'LOW':
        return InsightPriority.low;
      default:
        return InsightPriority.medium;
    }
  }

  /// Parse type string to enum
  InsightType _parseType(String type) {
    switch (type) {
      case 'SAVING':
        return InsightType.saving;
      case 'BUDGET':
        return InsightType.budget;
      case 'GOAL':
        return InsightType.goal;
      case 'ANOMALY':
        return InsightType.anomaly;
      case 'ACHIEVEMENT':
        return InsightType.achievement;
      default:
        return InsightType.spending;
    }
  }

  /// Get AI advice on whether to make a purchase
  ///
  /// Returns personalized purchase advice
  Future<String> shouldIBuy({
    required String itemName,
    required double itemPrice,
    required double userIncome,
    required double userExpenses,
    required double userSavings,
  }) async {
    try {
      final savingsRate = userIncome > 0
          ? ((userIncome - userExpenses) / userIncome * 100)
          : 0.0;

      final prompt =
          '''You are a financial advisor helping someone decide on a purchase.

User's Financial Situation:
- Monthly Income: \$${userIncome.toStringAsFixed(2)}
- Monthly Expenses: \$${userExpenses.toStringAsFixed(2)}
- Current Savings: \$${userSavings.toStringAsFixed(2)}
- Savings Rate: ${savingsRate.toStringAsFixed(1)}%

Considering Purchase:
- Item: $itemName
- Price: \$${itemPrice.toStringAsFixed(2)}

Analyze whether this is a wise purchase. Consider:
1. Affordability (can they afford it?)
2. Impact on savings goals
3. Necessity vs. want
4. Alternative options

Provide a clear recommendation (Yes, Maybe, or No) followed by reasoning in 2-3 sentences. Be honest and helpful.''';

      final content = [Content.text(prompt)];
      final response = await _model.generateContent(content);

      if (response.text == null || response.text!.isEmpty) {
        throw Exception('Empty response from AI');
      }

      return response.text!;
    } catch (e) {
      throw Exception('Failed to get purchase advice: $e');
    }
  }

  /// Get budget recommendations based on income and spending
  ///
  /// Returns recommended budget allocations by category
  Future<Map<String, double>> recommendBudget({
    required double monthlyIncome,
    required Map<String, double> currentSpending,
  }) async {
    try {
      final prompt =
          '''You are a financial advisor creating a budget plan.

Monthly Income: \$${monthlyIncome.toStringAsFixed(2)}

Current Spending:
${currentSpending.entries.map((e) => '- ${e.key}: \$${e.value.toStringAsFixed(2)}').join('\n')}

Create a recommended monthly budget following the 50/30/20 rule (50% needs, 30% wants, 20% savings).

Provide recommendations for each category. Format as:
CATEGORY_NAME: AMOUNT
(one per line)

Example:
Food: 400.00
Entertainment: 200.00

Generate budget now:''';

      final content = [Content.text(prompt)];
      final response = await _model.generateContent(content);

      if (response.text == null || response.text!.isEmpty) {
        throw Exception('Empty response from AI');
      }

      return _parseBudgetRecommendations(response.text!);
    } catch (e) {
      throw Exception('Failed to recommend budget: $e');
    }
  }

  /// Parse budget recommendations from AI response
  Map<String, double> _parseBudgetRecommendations(String text) {
    final budget = <String, double>{};
    final lines = text.split('\n');

    for (final line in lines) {
      if (line.contains(':')) {
        final parts = line.split(':');
        if (parts.length == 2) {
          final category = parts[0].trim();
          final amountStr = parts[1].trim().replaceAll(RegExp(r'[^\d.]'), '');
          final amount = double.tryParse(amountStr);

          if (amount != null && amount > 0) {
            budget[category] = amount;
          }
        }
      }
    }

    return budget;
  }

  /// Detect spending anomalies
  ///
  /// Returns analysis of unusual spending patterns
  Future<String> detectAnomaly({
    required String category,
    required double currentSpending,
    required double averageSpending,
  }) async {
    try {
      final percentChange = averageSpending > 0
          ? ((currentSpending - averageSpending) / averageSpending * 100)
          : 0.0;

      final prompt =
          '''You are a financial analyst detecting spending anomalies.

Category: $category
Current Month Spending: \$${currentSpending.toStringAsFixed(2)}
Average Monthly Spending: \$${averageSpending.toStringAsFixed(2)}
Change: ${percentChange.toStringAsFixed(1)}%

Analyze this spending pattern and explain:
1. Is this normal or unusual?
2. Possible reasons for the change
3. Should the user be concerned?
4. Recommendations (if any)

Keep response concise (2-3 sentences).''';

      final content = [Content.text(prompt)];
      final response = await _model.generateContent(content);

      if (response.text == null || response.text!.isEmpty) {
        throw Exception('Empty response from AI');
      }

      return response.text!;
    } catch (e) {
      throw Exception('Failed to detect anomaly: $e');
    }
  }
}
