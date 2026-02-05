import 'package:chatbot_app/chat_bot.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    DevicePreview(enabled: !kReleaseMode, builder: (context) => ChatBot()),
  );
}
