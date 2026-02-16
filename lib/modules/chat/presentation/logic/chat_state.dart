import 'package:chatbot_app/modules/chat/data/models/chat_massage_model.dart';

abstract class ChatState {}

class ChatInitial extends ChatState {}

class ChatLoading extends ChatState {}

class ChatSuccess extends ChatState {
  final ChatMassageModel massage;
  ChatSuccess({required this.massage});
}

class ChatFailuer extends ChatState {
  final String message;
  ChatFailuer(this.message);
}
