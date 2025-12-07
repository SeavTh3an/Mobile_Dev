import 'package:flutter/material.dart';

class ResultCard extends StatelessWidget {
  final int score;
  final int total;

  const ResultCard({super.key, required this.score, required this.total});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      margin: const EdgeInsets.all(16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Text(
          'You answered $score on $total !',
          style: Theme.of(context).textTheme.headlineSmall,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}