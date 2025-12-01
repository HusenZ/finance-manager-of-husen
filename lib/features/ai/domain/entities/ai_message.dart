import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uuid/uuid.dart';

part 'ai_message.freezed.dart';
part 'ai_message.g.dart';

/// Entity representing a chat message in the AI conversation
///
/// This follows clean architecture principles by keeping the entity
/// independent of any external frameworks or data sources
@freezed
class AIMessage with _$AIMessage {
  const AIMessage._();

  const factory AIMessage({
    required String id,
    required String content,
    required bool isUser,
    required DateTime timestamp,
    String? context,
  }) = _AIMessage;

  factory AIMessage.fromJson(Map<String, dynamic> json) =>
      _$AIMessageFromJson(json);
}

/// Extension methods for easy AIMessage creation
extension AIMessageX on AIMessage {
  /// Create a user message
  static AIMessage user(String content, {String? context}) {
    return AIMessage(
      id: const Uuid().v4(),
      content: content,
      isUser: true,
      timestamp: DateTime.now(),
      context: context,
    );
  }

  /// Create an AI response message
  static AIMessage ai(String content) {
    return AIMessage(
      id: const Uuid().v4(),
      content: content,
      isUser: false,
      timestamp: DateTime.now(),
    );
  }
}
