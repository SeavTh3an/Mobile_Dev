import 'package:flutter/material.dart';

void main() => runApp(
  const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ),
);

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            DiscountCard(initialPrice: 500, discountRace: 0.25),
            DiscountCard(initialPrice: 100, discountRace: 0.10),
          ],
        ),
      ),
    );
  }
}

class DiscountCard extends StatefulWidget {
  const DiscountCard({
    super.key,
    required this.initialPrice,
    required this.discountRace,
  });

  final int initialPrice;

  final double discountRace; // From 0 to 1 . Example 0.25 = 25%

  @override
  State<DiscountCard> createState() => _DiscountCardState();
}

class _DiscountCardState extends State<DiscountCard> {
  bool discountApplied = false;

  Color get backgroundColor => discountApplied ? Colors.pink : Colors.black;

  String get labelText => discountApplied ? "Discount!" : "No Discount";

  String get buttonLabel => discountApplied ? "Cancel Discount" : "Apply Discount";

  int get effectivePrice => discountApplied
      ? (widget.initialPrice * (1 - widget.discountRace)).floor()
      : widget.initialPrice;

  String get priceLabel => "\$ $effectivePrice";

  void onDiscount() {
    setState(() {
      discountApplied = !discountApplied;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(priceLabel, style: TextStyle(color: Colors.white)),
          Text(labelText, style: TextStyle(color: Colors.white)),
          ElevatedButton(
            onPressed: onDiscount,
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12), // Rounded corners
              ),
            ),
            child: Text(buttonLabel),
          ),
        ],
      ),
    );
  }
}
