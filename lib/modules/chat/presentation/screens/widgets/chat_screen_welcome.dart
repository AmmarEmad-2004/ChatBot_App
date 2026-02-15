
import 'package:chatbot_app/modules/chat/presentation/screens/widgets/explain_widget.dart';
import 'package:chatbot_app/modules/chat/presentation/screens/widgets/translate_widget.dart';
import 'package:chatbot_app/modules/chat/presentation/screens/widgets/write_and_edit_widget.dart';
import 'package:flutter/material.dart';

class ChatScreenWelcome extends StatelessWidget {
  const ChatScreenWelcome({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 29),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 19),
              ExplainWidget(),
              SizedBox(height: 37),
              WriteAndEditWidget(),
              SizedBox(height: 37),
              TranslateWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
