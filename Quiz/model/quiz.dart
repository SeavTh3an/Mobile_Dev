import 'package:uuid/uuid.dart';

var uuid = Uuid();

class Question {
  final String id;
  final String title;
  final List<String> choices;
  final int correctChoice;    // index in choices
  final int point;

  Question({
    String? id,
    required this.title,
    required this.choices,
    required this.correctChoice,
    this.point = 1,
  }) : id = id ?? uuid.v4();

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'choices': choices,
        'correctChoice': correctChoice,
        'point': point,
      };

  factory Question.fromJson(Map<String, dynamic> json) => Question(
        id: json['id'],
        title: json['title'],
        choices: List<String>.from(json['choices']),
        correctChoice: json['correctChoice'],
        point: json['point'] ?? 1,
      );
}

class Answer {
  final String id;
  final String answerChoice; 
  final Question question;    

  Answer({
    String? id,
    required this.answerChoice,
    required this.question,
  }) : id = id ?? uuid.v4();

  bool isCorrect() => answerChoice == question.choices[question.correctChoice];

  int getPoint() => isCorrect() ? question.point : 0;

  Map<String, dynamic> toJson() => {
        'id': id,
        'answerChoice': answerChoice,
        'question': question.toJson(),
      };

  factory Answer.fromJson(Map<String, dynamic> json) => Answer(
        id: json['id'],
        answerChoice: json['answerChoice'],
        question: Question.fromJson(json['question']),
      );
}

class Quizz {
  final String id;
  final List<Question> questions;

  Quizz({
    String? id,
    required this.questions,
  }) : id = id ?? uuid.v4();

  int totalPoints() => questions.fold(0, (sum, q) => sum + q.point);

  Map<String, dynamic> toJson() => {
        'id': id,
        'questions': questions.map((q) => q.toJson()).toList(),
      };

  factory Quizz.fromJson(Map<String, dynamic> json) => Quizz(
        id: json['id'],
        questions:
            (json['questions'] as List).map((q) => Question.fromJson(q)).toList(),
      );
}