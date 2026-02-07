import 'package:chatbot_app/modules/home/widgets/chat_bubble.dart';
import 'package:flutter/material.dart';

class ChatScreenBody extends StatelessWidget {
  const ChatScreenBody({required this.messages, super.key});
  final List<Map<String, dynamic>> messages;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(8),
      itemCount: messages.length,
      itemBuilder: (context, index) {
        return ChatBubble(
          text: messages[index]["text"] as String,
          isMe: messages[index]["isMe"] as bool,
        );
      },
    );
  }
}
