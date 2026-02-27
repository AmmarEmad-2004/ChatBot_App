import 'package:chatbot_app/core/constants/constants.dart';
import 'package:chatbot_app/core/networking/api_client.dart';
import 'package:chatbot_app/modules/chat/data/models/chat_massage_model.dart';
import 'package:dio/dio.dart';

class GeminiSevice {
  final ApiClient apiClient;

  GeminiSevice({required this.apiClient});

  Future<ChatMassageModel> sendChat({
    required List<ChatMassageModel> massages,
  }) async {
    const maxRetries = 3;

    for (int i = 1; i <= maxRetries; i++) {
      try {
        final response = await apiClient.post(
          url:
              "https://generativelanguage.googleapis.com/v1beta/models/gemini-2.5-flash-lite:generateContent",
          apiKey: apiKey,
          data: {
            "contents": massages.map((massage) => massage.toGemini()).toList(),
          },
        );
        final aiText =
            response.data["candidates"][0]["content"]["parts"][0]["text"];

        return ChatMassageModel(role: "model", text: aiText);
      } on DioException catch (e) {
        if (i == maxRetries) {
          throw Exception(e.response?.data["error"]["message"]);
        }
        await Future.delayed(Duration(seconds: 1 << (i - 1)));
      }
    }

    throw Exception('Failed after $maxRetries attempts');
  }
}
