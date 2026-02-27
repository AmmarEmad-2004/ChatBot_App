import 'package:chatbot_app/core/validators/gemini_chat_repo_imple_input_validation.dart';
import 'package:chatbot_app/core/validators/gemini_chat_repo_imple_output_validation.dart';
import 'package:chatbot_app/modules/chat/data/services/gemini_sevice.dart';
import 'package:chatbot_app/modules/chat/data/models/chat_massage_model.dart';
import 'package:chatbot_app/modules/chat/data/repos/chat_repo.dart';

class GeminiChatRepoImple extends ChatRepo {
  final GeminiSevice _geminiSevice;

  GeminiChatRepoImple({required GeminiSevice geminiSevice})
    : _geminiSevice = geminiSevice;

  @override
  Future<ChatMassageModel> sendMessage(List<ChatMassageModel> massages) async {
    geminiChatRepoImpleInputValidation(massages);

    var response = await _geminiSevice.sendChat(massages: massages);
    geminiChatRepoImpleOutputValidation(response);

    return response;
  }
}
