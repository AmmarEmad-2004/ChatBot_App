import 'package:chatbot_app/modules/home/widgets/chat_screen_body.dart';
import 'package:chatbot_app/modules/home/widgets/chat_screen_header.dart';
import 'package:chatbot_app/modules/home/widgets/chat_screen_welcome.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          ChatScreenHeader(),
          SizedBox(height: 13),
          Divider(color: Color(0xffECECEC)),
          SizedBox(height: 19),
          Expanded(child: ChatScreenBody()),
        ],
      ),
    );
  }
}
