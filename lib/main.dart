import 'package:chatbot_app/chat_bot.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';

void main() {
  DevicePreview(
    enabled: !kReleaseMode,
    builder: (context) => ChatBot(), // Wrap your app
  );
}
