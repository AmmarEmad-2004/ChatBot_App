import 'package:chatbot_app/modules/home/widgets/chat_screen_header.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 30, right: 30, top: 30),
        child: Column(children: [ChatScreenHeader()]),
      ),
    );
  }
}

class ChatScreenBody extends StatelessWidget {
  const ChatScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child: Text("Home Screen"));
  }
}

class ChatScreenWelcome extends StatelessWidget {
  const ChatScreenWelcome({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Welcome to ChatBot App"),
        SizedBox(height: 16),
        Text("Your AI Assistant"),
      ],
    );
  }
}
