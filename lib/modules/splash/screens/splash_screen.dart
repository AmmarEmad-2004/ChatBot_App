import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Hello, I am your ChatBot!',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}