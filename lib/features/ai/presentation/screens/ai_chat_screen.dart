import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/ai_chat_bloc.dart';
import '../bloc/ai_chat_event.dart';
import '../bloc/ai_chat_state.dart';
import '../widgets/chat_bubble.dart';
import '../widgets/quick_action_chip.dart';
import '../widgets/insight_card.dart';

/// Main AI Chat Screen
///
/// Features:
/// - Chat interface with AI assistant
/// - Quick action chips for common tasks
/// - Purchase advisor dialog
/// - Financial insights display
/// - Empty state with suggestions
class AIChatScreen extends StatefulWidget {
  const AIChatScreen({Key? key}) : super(key: key);

  @override
  State<AIChatScreen> createState() => _AIChatScreenState();
}

class _AIChatScreenState extends State<AIChatScreen> {
  final TextEditingController _messageController = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    // Load financial context when screen opens
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        context.read<AIChatBloc>().add(
          const AIChatEvent.refreshFinancialContext(),
        );
      }
    });
  }

  @override
  void dispose() {
    _messageController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Row(
          children: [
            const Text('🤖', style: TextStyle(fontSize: 24)),
            const SizedBox(width: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'AI Financial Assistant',
                  style: theme.textTheme.titleMedium,
                ),
                Text(
                  'Powered by Gemini',
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: theme.colorScheme.onSurface.withOpacity(0.6),
                  ),
                ),
              ],
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            tooltip: 'Refresh financial data',
            onPressed: () {
              context.read<AIChatBloc>().add(
                const AIChatEvent.refreshFinancialContext(),
              );
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Refreshing financial data...'),
                  duration: Duration(seconds: 2),
                ),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.delete_outline),
            tooltip: 'Clear chat',
            onPressed: () => _showClearChatDialog(context),
          ),
        ],
      ),
      body: Column(
        children: [
          // Quick action chips
          _buildQuickActions(context),

          const Divider(height: 1),

          // Chat messages
          Expanded(
            child: BlocConsumer<AIChatBloc, AIChatState>(
              listener: (context, state) {
                // Scroll to bottom when new message arrives
                if (state is SuccessState || state is LoadingState) {
                  _scrollToBottom();
                }

                // Show insights dialog
                if (state is InsightsGeneratedState) {
                  _showInsightsDialog(context, state.insights);
                }
              },
              builder: (context, state) {
                return state.when(
                  initial: (messages) => _buildEmptyState(context),
                  loading: (messages) =>
                      _buildMessageList(context, messages, isLoading: true),
                  success: (messages) => _buildMessageList(context, messages),
                  error: (message, messages) =>
                      _buildMessageList(context, messages, error: message),
                  categorySuggested: (category, messages) =>
                      _buildMessageList(context, messages),
                  insightsGenerated: (insights, messages) =>
                      _buildMessageList(context, messages),
                );
              },
            ),
          ),

          const Divider(height: 1),

          // Message input
          _buildMessageInput(context),
        ],
      ),
    );
  }

  /// Build quick action chips
  Widget _buildQuickActions(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            QuickActionChip(
              label: 'Get Insights',
              icon: Icons.lightbulb_outline,
              onTap: () => _generateInsights(context),
            ),
            const SizedBox(width: 8),
            QuickActionChip(
              label: 'Should I Buy?',
              icon: Icons.shopping_bag_outlined,
              onTap: () => _showPurchaseAdvisorDialog(context),
            ),
            const SizedBox(width: 8),
            QuickActionChip(
              label: 'Spending Tips',
              icon: Icons.tips_and_updates_outlined,
              onTap: () =>
                  _sendMessage(context, 'Give me tips to reduce my spending'),
            ),
            const SizedBox(width: 8),
            QuickActionChip(
              label: 'Budget Help',
              icon: Icons.account_balance_wallet_outlined,
              onTap: () =>
                  _sendMessage(context, 'Help me create a budget plan'),
            ),
          ],
        ),
      ),
    );
  }

  /// Build empty state with suggestions
  Widget _buildEmptyState(BuildContext context) {
    final theme = Theme.of(context);

    return Center(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('🤖', style: TextStyle(fontSize: 64)),
            const SizedBox(height: 16),
            Text(
              'Hi! I\'m your AI Financial Assistant',
              style: theme.textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Text(
              'Ask me anything about your finances!',
              style: theme.textTheme.bodyLarge?.copyWith(
                color: theme.colorScheme.onSurface.withOpacity(0.7),
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 32),
            Text(
              'Try asking:',
              style: theme.textTheme.titleSmall?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            _buildSuggestionChip(
              context,
              'How can I save more money?',
              Icons.savings_outlined,
            ),
            const SizedBox(height: 8),
            _buildSuggestionChip(
              context,
              'Analyze my spending patterns',
              Icons.analytics_outlined,
            ),
            const SizedBox(height: 8),
            _buildSuggestionChip(
              context,
              'Create a budget plan for me',
              Icons.calculate_outlined,
            ),
          ],
        ),
      ),
    );
  }

  /// Build suggestion chip
  Widget _buildSuggestionChip(
    BuildContext context,
    String text,
    IconData icon,
  ) {
    final theme = Theme.of(context);

    return InkWell(
      onTap: () => _sendMessage(context, text),
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          border: Border.all(color: theme.colorScheme.outline.withOpacity(0.5)),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Icon(icon, size: 20, color: theme.colorScheme.primary),
            const SizedBox(width: 12),
            Expanded(child: Text(text, style: theme.textTheme.bodyMedium)),
            Icon(
              Icons.arrow_forward_ios,
              size: 16,
              color: theme.colorScheme.onSurface.withOpacity(0.4),
            ),
          ],
        ),
      ),
    );
  }

  /// Build message list
  Widget _buildMessageList(
    BuildContext context,
    List messages, {
    bool isLoading = false,
    String? error,
  }) {
    if (messages.isEmpty && !isLoading) {
      return _buildEmptyState(context);
    }

    return ListView.builder(
      controller: _scrollController,
      padding: const EdgeInsets.symmetric(vertical: 16),
      itemCount:
          messages.length + (isLoading ? 1 : 0) + (error != null ? 1 : 0),
      itemBuilder: (context, index) {
        // Show error message
        if (error != null && index == messages.length) {
          return _buildErrorMessage(context, error);
        }

        // Show loading indicator
        if (isLoading && index == messages.length) {
          return _buildLoadingIndicator(context);
        }

        // Show message
        return ChatBubble(message: messages[index]);
      },
    );
  }

  /// Build loading indicator
  Widget _buildLoadingIndicator(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: [
          Container(
            width: 36,
            height: 36,
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              shape: BoxShape.circle,
            ),
            child: const Center(
              child: Text('🤖', style: TextStyle(fontSize: 20)),
            ),
          ),
          const SizedBox(width: 8),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surfaceVariant,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  width: 16,
                  height: 16,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    valueColor: AlwaysStoppedAnimation(
                      Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Text(
                  'Thinking...',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// Build error message
  Widget _buildErrorMessage(BuildContext context, String error) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: theme.colorScheme.errorContainer,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Icon(Icons.error_outline, color: theme.colorScheme.error),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                error,
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: theme.colorScheme.onErrorContainer,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Build message input field
  Widget _buildMessageInput(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 4,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _messageController,
              decoration: InputDecoration(
                hintText: 'Ask me anything...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(24),
                ),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 12,
                ),
              ),
              maxLines: null,
              textCapitalization: TextCapitalization.sentences,
              onSubmitted: (value) {
                if (value.trim().isNotEmpty) {
                  _sendMessage(context, value);
                }
              },
            ),
          ),
          const SizedBox(width: 8),
          FloatingActionButton(
            onPressed: () {
              final message = _messageController.text.trim();
              if (message.isNotEmpty) {
                _sendMessage(context, message);
              }
            },
            mini: true,
            child: const Icon(Icons.send),
          ),
        ],
      ),
    );
  }

  /// Send message to AI (with real financial context)
  void _sendMessage(BuildContext context, String message) {
    context.read<AIChatBloc>().add(AIChatEvent.sendMessage(message));
    _messageController.clear();
  }

  /// Scroll to bottom of chat
  void _scrollToBottom() {
    Future.delayed(const Duration(milliseconds: 100), () {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  /// Show clear chat confirmation dialog
  void _showClearChatDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Clear Chat History'),
        content: const Text('Are you sure you want to clear all messages?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancel'),
          ),
          FilledButton(
            onPressed: () {
              context.read<AIChatBloc>().add(const AIChatEvent.clearHistory());
              Navigator.of(context).pop();
            },
            child: const Text('Clear'),
          ),
        ],
      ),
    );
  }

  /// Show purchase advisor dialog
  void _showPurchaseAdvisorDialog(BuildContext context) {
    final itemNameController = TextEditingController();
    final priceController = TextEditingController();

    showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text('Should I Buy This?'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: itemNameController,
              decoration: const InputDecoration(
                labelText: 'Item Name',
                hintText: 'e.g., iPhone 15',
                border: OutlineInputBorder(),
              ),
              textCapitalization: TextCapitalization.words,
            ),
            const SizedBox(height: 16),
            TextField(
              controller: priceController,
              decoration: const InputDecoration(
                labelText: 'Price',
                hintText: 'e.g., 999.99',
                border: OutlineInputBorder(),
                prefixText: '\$ ',
              ),
              keyboardType: const TextInputType.numberWithOptions(
                decimal: true,
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(),
            child: const Text('Cancel'),
          ),
          FilledButton(
            onPressed: () {
              final itemName = itemNameController.text.trim();
              final priceText = priceController.text.trim();
              final price = double.tryParse(priceText);

              if (itemName.isNotEmpty && price != null) {
                context.read<AIChatBloc>().add(
                  AIChatEvent.getPurchaseAdvice(
                    itemName: itemName,
                    itemPrice: price,
                  ),
                );
                Navigator.of(dialogContext).pop();
              }
            },
            child: const Text('Get Advice'),
          ),
        ],
      ),
    );
  }

  /// Generate financial insights (using real user data)
  void _generateInsights(BuildContext context) {
    context.read<AIChatBloc>().add(AIChatEvent.generateInsights());
  }

  /// Show insights dialog
  void _showInsightsDialog(BuildContext context, List insights) {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 500, maxHeight: 600),
          child: Column(
            children: [
              // Header
              Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    const Text('💡', style: TextStyle(fontSize: 24)),
                    const SizedBox(width: 8),
                    Text(
                      'Financial Insights',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const Spacer(),
                    IconButton(
                      icon: const Icon(Icons.close),
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                  ],
                ),
              ),
              const Divider(height: 1),
              // Insights list
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  itemCount: insights.length,
                  itemBuilder: (context, index) {
                    return InsightCard(insight: insights[index]);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
