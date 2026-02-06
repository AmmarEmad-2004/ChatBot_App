import 'package:chatbot_app/core/constants/app_images.dart';
import 'package:chatbot_app/core/constants/constants.dart';
import 'package:chatbot_app/core/theme/text_styles.dart';
import 'package:chatbot_app/modules/onboarding/widgets/custom_button.dart';
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
            Image.asset(AppImages.onboarding2),
            Spacer(),

            CustomButton(),
          ],
        ),
      ),
    );
  }
}
