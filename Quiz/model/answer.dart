import 'quiz.dart';

class Answer {
  final Question question;
  final int selectedChoiceIndex;

  const Answer({
    required this.question,
    required this.selectedChoiceIndex,
  });

  Map<String, dynamic> toMapMinimal() => {
        'questionId': question.id,
        'selectedChoiceIndex': selectedChoiceIndex,
      };

  static Answer fromMinimal(
    Map<String, dynamic> map,
    Question Function(String id) getQuestionById,
  ) {
    final q = getQuestionById(map['questionId'] as String);
    return Answer(
      question: q,
      selectedChoiceIndex: map['selectedChoiceIndex'] as int,
    );
  }
}