import 'package:chatbot_app/modules/home/presentation/screens/widgets/chat_screen_body.dart';
import 'package:chatbot_app/modules/home/presentation/screens/widgets/chat_screen_header.dart';
import 'package:chatbot_app/modules/home/presentation/screens/widgets/chat_screen_welcome.dart';
import 'package:chatbot_app/modules/home/presentation/screens/widgets/custom_text_feild.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController controller = TextEditingController();
  bool showWelcome = true;
  final List<Map<String, dynamic>> messages = [];

  void sendMessage(String text) {
    if (text.trim().isEmpty) return;

    setState(() {
      if (showWelcome) showWelcome = false;
      messages.add({"text": text, "isMe": true});

      messages.add({"text": "Hello! I am a bot.", "isMe": false});
    });

    controller.clear();
  }

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
          Expanded(
            child: Stack(
              children: [
                Positioned.fill(
                  child: showWelcome
                      ? ChatScreenWelcome()
                      : ChatScreenBody(messages: messages),
                ),
                Positioned(
                  left: 16,
                  right: 16,
                  bottom: 16,
                  child: CustomTextFeild(
                    controller: controller,
                    onSend: () {
                      sendMessage(controller.text);
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
