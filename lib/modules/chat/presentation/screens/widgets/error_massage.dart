import 'package:chatbot_app/core/theme/text_styles.dart';
import 'package:flutter/material.dart';

class ErrorMassage extends StatelessWidget {
  const ErrorMassage({
    super.key,
    required this.onRetry,
    required this.lastMassage,
  });
  final VoidCallback onRetry;
  final String lastMassage;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      decoration: BoxDecoration(
        color: const Color(0xffeeeeee),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              lastMassage,
              style: TextStyles.textBold13(
                context,
              ).copyWith(color: const Color(0xff656565)),
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.refresh, color: Colors.white),
                    Text(
                      "Retry",
                      style: TextStyles.textBold13(
                        context,
                      ).copyWith(color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
