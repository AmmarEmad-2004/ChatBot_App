import 'package:chatbot_app/core/constants/app_images.dart';
import 'package:chatbot_app/core/theme/text_styles.dart';
import 'package:chatbot_app/modules/home/widgets/custom_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class WriteAndEditWidget extends StatelessWidget {
  const WriteAndEditWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SvgPicture.asset(AppImages.edit2),
        Text("Write & edit", style: TextStyles.textBold14(context)),
        SizedBox(height: 18),
        CustomContainer(data: "Write a tweet about global warming"),
        SizedBox(height: 8),
        CustomContainer(data: "Write a poem about flower and love"),
        SizedBox(height: 8),
        CustomContainer(data: "Write a rap song lyrics about"),
      ],
    );
  }
}