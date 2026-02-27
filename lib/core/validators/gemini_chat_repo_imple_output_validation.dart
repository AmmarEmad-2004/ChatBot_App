import 'package:chatbot_app/modules/chat/data/models/chat_massage_model.dart';

ChatMassageModel geminiChatRepoImpleOutputValidation(
  ChatMassageModel response,
) {
  const allowedRoles = ['user', 'model'];

  final text = response.text.trim();
  final role = response.role.trim();

  if (text.isEmpty) {
    throw ArgumentError('Response text cannot be empty');
  }

  if (role.isEmpty) {
    throw ArgumentError('Response role cannot be empty');
  }

  if (!allowedRoles.contains(role)) {
    throw ArgumentError('Invalid response role');
  }

  return ChatMassageModel(
    role: role,
    text: text,
  );
}