import 'package:chatbot_app/modules/chat/data/models/chat_massage_model.dart';

abstract class ChatRepo {
  Future<ChatMassageModel> sendMessage(List<ChatMassageModel> massages);
}
