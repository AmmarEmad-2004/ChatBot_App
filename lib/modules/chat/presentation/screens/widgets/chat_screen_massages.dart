import 'package:chatbot_app/modules/chat/data/models/chat_massage_model.dart';
import 'package:chatbot_app/modules/chat/presentation/screens/widgets/ai_typing.dart';
import 'package:chatbot_app/modules/chat/presentation/screens/widgets/chat_bubble.dart';
import 'package:chatbot_app/modules/chat/presentation/screens/widgets/error_massage.dart';
import 'package:flutter/material.dart';

class ChatScreenMassages extends StatelessWidget {
  const ChatScreenMassages({
    required this.messages,
    super.key,
    required this.isTyping,
    this.hasError = false,
    this.onRetry,
  });

  final List<ChatMassageModel> messages;
  final bool isTyping;
  final bool hasError;
  final VoidCallback? onRetry;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 70),
      child: ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: messages.length + (isTyping ? 1 : 0) + (hasError ? 1 : 0),
        itemBuilder: (context, index) {
          if (hasError && index == messages.length) {
            return ErrorMassage(onRetry: onRetry ?? () {});
          } else if (isTyping &&
              index == messages.length + (hasError ? 1 : 0)) {
            return const AiTyping();
          } else {
            return ChatBubble(message: messages[index]);
          }
        },
      ),
    );
  }
}
