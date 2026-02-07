import 'package:chatbot_app/modules/home/data/models/massage_model.dart';
import 'package:chatbot_app/modules/home/presentation/screens/widgets/ai_typing.dart';
import 'package:chatbot_app/modules/home/presentation/screens/widgets/chat_bubble.dart';
import 'package:flutter/material.dart';

class ChatScreenMassages extends StatelessWidget {
  const ChatScreenMassages({
    required this.messages,
    super.key,
    required this.isTyping,
  });
  final List<MassageModel> messages;
  final bool isTyping;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(8),
      itemCount: messages.length + (isTyping ? 1 : 0),
      itemBuilder: (context, index) {
        if (index < messages.length) {
          return ChatBubble(message: messages[index]);
        } else {
          return const AiTyping();
        }
      },
    );
  }
}
