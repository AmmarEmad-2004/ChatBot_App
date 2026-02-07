
import 'package:chatbot_app/core/theme/text_styles.dart';
import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  const CustomContainer({super.key, required this.data});
  final String data;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Color(0xffF4F4F4),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Center(child: Text(data, style: TextStyles.textMedium14(context))),
    );
  }
}