import 'package:chatbot_app/core/constants/app_images.dart';
import 'package:chatbot_app/core/theme/text_styles.dart';
import 'package:chatbot_app/modules/chat/presentation/screens/widgets/custom_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class TranslateWidget extends StatelessWidget {
  const TranslateWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SvgPicture.asset(AppImages.translate),
        Text("Translate", style: TextStyles.textBold14(context)),
        SizedBox(height: 18),
        CustomContainer(data: "How do you say “how are you” in korean?"),
        SizedBox(height: 8),
        CustomContainer(data: "Write a poem about flower and love"),
        SizedBox(height: 8),
        CustomContainer(data: "Write a rap song lyrics about"),
      ],
    );
  }
}