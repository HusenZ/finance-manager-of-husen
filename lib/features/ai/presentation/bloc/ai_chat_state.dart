import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/ai_message.dart';
import '../../domain/entities/financial_insight.dart';

part 'ai_chat_state.freezed.dart';

/// States for AI Chat BLoC
@freezed
class AIChatState with _$AIChatState {
  /// Initial state
  const factory AIChatState.initial({@Default([]) List<AIMessage> messages}) =
      InitialState;

  /// Loading state (AI is thinking)
  const factory AIChatState.loading({required List<AIMessage> messages}) =
      LoadingState;

  /// Success state (message received)
  const factory AIChatState.success({required List<AIMessage> messages}) =
      SuccessState;

  /// Error state
  const factory AIChatState.error({
    required String message,
    required List<AIMessage> messages,
  }) = ErrorState;

  /// Category suggested state
  const factory AIChatState.categorySuggested({
    required String category,
    required List<AIMessage> messages,
  }) = CategorySuggestedState;

  /// Insights generated state
  const factory AIChatState.insightsGenerated({
    required List<FinancialInsight> insights,
    required List<AIMessage> messages,
  }) = InsightsGeneratedState;
}
