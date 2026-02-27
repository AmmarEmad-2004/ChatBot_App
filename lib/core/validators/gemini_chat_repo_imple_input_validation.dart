import 'package:chatbot_app/modules/chat/data/models/chat_massage_model.dart';

void geminiChatRepoImpleInputValidation(List<ChatMassageModel> messages) {
  const allowedRoles = ['user', 'model'];
  if (messages.isEmpty) {
    throw ArgumentError('Messages list cannot be empty');// wrap with mixin
  }

  for (final message in messages) {
    if (message.text.trim().isEmpty) {
      throw ArgumentError('Message text cannot be empty');
    }

    final role = message.role.trim();

    if (role.isEmpty) {
      throw ArgumentError('Role cannot be empty');
    }

    if (!allowedRoles.contains(role)) {
      throw ArgumentError('Invalid role');
    }

    // if (massage.role.trim().isEmpty ||
    //     !allowedRoles.contains(massage.role.trim())) {
    //   throw ArgumentError('Invalid role or missing role ${massage.role}');
    // }
  }
}
