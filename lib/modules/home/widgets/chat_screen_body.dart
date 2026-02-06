import 'package:chatbot_app/modules/home/widgets/chat_bubble.dart';
import 'package:flutter/material.dart';

class ChatScreenBody extends StatelessWidget {
  const ChatScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    final messages = [
      {"text": "Hello chatGPT, how are you today?", "isMe": true},
      {"text": "Hello, I'm fine. How can I help you?", "isMe": false},
      {"text": "What is the best programming language?", "isMe": true},
      {"text": "There are many programming languages...", "isMe": false},
    ];
    return ListView.builder(
      padding: const EdgeInsets.all(8),
      itemCount: messages.length,
      itemBuilder: (context, index) {
        return ChatBubble(
          text: messages[index]["text"]! as String,
          isMe: messages[index]["isMe"]! as bool,
        );
      },
    );
  }
}
