import 'package:chatbot_app/modules/chat/data/services/gemini_sevice.dart';
import 'package:chatbot_app/modules/chat/data/repos/gemini_chat_repo_imple.dart';
import 'package:chatbot_app/modules/chat/presentation/logic/chat_cubit.dart';
import 'package:chatbot_app/modules/chat/presentation/screens/widgets/chat_screen_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocProvider(
        create: (_) => ChatCubit(GeminiChatRepoImple(geminiSevice: GeminiSevice())),
        child: ChatScreenBody(),        
      ),
    );
  }
}
