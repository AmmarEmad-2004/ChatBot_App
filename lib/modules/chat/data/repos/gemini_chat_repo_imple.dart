import 'package:chatbot_app/modules/chat/data/services/gemini_sevice.dart';
import 'package:chatbot_app/modules/chat/data/models/chat_massage_model.dart';
import 'package:chatbot_app/modules/chat/data/repos/chat_repo.dart';

class GeminiChatRepoImple extends ChatRepo {
  final GeminiSevice _geminiSevice;

  GeminiChatRepoImple({required GeminiSevice geminiSevice})
    : _geminiSevice = geminiSevice;

  @override
  Future<ChatMassageModel> sendMessage(
    List<ChatMassageModel> massages,
  ) async {
    return _geminiSevice.sendChat(massages: massages);
  }

}
