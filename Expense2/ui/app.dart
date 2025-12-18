import 'package:first_app/Expense2/models/expense.dart';
import 'package:flutter/material.dart';
import 'expenses/expenses.dart';

class App extends StatelessWidget {
  const App({super.key});

  
  @override
  Widget build(BuildContext context) {
    return ExpensesView(expense: [], onAddExpense: (Expense expense) {  },);
  }
}