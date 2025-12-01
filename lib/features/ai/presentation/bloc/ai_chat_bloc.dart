import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/datasources/gemini_datasource.dart';
import '../../domain/entities/ai_message.dart';
import '../../domain/usecases/get_financial_context.dart';
import 'ai_chat_event.dart';
import 'ai_chat_state.dart';

/// BLoC for managing AI chat functionality with REAL user financial data
///
/// This handles all AI-related user interactions including:
/// - General chat with financial context
/// - Expense categorization
/// - Financial insights generation (using real Firebase data)
/// - Purchase advice (using real user finances)
/// - Financial context refresh
class AIChatBloc extends Bloc<AIChatEvent, AIChatState> {
  final GeminiDatasource _geminiDatasource;
  final GetFinancialContext _getFinancialContext;
  final List<AIMessage> _messages = [];

  AIChatBloc({
    required GeminiDatasource geminiDatasource,
    required GetFinancialContext getFinancialContext,
  })  : _geminiDatasource = geminiDatasource,
        _getFinancialContext = getFinancialContext,
        super(const AIChatState.initial()) {
    on<SendMessageEvent>(_onSendMessage);
    on<LoadHistoryEvent>(_onLoadHistory);
    on<ClearHistoryEvent>(_onClearHistory);
    on<CategorizeExpenseEvent>(_onCategorizeExpense);
    on<GenerateInsightsEvent>(_onGenerateInsights);
    on<GetPurchaseAdviceEvent>(_onGetPurchaseAdvice);
    on<RefreshFinancialContextEvent>(_onRefreshFinancialContext);
  }

  /// Handle sending a message to AI with REAL financial context
  Future<void> _onSendMessage(
    SendMessageEvent event,
    Emitter<AIChatState> emit,
  ) async {
    // Add user message to history
    final userMessage = AIMessageX.user(event.message);
    _messages.add(userMessage);

    // Emit loading state
    emit(AIChatState.loading(messages: List.from(_messages)));

    try {
      // FETCH REAL USER FINANCIAL DATA
      final financialContext = await _getFinancialContext();

      // Use real context in AI prompt
      final aiResponse = await _geminiDatasource.chat(
        event.message,
        context: financialContext.toPromptContext(),
      );

      _messages.add(aiResponse);
      emit(AIChatState.success(messages: List.from(_messages)));
    } catch (e) {
      emit(AIChatState.error(
        message: 'Failed to chat with AI: ${e.toString()}',
        messages: List.from(_messages),
      ));
    }
  }

  /// Handle loading chat history
  Future<void> _onLoadHistory(
    LoadHistoryEvent event,
    Emitter<AIChatState> emit,
  ) async {
    // TODO: Load chat history from local storage (Hive)
    // For now, just emit current messages
    emit(AIChatState.success(messages: List.from(_messages)));
  }

  /// Handle clearing chat history
  Future<void> _onClearHistory(
    ClearHistoryEvent event,
    Emitter<AIChatState> emit,
  ) async {
    _messages.clear();
    // TODO: Clear chat history from local storage (Hive)
    emit(const AIChatState.initial(messages: []));
  }

  /// Handle categorizing an expense
  Future<void> _onCategorizeExpense(
    CategorizeExpenseEvent event,
    Emitter<AIChatState> emit,
  ) async {
    // Add user message
    final userMessage = AIMessageX.user(
      'Categorize this expense: "${event.description}"',
    );
    _messages.add(userMessage);

    emit(AIChatState.loading(messages: List.from(_messages)));

    try {
      final category =
          await _geminiDatasource.categorizeExpense(event.description);

      final aiMessage = AIMessageX.ai(
        'I would categorize "${event.description}" as: $category',
      );
      _messages.add(aiMessage);

      emit(AIChatState.categorySuggested(
        category: category,
        messages: List.from(_messages),
      ));
    } catch (e) {
      emit(AIChatState.error(
        message: 'Failed to categorize expense: ${e.toString()}',
        messages: List.from(_messages),
      ));
    }
  }

  /// Handle generating financial insights with REAL user data
  Future<void> _onGenerateInsights(
    GenerateInsightsEvent event,
    Emitter<AIChatState> emit,
  ) async {
    // Add user message
    final userMessage = AIMessageX.user('Generate my financial insights');
    _messages.add(userMessage);

    emit(AIChatState.loading(messages: List.from(_messages)));

    try {
      // FETCH REAL USER FINANCIAL DATA FROM FIREBASE
      final context = await _getFinancialContext();

      // Check if user has any data
      if (!context.hasData) {
        final aiMessage = AIMessageX.ai(
          'I don\'t have enough financial data to generate insights yet. '
          'Start by adding some transactions and income to get personalized advice!',
        );
        _messages.add(aiMessage);
        emit(AIChatState.success(messages: List.from(_messages)));
        return;
      }

      // Use REAL data for insights
      final insights = await _geminiDatasource.generateInsights(
        totalIncome: context.totalIncome,
        totalExpenses: context.totalExpenses,
        categoryBreakdown: context.categoryBreakdown,
        savingsRate: context.savingsRate,
        topSpendingCategories: context.topSpendingCategories,
      );

      final aiMessage = AIMessageX.ai(
        'I\'ve analyzed your ACTUAL financial data and generated ${insights.length} personalized insights for you!',
      );
      _messages.add(aiMessage);

      emit(AIChatState.insightsGenerated(
        insights: insights,
        messages: List.from(_messages),
      ));
    } catch (e) {
      emit(AIChatState.error(
        message: 'Failed to generate insights: ${e.toString()}',
        messages: List.from(_messages),
      ));
    }
  }

  /// Handle getting purchase advice with REAL user financial data
  Future<void> _onGetPurchaseAdvice(
    GetPurchaseAdviceEvent event,
    Emitter<AIChatState> emit,
  ) async {
    // Add user message
    final userMessage = AIMessageX.user(
      'Should I buy ${event.itemName} for ₹${event.itemPrice.toStringAsFixed(0)}?',
    );
    _messages.add(userMessage);

    emit(AIChatState.loading(messages: List.from(_messages)));

    try {
      // FETCH REAL USER FINANCIAL DATA
      final context = await _getFinancialContext();

      // Use REAL financial data for purchase advice
      final advice = await _geminiDatasource.shouldIBuy(
        itemName: event.itemName,
        itemPrice: event.itemPrice,
        userIncome: context.totalIncome,
        userExpenses: context.totalExpenses,
        userSavings: context.savings > 0 ? context.savings : 0,
      );

      final aiMessage = AIMessageX.ai(advice);
      _messages.add(aiMessage);

      emit(AIChatState.success(messages: List.from(_messages)));
    } catch (e) {
      emit(AIChatState.error(
        message: 'Failed to get purchase advice: ${e.toString()}',
        messages: List.from(_messages),
      ));
    }
  }

  /// Handle refreshing financial context with latest data
  Future<void> _onRefreshFinancialContext(
    RefreshFinancialContextEvent event,
    Emitter<AIChatState> emit,
  ) async {
    emit(AIChatState.loading(messages: List.from(_messages)));

    try {
      // Fetch latest data from Firebase
      final context = await _getFinancialContext();

      // Create a system message showing updated stats
      final systemMessage = AIMessageX.ai(
        '📊 Financial Data Updated!\n\n'
        '💰 Income: ₹${context.totalIncome.toStringAsFixed(0)}\n'
        '💸 Expenses: ₹${context.totalExpenses.toStringAsFixed(0)}\n'
        '💵 Savings: ₹${context.savings.toStringAsFixed(0)} (${context.savingsRate.toStringAsFixed(1)}%)\n'
        '📝 Transactions: ${context.transactionCount}\n\n'
        'I now have your latest financial information! Ask me anything.',
      );

      _messages.add(systemMessage);
      emit(AIChatState.success(messages: List.from(_messages)));
    } catch (e) {
      emit(AIChatState.error(
        message: 'Failed to refresh financial data: ${e.toString()}',
        messages: List.from(_messages),
      ));
    }
  }
}
