import 'package:chatbot_app/core/constants/app_images.dart';
import 'package:chatbot_app/core/theme/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ChatScreenHeader extends StatelessWidget {
  const ChatScreenHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.arrow_back_outlined, color: Colors.black, size: 24),
        SizedBox(width: 13),
        Image.asset(AppImages.blueRobot2),
        SizedBox(width: 20),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("ChatGPT", style: TextStyles.textBold20(context)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 6,
                  width: 6,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    shape: BoxShape.circle,
                  ),
                ),
                SizedBox(width: 5),
                Text("Online", style: TextStyles.textMedium17(context)),
              ],
            ),
          ],
        ),
    
        Spacer(),
        SvgPicture.asset(AppImages.volumeHigh),
        SizedBox(width: 19),
        SvgPicture.asset(AppImages.export),
      ],
    );
  }
}