import 'package:chatbot_app/modules/home/widgets/explain_widget.dart';
import 'package:chatbot_app/modules/home/widgets/translate_widget.dart';
import 'package:chatbot_app/modules/home/widgets/write_and_edit_widget.dart';
import 'package:flutter/material.dart';

class ChatScreenWelcome extends StatelessWidget {
  const ChatScreenWelcome({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 29),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ExplainWidget(),
            SizedBox(height: 37),
            WriteAndEditWidget(),
            SizedBox(height: 37),
            TranslateWidget(),
          ],
        ),
      ),
    );
  }
}
