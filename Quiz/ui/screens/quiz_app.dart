import 'package:flutter/material.dart';
import '../../data/repositories/quiz_repository.dart';
import '../../model/quiz.dart';
import '../../model/quiz.dart' as models;
import '../../ui/screens/welcome_screen.dart';
import '../../ui/screens/question_screen.dart';
import '../../ui/screens/result_screen.dart';

enum AppScreen { welcome, question, result }

class QuizAppRoot extends StatefulWidget {
  const QuizAppRoot({super.key});

  @override
  State<QuizAppRoot> createState() => _QuizAppRootState();
}

class _QuizAppRootState extends State<QuizAppRoot> {
  AppScreen current = AppScreen.welcome;
  Quizz? quizz; //load quiz data
  int index = 0;
  final answers = <models.Answer>[];

  @override
  void initState() {
    super.initState();
    _loadQuizz();          
  }

  Future<void> _loadQuizz() async {
    try {
      final repo = QuizRepository(
        assetPath: 'lib/w9_quizz_app/data/quiz_data.json',
      );
      final qz = await repo.readQuiz();   
      setState(() => quizz = qz);         
    } catch (e) {
      debugPrint('Failed to load quiz_data.json: $e');
    }
  }


  void _start() {
    setState(() {
      current = AppScreen.question;
      index = 0;
      answers.clear();
    });
  }

  void _onAnswer(models.Answer a) {
    final pos = answers.indexWhere((x) => x.question.id == a.question.id);
    if (pos >= 0) {
      answers[pos] = a;
    } else {
      answers.add(a);
    }
  }

  void _next() {
    if (quizz == null) return;
    final last = index == quizz!.questions.length - 1;
    if (last) {
      setState(() => current = AppScreen.result);
    } else {
      setState(() => index += 1);
    }
  }

  void _restart() {
    setState(() {
      current = AppScreen.welcome;
      answers.clear();
      index = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    //show loading
    if (quizz == null) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    switch (current) {
      case AppScreen.welcome:
        return WelcomeScreen(onStart: _start);
      case AppScreen.question:
        return QuestionScreen(
          quizz: quizz!,
          currentIndex: index,
          onAnswer: _onAnswer,
          onNext: _next,
        );
      case AppScreen.result:
        return ResultScreen(
          quizz: quizz!,
          answers: answers,
          onRestart: _restart,
        );
    }
  }
}