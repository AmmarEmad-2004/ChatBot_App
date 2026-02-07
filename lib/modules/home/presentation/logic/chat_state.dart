import 'package:chatbot_app/modules/home/data/models/massage_model.dart';

abstract class ChatState {}

class ChatInitial extends ChatState {}           
class ChatLoading extends ChatState {}           
class ChatSuccess extends ChatState {             
  final List<MassageModel> messages;
  final bool isTyping;

  ChatSuccess(this.messages, {this.isTyping = false});
}
class ChatFailuer extends ChatState {              
  final String message;
  ChatFailuer(this.message);
}
