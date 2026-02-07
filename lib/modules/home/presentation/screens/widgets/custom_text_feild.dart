import 'package:chatbot_app/core/theme/text_styles.dart';
import 'package:flutter/material.dart';

class CustomTextFeild extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onSend;

  const CustomTextFeild({
    super.key,
    required this.controller,
    required this.onSend,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            blurRadius: 10,
            color: Colors.black.withOpacity(0.1),
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                hintText: "Write your message",
                hintStyle: TextStyles.textBold13(
                  context,
                ).copyWith(color: Colors.grey),
                border: InputBorder.none,
              ),
              onSubmitted: (_) => onSend(),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.send, color: Colors.blue),
            onPressed: onSend,
          ),
        ],
      ),
    );
  }
}
