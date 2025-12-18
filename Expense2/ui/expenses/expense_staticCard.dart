
import '../../models/expense.dart';
import 'package:flutter/material.dart';

class ExpenseStatisticCard extends StatelessWidget {
  final List<Expense> expenses;
  const ExpenseStatisticCard({super.key, required this.expenses});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white
      ),
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.all(10),
      child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        for(int i = 0; i < Category.values.length; i++)
          CategoryBox(expenses: expenses, category: Category.values[i])
      ],
    )
    );
  }
}

class CategoryBox extends StatelessWidget {
  final List<Expense> expenses;
  final Category category;
  const CategoryBox({super.key, required this.expenses, required this.category});

  double calculateTotal() {
    double total = 0;
    for (var expense in expenses) {
      if (expense.category == category) {
        total += expense.amount;
      }
    }
    return total;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(calculateTotal().toString()),
        Icon(category.icon)
      ]
      );
  }
}