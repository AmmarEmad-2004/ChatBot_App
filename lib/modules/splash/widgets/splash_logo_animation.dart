import 'package:flutter/material.dart';
import 'package:chatbot_app/core/constants/app_images.dart';

class SplashLogoAnimation extends StatelessWidget {
  final Animation<double> fadeAnimation;
  final Animation<double> scaleAnimation;

  const SplashLogoAnimation({
    super.key,
    required this.fadeAnimation,
    required this.scaleAnimation,
  });

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: fadeAnimation,
      child: ScaleTransition(
        scale: scaleAnimation,
        child: Image.asset(
          AppImages.splash2,
          width: 160,
        ),
      ),
    );
  }
}
