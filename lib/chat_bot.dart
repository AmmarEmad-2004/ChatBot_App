import 'package:flutter/material.dart';

class ChatBot extends StatelessWidget {
  const ChatBot({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text(
            'Hello, I am your ChatBot!',
            style: TextStyle(fontSize: 24),
          ),
        ),
      ),
    );
  }
}