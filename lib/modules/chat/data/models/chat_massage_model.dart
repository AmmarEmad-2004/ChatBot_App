class ChatMassageModel {
  final String role;
  final String text;

  ChatMassageModel({required this.role, required this.text});

  Map<String, dynamic> toGemini() => {
    "role": role,
    "parts": [
      {"text": text},
    ],
  };

  Map<String, dynamic> toJson() => {"role": role, "text": text};

  factory ChatMassageModel.fromJson(Map<String, dynamic> json) {
    return ChatMassageModel(role: json['role'] ?? '', text: json['text'] ?? '');
  }
}
