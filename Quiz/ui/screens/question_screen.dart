import 'package:flutter/material.dart';
import '../../model/quiz.dart';
import '../../model/quiz.dart' as models;
import '../../ui/widget/question_card.dart';

class QuestionScreen extends StatelessWidget {
  final Quizz quizz;
  final int currentIndex;
  final void Function(models.Answer) onAnswer;
  final VoidCallback onNext;

  const QuestionScreen({
    super.key,
    required this.quizz,
    required this.currentIndex,
    required this.onAnswer,
    required this.onNext,
  });

  @override
  Widget build(BuildContext context) {
    final q = quizz.questions[currentIndex];

    return Scaffold(
      backgroundColor: Colors.blue.shade500,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text('Question ${currentIndex + 1}/${quizz.questions.length}'),
      ),
      body: Column(
        children: [
          const SizedBox(height: 12),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: QuestionCard(
              question: q,
              onSelect: (selectedText) {
                onAnswer(models.Answer(answerChoice: selectedText, question: q));
                onNext();
              },
            ),
          ),
        ],
      ),
    );
  }
}