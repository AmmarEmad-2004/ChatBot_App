
import 'package:chatbot_app/core/theme/app_colors.dart';
import 'package:chatbot_app/core/theme/text_styles.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Expanded(
              child: Center(
                child: Text('Continue', style: TextStyles.textBold19(context)),
              ),
            ),

            Icon(Icons.arrow_forward_outlined, color: Colors.white, size: 24),
          ],
        ),
      ),
    );
  }
}