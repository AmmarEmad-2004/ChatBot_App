

import 'package:chatbot_app/modules/chat/data/models/chat_massage_model.dart';
import 'package:chatbot_app/modules/chat/presentation/logic/chat_cubit.dart';
import 'package:chatbot_app/modules/chat/presentation/logic/chat_state.dart';
import 'package:chatbot_app/modules/home/presentation/screens/widgets/chat_screen_header.dart';
import 'package:chatbot_app/modules/home/presentation/screens/widgets/chat_screen_massages.dart';
import 'package:chatbot_app/modules/home/presentation/screens/widgets/chat_screen_welcome.dart';
import 'package:chatbot_app/modules/home/presentation/screens/widgets/custom_text_feild.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatScreenBody extends StatelessWidget {  
  const ChatScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController controller = TextEditingController();
    return Column(
      children: [
        ChatScreenHeader(),
        SizedBox(height: 13),
        Divider(color: Color(0xffECECEC)),

        Expanded(
          child: Stack(
            children: [
              Positioned.fill(
                child: BlocBuilder<ChatCubit, ChatState>(
                  builder: (context, state) {
                    if (state is ChatSuccess) {
                      if (state.messages.isEmpty) {
                        return const ChatScreenWelcome();
                      }
                      return ChatScreenMassages(
                        messages: state.messages,
                        isTyping: state.isTyping,
                      );
                    }

                    if (state is ChatFailuer) {
                      return Center(child: Text(state.message));
                    }

                    return const SizedBox();
                  },
                ),
              ),
              Positioned(
                left: 16,
                right: 16,
                bottom: 16,
                child: CustomTextFeild(
                  controller: controller,
                  onSend: () {
                    final text = controller.text;
                    if (text.trim().isEmpty) return;

                    context.read<ChatCubit>().sendMessage([
                      ChatMassageModel(
                        role: 'user',
                          text: controller.text,
                      ),
                    ]);
                    controller.clear();
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
