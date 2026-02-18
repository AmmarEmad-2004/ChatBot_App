import 'package:chatbot_app/modules/chat/data/models/chat_massage_model.dart';
import 'package:chatbot_app/modules/chat/presentation/logic/chat_cubit.dart';
import 'package:chatbot_app/modules/chat/presentation/screens/widgets/ai_typing.dart';
import 'package:chatbot_app/modules/chat/presentation/screens/widgets/chat_bubble.dart';
import 'package:chatbot_app/modules/chat/presentation/screens/widgets/error_massage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatScreenMassages extends StatelessWidget {
  const ChatScreenMassages({
    required this.messages,
    super.key,
    required this.isTyping, required this.isfailuer,
  });

  final List<ChatMassageModel> messages;
  final bool isTyping;
  final bool isfailuer;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 70),
      child: ListView.builder(
        reverse: true,
        padding: const EdgeInsets.all(8),
        itemCount: messages.length + (isTyping ? 1 : 0),
        itemBuilder: (context, index) {
          var newIndex = messages.length - (index + (isTyping || isfailuer ? 0 : 1));
          // or
          // var reverseList = messages.reversed.toList();
          if (isTyping && index == 0) {
            return const AiTyping();
          } 
          if(isfailuer && index == 0){
            return ErrorMassage(onRetry: () {
              context.read<ChatCubit>().sendMessage(newMessages: messages);
              },);
          }
          else {
            return ChatBubble(message: messages[newIndex]);
          }
        },
      ),
    );
  }
}
