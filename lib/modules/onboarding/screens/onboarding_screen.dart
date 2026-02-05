import 'package:chatbot_app/core/constants/app_images.dart';
import 'package:chatbot_app/core/constants/constants.dart';
import 'package:chatbot_app/core/theme/app_colors.dart';
import 'package:chatbot_app/core/theme/text_styles.dart';
import 'package:flutter/material.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(
          right: 21,
          left: 21,
          bottom: 34,
          top: 60,
        ),
        child: Column(
          children: [
            Text("Your AI Assistant", style: TextStyles.textBold23(context)),
            SizedBox(height: 14),
            Text(
              onboardingText,
              textAlign: TextAlign.center,
              style: TextStyles.textMedium15(context),
            ),
            SizedBox(height: 84),
            // SvgPicture.asset(AppImages.imagesOnboarding),
            Image.asset(AppImages.imagesOnboarding2),
            Spacer(),

            CustomButton(),
          ],
        ),
      ),
    );
  }
}

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
