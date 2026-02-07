import 'package:chatbot_app/core/services/gemini_sevice.dart';
import 'package:chatbot_app/modules/home/data/datasource/chat_local_ds_imple.dart';
import 'package:chatbot_app/modules/home/data/repo/chat_repo_imple.dart';
import 'package:chatbot_app/modules/home/presentation/logic/chat_cubit.dart';
import 'package:chatbot_app/modules/home/presentation/screens/widgets/chat_screen_body.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dio = Dio();
    final geminiDs = GeminiSevice(dio);
    final localDs = ChatLocalDsImpl(FirebaseFirestore.instance, "default");
      final chatRepo = ChatRepoImpl(geminiDs, localDs);
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocProvider(
        create: (_) => ChatCubit(chatRepo)..loadChat(),
        child: ChatScreenBody(),
      ),
    );
  }
}
