import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';

class ChatBot extends StatelessWidget {
  const ChatBot({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
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
