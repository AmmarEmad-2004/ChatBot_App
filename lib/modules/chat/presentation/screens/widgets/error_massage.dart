import 'package:chatbot_app/core/theme/text_styles.dart';
import 'package:flutter/material.dart';

class ErrorMassage extends StatelessWidget {
  const ErrorMassage({super.key, required this.onRetry});
  final VoidCallback onRetry;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      decoration: BoxDecoration(
        color: const Color(0xffeeeeee),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Column(
        children: [
          Text(
            "something went wrong",
            style: TextStyles.textBold13(
              context,
            ).copyWith(color: const Color(0xff656565)),
          ),
          Row(
            children: [
              IconButton(
                onPressed: onRetry,
                icon: Icon(Icons.refresh, color: Colors.white),
              ),
              Text(
                "Retry",
                style: TextStyles.textBold13(
                  context,
                ).copyWith(color: Colors.white),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
