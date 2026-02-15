import 'package:chatbot_app/modules/chat/data/models/chat_massage_model.dart';
import 'package:chatbot_app/modules/chat/presentation/logic/chat_cubit.dart';
import 'package:chatbot_app/modules/chat/presentation/screens/widgets/chat_screen_header.dart';
import 'package:chatbot_app/modules/chat/presentation/screens/widgets/chat_screen_massages_consumer.dart';

import 'package:chatbot_app/modules/chat/presentation/screens/widgets/custom_text_feild.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatScreenBody extends StatefulWidget {
  const ChatScreenBody({super.key});

  @override
  State<ChatScreenBody> createState() => _ChatScreenBodyState();
}

class _ChatScreenBodyState extends State<ChatScreenBody> {
  final TextEditingController controller = TextEditingController();
  final List<ChatMassageModel> allMessages = [];
  bool isTyping = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ChatScreenHeader(),
        SizedBox(height: 13),
        Divider(color: Color(0xffECECEC)),

        Expanded(
          child: Stack(
            children: [
              Positioned.fill(
                child: ChatScreenMassagesConsumer(
                  messages: allMessages,
                  isTyping: isTyping,
                ),
              ),
              Positioned(
                left: 16,
                right: 16,
                bottom: 16,
                child: CustomTextFeild(
                  controller: controller,
                  onSend: () {
                    if (controller.text.isNotEmpty) {
                      allMessages.add(
                        ChatMassageModel(role: "user", text: controller.text),
                      );
                      context.read<ChatCubit>().sendMessage([
                        ChatMassageModel(role: 'user', text: controller.text),
                      ]);
                      controller.clear();
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
