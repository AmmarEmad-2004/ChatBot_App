import 'package:chatbot_app/modules/home/data/models/massage_model.dart';

abstract class ChatLocalDs {
  Future<void> saveMessage(MassageModel message);
  Future<List<MassageModel>> getHistory();
}