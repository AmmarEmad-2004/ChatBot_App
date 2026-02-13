import 'package:chatbot_app/core/constants/app_images.dart';
import 'package:chatbot_app/core/theme/app_colors.dart';
import 'package:chatbot_app/core/theme/text_styles.dart';
import 'package:chatbot_app/modules/home/data/models/chat_massage_model.dart';
import 'package:flutter/material.dart';

class ChatBubble extends StatelessWidget {
  final ChatMassageModel message;

  const ChatBubble({required this.message, super.key});

  @override
  Widget build(BuildContext context) {
    final isMe = message.role == "user"; // user or model
    final text = message.text;

    return Align(
      alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Row(
          mainAxisAlignment: isMe
              ? MainAxisAlignment.end
              : MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            if (!isMe) Image.asset(AppImages.robot2),
            Flexible(
              child: Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 24,
                  horizontal: 13,
                ),
                margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                decoration: BoxDecoration(
                  color: isMe
                      ? AppColors.primaryColor
                      : const Color(0xffeeeeee),
                  borderRadius: BorderRadius.only(
                    topLeft: const Radius.circular(30),
                    topRight: Radius.circular(isMe ? 0 : 30),
                    bottomLeft: Radius.circular(isMe ? 30 : 0),
                    bottomRight: const Radius.circular(30),
                  ),
                ),
                child: Text(
                  text,
                  style: TextStyles.textBold13(context).copyWith(
                    color: isMe ? Colors.white : const Color(0xff656565),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
