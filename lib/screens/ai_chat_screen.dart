import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import '../core/breakpoints.dart';
import '../core/font_size.dart';
import '../core/spacing.dart';
import '../core/text_styles.dart';
import '../features/ai/domain/entities/ai_message.dart';
import '../features/ai/presentation/bloc/ai_chat_bloc.dart';
import '../features/ai/presentation/bloc/ai_chat_event.dart';
import '../features/ai/presentation/bloc/ai_chat_state.dart';
import '../features/ai/presentation/widgets/chat_bubble.dart';

class AIChatScreen extends StatefulWidget {
  const AIChatScreen({super.key});

  @override
  State<AIChatScreen> createState() => _AIChatScreenState();
}

class _AIChatScreenState extends State<AIChatScreen> {
  final _messageController = TextEditingController();
  final _scrollController = ScrollController();

  @override
  void dispose() {
    _messageController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  void _send() {
    final text = _messageController.text.trim();
    if (text.isEmpty) return;
    context.read<AIChatBloc>().add(AIChatEvent.sendMessage(text));
    _messageController.clear();
    Future<void>.delayed(const Duration(milliseconds: 200), () {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 250),
          curve: Curves.easeOut,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final isDesktop = AppBreakpoints.isDesktop(context);
    final isTablet = AppBreakpoints.isTablet(context);

    final chatBody = BlocBuilder<AIChatBloc, AIChatState>(
      builder: (context, state) {
        final messages = state.maybeWhen(
          initial: (messages) => messages,
          loading: (messages) => messages,
          success: (messages) => messages,
          error: (_, messages) => messages,
          categorySuggested: (_, messages) => messages,
          insightsGenerated: (_, messages) => messages,
          orElse: () => <AIMessage>[],
        );

        return Column(
          children: [
            Expanded(
              child: messages.isEmpty
                  ? Center(
                      child: Text(
                        'Start a conversation with AI Assistant',
                        style: AppTextStyles.bodySmall,
                      ),
                    )
                  : ListView.builder(
                      controller: _scrollController,
                      itemCount: messages.length,
                      itemBuilder: (context, index) =>
                          ChatBubble(message: messages[index]),
                    ),
            ),
            Container(
              padding: EdgeInsets.all(2.h),
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                    color: Theme.of(
                      context,
                    ).dividerColor.withValues(alpha: 0.3),
                  ),
                ),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _messageController,
                      onSubmitted: (_) => _send(),
                      decoration: const InputDecoration(
                        hintText: 'Ask about your finances',
                        prefixIcon: Icon(Icons.chat_bubble_outline_rounded),
                      ),
                    ),
                  ),
                  SizedBox(width: 1.w),
                  SizedBox(
                    height: 6.h,
                    child: FilledButton(
                      onPressed: _send,
                      child: Icon(Icons.send_rounded, size: 3.h),
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );

    if (isDesktop) {
      return Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: Row(
            children: [
              Expanded(
                flex: 30,
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 2,
                  child: Padding(
                    padding: EdgeInsets.all(2.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'History & Prompts',
                          style: AppTextStyles.titleMedium,
                        ),
                        SizedBox(height: AppSpacing.sm),
                        _promptChip('Give me spending tips'),
                        SizedBox(height: AppSpacing.sm),
                        _promptChip('Analyze my budget health'),
                        SizedBox(height: AppSpacing.sm),
                        _promptChip('How can I save more each month?'),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(width: 2.w),
              Expanded(flex: 70, child: chatBody),
            ],
          ),
        ),
      );
    }

    if (isTablet) {
      return Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 700),
          child: chatBody,
        ),
      );
    }

    return chatBody;
  }

  Widget _promptChip(String text) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () {
          _messageController.text = text;
          _send();
        },
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.all(1.4.h),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Theme.of(
              context,
            ).colorScheme.surfaceContainerHighest.withValues(alpha: 0.5),
          ),
          child: Text(text, style: TextStyle(fontSize: AppFontSize.of(13))),
        ),
      ),
    );
  }
}
