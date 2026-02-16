class ChatMassageModel {
  final String role;
  final String text;

  ChatMassageModel({required this.role, required this.text});

  Map<String, dynamic> toGemini() => {
    "parts": [
      {"text": text},
    ],
    "role": role,
  };

  factory ChatMassageModel.fromJson(Map<String, dynamic> json) {
    return ChatMassageModel(role: json['role'] ?? '', text: json['text'] ?? '');
  }
}
