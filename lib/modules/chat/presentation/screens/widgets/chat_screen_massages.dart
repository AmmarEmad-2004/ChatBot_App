import 'package:chatbot_app/modules/chat/data/models/chat_massage_model.dart';
import 'package:chatbot_app/modules/chat/presentation/screens/widgets/ai_typing.dart';
import 'package:chatbot_app/modules/chat/presentation/screens/widgets/chat_bubble.dart';
import 'package:flutter/material.dart';

class ChatScreenMassages extends StatelessWidget {
  const ChatScreenMassages({
    required this.messages,
    super.key,
    required this.isTyping,
  });

  final List<ChatMassageModel> messages;
  final bool isTyping;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 70),
      child: ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: messages.length + (isTyping ? 1 : 0),
        itemBuilder: (context, index) {
          if (isTyping && index == messages.length) {
            return const AiTyping();
          } else {
            return ChatBubble(message: messages[index]);
          }
        },
      ),
    );
  }
}
