import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color(0xFFB7E36B),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              ScoreCard(
                title: "My scores in flutter",
                scoreValue: 2,
                barColors: Color(0xFF4CAF50),
              ),
              SizedBox(height: 20),
              ScoreCard(
                title: "My scores in dart",
                scoreValue: 2,
                barColors: Color(0xFF8BCF8A),
              ),
              SizedBox(height: 20),
              ScoreCard(
                title: "My scores in React",
                scoreValue: 10,
                barColors: Color(0xFF0E561B),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ScoreCard extends StatefulWidget {
  final String title;
  final int scoreValue;
  final Color barColors;

  const ScoreCard({
    super.key,
    required this.title,
    required this.scoreValue,
    required this.barColors,
  });

  @override
  State<ScoreCard> createState() => _ScoreCardState();
}

class _ScoreCardState extends State<ScoreCard> {
  int score = 0;

  @override
  void initState() {
    super.initState();
    score = widget.scoreValue;
  }

  void increase() {
    setState(() {
      if (score < 10) score++;
    });
  }

  void decrease() {
    setState(() {
      if (score > 0) score--;
    });
  }

  @override
  Widget build(BuildContext context) {
    double progress = score / 10;

    return Container(
      padding: EdgeInsets.all(25),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Column(
        children: [
          Text(
            widget.title,
            style: TextStyle(
              fontSize: 25,
              color: Colors.grey,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                onPressed: decrease,
                icon: Icon(Icons.remove),
                iconSize: 40,
                color: Colors.black,
              ),
              IconButton(
                onPressed: increase,
                icon: Icon(Icons.add),
                iconSize: 40,
                color: Colors.black,
              ),
            ],
          ),
          SizedBox(height: 15),
          SizedBox(
            height: 35,
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.grey.shade300, width: 3),
                  ),
                ),
                FractionallySizedBox(
                  widthFactor: progress,
                  child: Container(
                    decoration: BoxDecoration(
                      color: widget.barColors,
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
