import 'package:first_app/W7/EXERCISE-4/jokes.dart';

List<Joke> jokes = List.generate(
  20,
  (index) => Joke(
    title: "Joke #${index + 1}",
    description: "This is the description of joke number ${index + 1}.",
  ),
);

