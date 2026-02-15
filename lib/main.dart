import 'package:chatbot_app/chat_bot.dart';
import 'package:chatbot_app/core/helpers/bloc_observar.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Bloc.observer = AppBlocObserver();
  runApp(DevicePreview(enabled: false, builder: (context) => ChatBot()));
}
