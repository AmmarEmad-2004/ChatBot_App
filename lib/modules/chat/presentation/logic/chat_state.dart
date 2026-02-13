import 'package:chatbot_app/modules/chat/data/models/chat_massage_model.dart';

abstract class ChatState {}

class ChatInitial extends ChatState {}

class ChatLoading extends ChatState {}

class ChatSuccess extends ChatState {
  final List<ChatMassageModel> messages;
  final bool isTyping;

  ChatSuccess(this.messages, {this.isTyping = false});
}

class ChatFailuer extends ChatState {
  final String message;
  ChatFailuer(this.message);
}
