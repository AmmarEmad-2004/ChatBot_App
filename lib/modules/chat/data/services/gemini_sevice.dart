import 'package:chatbot_app/core/constants/constants.dart';
import 'package:chatbot_app/core/networking/api_client.dart';
import 'package:chatbot_app/modules/chat/data/models/chat_massage_model.dart';
import 'package:dio/dio.dart';

class GeminiSevice {
  final ApiClient apiClient = ApiClient(
    baseUrl: 'https://generativelanguage.googleapis.com/v1beta/models',
    apiKey: apiKey,
  );

  Future<ChatMassageModel> sendChat({
    required List<ChatMassageModel> massages,
  }) async {
    try {
      final response = await apiClient.post(
        url: "/gemini-2.5-flash-lite:generateContent",
        data: {
          "contents": massages.map((massage) => massage.toGemini()).toList(),
        },
      );
      final aiText =
          response.data["candidates"][0]["content"]["parts"][0]["text"];

      return ChatMassageModel(role: "model", text: aiText);
    } on DioException catch (e) {
      print("STATUS: ${e.response?.statusCode}");
      print("DATA: ${e.response?.data}");
      rethrow;
    }
  }
}
