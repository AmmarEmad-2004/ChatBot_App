import 'package:flutter/material.dart';

class CustomErrorWidget extends StatelessWidget {
  const CustomErrorWidget({super.key, this.onRetry});
final void Function()? onRetry;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onRetry,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Column(
            children: [
              Text(
                'An error occurred.',
                style: TextStyle(color: Colors.white),
              ),
              Row(
                children: [
                  Text(
                    'Tap to retry.',
                    style: TextStyle(color: Colors.white70),
                  ),
                  Icon( Icons.refresh, color: Colors.white70),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}