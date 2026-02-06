import 'package:chatbot_app/core/constants/app_images.dart';
import 'package:chatbot_app/core/theme/text_styles.dart';
import 'package:chatbot_app/modules/home/widgets/custom_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ChatScreenWelcome extends StatelessWidget {
  const ChatScreenWelcome({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(AppImages.explain),
          Text("Explain", style: TextStyles.textBold14(context)),
          SizedBox(height: 18),
          CustomContainer(data: "Explain Quantum physics"),
        ],
      ),
    );
  }
}

