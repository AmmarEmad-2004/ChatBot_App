import 'package:chatbot_app/core/constants/app_images.dart';
import 'package:chatbot_app/core/theme/app_colors.dart';
import 'package:chatbot_app/core/theme/text_styles.dart';
import 'package:flutter/material.dart';

class ChatBubble extends StatelessWidget {
  final String text;
  final bool isMe;

  const ChatBubble({required this.text, required this.isMe, super.key});

  @override
  Widget build(BuildContext context) {
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
            Container(
              padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 13),
              margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
              decoration: BoxDecoration(
                color: isMe ? AppColors.primaryColor : Color(0xffeeeeee),
                borderRadius: BorderRadius.only(
                  topLeft: const Radius.circular(30),
                  topRight: Radius.circular(isMe ? 0 : 30),
                  bottomLeft: Radius.circular(isMe ? 30 : 0),
                  bottomRight: Radius.circular(30),
                ),
              ),
              child: Text(
                text,
                style: isMe
                    ? TextStyles.textBold13(
                        context,
                      ).copyWith(color: Colors.white)
                    : TextStyles.textBold13(
                        context,
                      ).copyWith(color: Color(0xff656565)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
