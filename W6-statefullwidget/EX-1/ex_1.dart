import 'package:flutter/material.dart';

void main() =>
    runApp(const MaterialApp(
      debugShowCheckedModeBanner: false, 
      home: MyApp(
    )
  )
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Custom buttons")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ButtonCard(),
            ButtonCard(),
            ButtonCard(),
            ButtonCard()
          ],
        )
      ),
    );
  }
}

class ButtonCard extends StatefulWidget {
  const ButtonCard({super.key});

  @override
  State<ButtonCard> createState() => _ButtonCardState();
}

class _ButtonCardState extends State<ButtonCard> {
  bool isSelected = false;

  Color get backgroundColor =>
      isSelected ? Colors.blue.shade500 : Colors.blue.shade50;

  String get labelText => isSelected ? "Selected" : "Not Selected";

  Color get textBackground => isSelected ? Colors.white : Colors.black;

  void onSelected() {
    setState(() {
      isSelected = !isSelected;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 400,
      height: 100,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor
        ),
        onPressed: onSelected, 
        child: Center(
          child: Text(
            labelText,
            style: TextStyle(
              color: textBackground,
              fontSize: 20
            ),
          ),
        )
      ),
    );
  }
}
