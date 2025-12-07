import 'package:flutter/material.dart';
import '../../model/quiz.dart';
import 'app_button.dart';

class QuestionCard extends StatelessWidget {
  final Question question;
  final void Function(String selectedText) onSelect;

  const QuestionCard({
    super.key,
    required this.question,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      margin: const EdgeInsets.all(16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Text(
              question.title,
              style: Theme.of(context).textTheme.titleLarge,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            ...question.choices.map((text) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: AppButton(
                    text,
                    icon: Icons.circle_outlined,
                    onTap: () => onSelect(text),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}