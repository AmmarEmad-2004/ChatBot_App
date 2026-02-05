import 'package:chatbot_app/core/constants/constants.dart';
import 'package:chatbot_app/core/theme/text_styles.dart';
import 'package:flutter/material.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("You AI Assistant", style: TextStyles.textBold23(context)),
            Text(
              textAlign: TextAlign.center,
              onboardingText,
              style: TextStyles.textMedium15(context),
            ),
          ],
        ),
      ),
    );
  }
}
