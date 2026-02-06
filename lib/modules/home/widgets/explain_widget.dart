import 'package:chatbot_app/core/constants/app_images.dart';
import 'package:chatbot_app/core/theme/text_styles.dart';
import 'package:chatbot_app/modules/home/widgets/custom_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ExplainWidget extends StatelessWidget {
  const ExplainWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SvgPicture.asset(AppImages.explain),
        Text("Explain", style: TextStyles.textBold14(context)),
        SizedBox(height: 18),
        CustomContainer(data: "Explain Quantum physics"),
        SizedBox(height: 8),
        CustomContainer(data: "What are wormholes explain like i am 5"),
      ],
    );
  }
}