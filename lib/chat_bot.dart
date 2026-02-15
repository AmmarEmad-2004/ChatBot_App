import 'package:chatbot_app/core/routing/app_router.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';

class ChatBot extends StatelessWidget {
  const ChatBot({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      
      debugShowCheckedModeBanner: false,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      routerConfig: AppRouter.goRouter,
    );
  }
}
