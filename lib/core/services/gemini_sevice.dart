import 'package:chatbot_app/core/constants/constants.dart';
import 'package:chatbot_app/modules/home/data/models/massage_model.dart';
import 'package:dio/dio.dart';

class GeminiSevice {
    final Dio dio;


  GeminiSevice(this.dio,);


  Future<String> sendChat(List<MassageModel> history) async {
    final response = await dio.post(
      "$baseUrl?key=$apiKey",
      data: {
        "contents": history.map((e) => e.toGemini()).toList()
      },
    );

    return response.data["candidates"][0]
        ["content"]["parts"][0]["text"];
  }
}