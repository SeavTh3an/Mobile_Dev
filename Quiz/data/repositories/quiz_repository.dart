import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import '../../model/quiz.dart';

class QuizRepository {
  final String assetPath;

  QuizRepository({required this.assetPath});

  //Load quiz from JSON
  Future<Quizz> readQuiz() async {
    final content = await rootBundle.loadString(assetPath);
    final data = jsonDecode(content);
    return Quizz.fromJson(data);
  }
}