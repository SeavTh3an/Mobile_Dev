import 'package:flutter/material.dart';
import '../../model/quiz.dart';
import '../../model/quiz.dart' as models;
import '../../ui/widget/answer_card.dart';
import '../../ui/widget/app_button.dart';
import '../../ui/widget/result_card.dart';

class ResultScreen extends StatelessWidget {
  final Quizz quizz;
  final List<models.Answer> answers;
  final VoidCallback onRestart;

  const ResultScreen({
    super.key,
    required this.quizz,
    required this.answers,
    required this.onRestart,
  });

  int _score() => answers.fold(0, (s, a) => s + a.getPoint());

  @override
  Widget build(BuildContext context) {
    final score = _score();
    return Scaffold(
      backgroundColor: Colors.blue.shade500,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text('Results'),
      ),
      body: Column(
        children: [
          ResultCard(score: score, total: quizz.totalPoints()),
          Expanded(
            child: ListView.builder(
              itemCount: answers.length,
              itemBuilder: (_, i) => AnswerCard(answer: answers[i], index: i + 1),
            ),
          ),
          const SizedBox(height: 8),
          AppButton('Restart Quiz', icon: Icons.refresh, onTap: onRestart),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}