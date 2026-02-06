import 'package:chatbot_app/modules/home/screens/chat_screen.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';

class ChatBot extends StatelessWidget {
  const ChatBot({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        locale: DevicePreview.locale(context),
        builder: DevicePreview.appBuilder,
        home: ChatScreen(),
      ),
    );
  }
}
