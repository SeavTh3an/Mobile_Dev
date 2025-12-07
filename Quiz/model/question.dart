class Question {
  final String id;
  final String title;
  final List<String> choice;     
  final int correctChoice;       

  Question({
    required this.id,
    required this.title,
    required this.choice,
    required this.correctChoice,
  });

  String get correctChoiceText => choice[correctChoice];
}