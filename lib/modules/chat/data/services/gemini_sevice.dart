import 'package:chatbot_app/core/networking/api_client.dart';
import 'package:chatbot_app/modules/chat/data/models/chat_massage_model.dart';

class GeminiSevice {
  final ApiClient apiClient = ApiClient(
    baseUrl: 'https://generativelanguage.googleapis.com/v1beta/models',
  );

  Future<ChatMassageModel> sendChat({
    required List<ChatMassageModel> massages,
  }) async {
    final response = await apiClient.post(
      url: "/gemini-3-flash-preview:generateContent",
      data: {
        "contents": massages.map((massage) => massage.toJson()).toList(),
      },
    );
    return ChatMassageModel.fromJson(response.data);
  }
}
