import 'package:chatbot_app/modules/chat/data/models/chat_massage_model.dart';
import 'package:chatbot_app/modules/chat/presentation/logic/chat_cubit.dart';
import 'package:chatbot_app/modules/chat/presentation/logic/chat_state.dart';
import 'package:chatbot_app/modules/chat/presentation/screens/widgets/chat_screen_massages.dart';
import 'package:chatbot_app/modules/chat/presentation/screens/widgets/chat_screen_welcome.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatScreenMassagesConsumer extends StatelessWidget {
  const ChatScreenMassagesConsumer({super.key, required this.messages});

  final List<ChatMassageModel> messages;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ChatCubit, ChatState>(
      listener: (context, state) {
        if (state is ChatSuccess) {
          messages.add(state.massage);
        }
      },

      builder: (context, state) {
        return messages.isEmpty
            ? ChatScreenWelcome()
            : ChatScreenMassages(
                messages: messages,
                isTyping: state is ChatLoading,
                isfailuer: state is ChatFailuer,
              );
      },
    );
  }
}
