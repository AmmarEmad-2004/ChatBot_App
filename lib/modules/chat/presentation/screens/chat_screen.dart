import 'package:chatbot_app/core/utils/setup_get_it.dart';
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
        create: (_) => getIt<ChatCubit>(),
        child: ChatScreenBody(),
      ),
    );
  }
}
