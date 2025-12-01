import 'package:freezed_annotation/freezed_annotation.dart';

part 'ai_chat_event.freezed.dart';

/// Events for AI Chat BLoC
@freezed
class AIChatEvent with _$AIChatEvent {
  /// Send a message to AI (will automatically fetch and use real financial context)
  const factory AIChatEvent.sendMessage(String message) = SendMessageEvent;

  /// Load chat history
  const factory AIChatEvent.loadHistory() = LoadHistoryEvent;

  /// Clear chat history
  const factory AIChatEvent.clearHistory() = ClearHistoryEvent;

  /// Categorize an expense
  const factory AIChatEvent.categorizeExpense(String description) =
      CategorizeExpenseEvent;

  /// Generate financial insights (uses real user data from Firebase)
  const factory AIChatEvent.generateInsights() = GenerateInsightsEvent;

  /// Get purchase advice (uses real user financial data)
  const factory AIChatEvent.getPurchaseAdvice({
    required String itemName,
    required double itemPrice,
  }) = GetPurchaseAdviceEvent;

  /// Refresh financial context with latest data from Firebase
  const factory AIChatEvent.refreshFinancialContext() =
      RefreshFinancialContextEvent;
}
