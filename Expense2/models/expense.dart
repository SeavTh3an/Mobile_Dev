import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

const uuid = Uuid();

enum Category {
  food(icon: Icons.free_breakfast),
  travel(icon: Icons.travel_explore),
  leisure(icon: Icons.holiday_village),
  work(icon: Icons.work);

  final IconData icon;
  const Category({required this.icon});
}

class Expense {
  Expense({
    required this.title,
    required this.amount,
    required this.date,
    required this.category,
  }) : id = uuid.v4();

  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Category category;
}