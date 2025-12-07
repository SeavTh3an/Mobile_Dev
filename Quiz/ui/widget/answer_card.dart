import 'package:flutter/material.dart';
import '../../model/quiz.dart' as models;

class AnswerCard extends StatelessWidget {
  final models.Answer answer;
  final int index; 

  const AnswerCard({
    super.key,
    required this.answer,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    final q = answer.question;
    final correctText = q.choices[q.correctChoice];
    final isCorrect = answer.isCorrect();

    return Card(
      color: Colors.white,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.lightBlue.shade50,
          child: Text('$index', style: const TextStyle(color: Colors.blue)),
        ),
        title: Text(q.title),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              answer.answerChoice,
              style: TextStyle(color: isCorrect ? Colors.green : Colors.red),
            ),
            if (!isCorrect)
              Text('Correct: $correctText',
                  style: const TextStyle(color: Colors.green)),
          ],
        ),
        trailing: Icon(
          isCorrect ? Icons.check_circle : Icons.cancel,
          color: isCorrect ? Colors.green : Colors.red,
        ),
      ),
    );
  }
}