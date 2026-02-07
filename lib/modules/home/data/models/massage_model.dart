class MassageModel {
  final String role;
  final String text;

  MassageModel({required this.role, required this.text});

  Map<String, dynamic> toGemini() => {
    "role": role,
    "parts": [
      {"text": text}
    ]
  };

  Map<String, dynamic> toJson() => {
    "role": role,
    "text": text,
  };

  factory MassageModel.fromJson(Map<String, dynamic> json) {
    return MassageModel(
      role: json['role'],
      text: json['text'],
    );
  }
}
