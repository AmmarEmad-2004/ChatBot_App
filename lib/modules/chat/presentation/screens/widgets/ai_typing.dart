import 'package:chatbot_app/core/constants/app_images.dart';
import 'package:flutter/widgets.dart';
import 'package:lottie/lottie.dart';

class AiTyping extends StatelessWidget {
  const AiTyping({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Row(
        children: [
          Image.asset(AppImages.robot2),
          Container(
            decoration: BoxDecoration(
              color: const Color(0xffeeeeee),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Lottie.asset(
              'assets/animations/loading.json',
              width: 30,
              height: 25,
            ),
          ),
        ],
      ),
    );
  }
}
