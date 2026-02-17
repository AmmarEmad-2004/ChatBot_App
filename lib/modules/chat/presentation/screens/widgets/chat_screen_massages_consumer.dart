import 'package:chatbot_app/modules/chat/data/models/chat_massage_model.dart';
import 'package:chatbot_app/modules/chat/presentation/logic/chat_cubit.dart';
import 'package:chatbot_app/modules/chat/presentation/logic/chat_state.dart';
import 'package:chatbot_app/modules/chat/presentation/screens/widgets/chat_screen_massages.dart';
import 'package:chatbot_app/modules/chat/presentation/screens/widgets/chat_screen_welcome.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatScreenMassagesConsumer extends StatefulWidget {
  const ChatScreenMassagesConsumer({super.key, required this.messages});

  final List<ChatMassageModel> messages;

  @override
  State<ChatScreenMassagesConsumer> createState() =>
      _ChatScreenMassagesConsumerState();
}

class _ChatScreenMassagesConsumerState
    extends State<ChatScreenMassagesConsumer> {
  bool hasError = false;
  String? errorMessage;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ChatCubit, ChatState>(
      listener: (context, state) {
        if (state is ChatSuccess) {
          setState(() {
            hasError = false;
            errorMessage = null;
          });
          widget.messages.add(state.massage);
        } else if (state is ChatFailuer) {
          setState(() {
            hasError = true;
            errorMessage = state.message;
          });
        }
      },

      builder: (context, state) {
        return widget.messages.isEmpty
            ? ChatScreenWelcome()
            : ChatScreenMassages(
                messages: widget.messages,
                isTyping: state is ChatLoading,
                hasError: hasError,
                onRetry: () {
                  setState(() {
                    hasError = false;
                    errorMessage = null;
                  });
                  if (widget.messages.isNotEmpty) {
                    context.read<ChatCubit>().sendMessage(
                      newMessages: widget.messages,
                    );
                  }
                },
              );
      },
    );
  }
}
