import 'package:flutter/material.dart';
import '../../ui/widget/app_button.dart';

class WelcomeScreen extends StatelessWidget {
  final VoidCallback onStart;

  const WelcomeScreen({super.key, required this.onStart});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade500,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/w9_quiz_app/quiz-logo.png', width: 160),
              const SizedBox(height: 24),
              AppButton('Start Quiz', icon: Icons.play_arrow, onTap: onStart),
            ],
          ),
        ),
      ),
    );
  }
}