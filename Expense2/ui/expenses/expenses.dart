import 'package:flutter/material.dart';
import '../../models/expense.dart';
import 'expense_form.dart';
import 'expense_staticCard.dart';

class ExpensesView extends StatefulWidget {
  const ExpensesView({
    super.key,
    required this.expense,
    required this.onAddExpense,
  });

  final List<Expense> expense;
  final void Function(Expense expense) onAddExpense;

  @override
  State<ExpensesView> createState() => _ExpensesViewState();
}

class _ExpensesViewState extends State<ExpensesView> {
  final List<Expense> _expenses = [
    Expense(
      title: 'Flutter Course',
      amount: 19.99,
      date: DateTime.now(),
      category: Category.work,
    ),
    Expense(
      title: 'Cinema',
      amount: 15.69,
      date: DateTime.now(),
      category: Category.leisure,
    ),
  ];


  void _openAddExpense(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (_) => ExpenseForm(onCreateExpense: _createExpense),
    );
  }


  void _createExpense(Expense expense) {
    setState(() {
      _expenses.add(expense);
    });
  }


  void dismiss(Expense expense) {
    setState(() {
      _expenses.remove(expense);
    });
    _snackBar("Deleting Expense!", expense);
  }


  void _snackBar(String message, Expense expense) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 3),
        action: SnackBarAction(
          label: 'Undo',
          onPressed: () => _createExpense(expense),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[100],
      appBar: AppBar(
        backgroundColor: Colors.blue[700],
        title: const Text('Ronan-The-Best Expenses App'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () => _openAddExpense(context),
          ),
        ],
      ),
      body: Column(
        children: [
          ExpenseStatisticCard(expenses: _expenses),
          Expanded(
            child: _expenses.isEmpty
                ? const Center(
                    child: Text("No Expense Found, Try adding some"),
                  )
                : ListView.builder(
                    itemCount: _expenses.length,
                    itemBuilder: (context, index) => ExpenseItem(
                      expense: _expenses[index],
                      dismiss: () => dismiss(_expenses[index]),
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}

class ExpenseItem extends StatelessWidget {
  final VoidCallback dismiss;
  final Expense expense;

  const ExpenseItem({
    super.key,
    required this.dismiss,
    required this.expense,
  });

  IconData get expenseIcon {
    switch (expense.category) {
      case Category.food:
        return Icons.free_breakfast;
      case Category.travel:
        return Icons.travel_explore;
      case Category.leisure:
        return Icons.holiday_village;
      case Category.work:
        return Icons.work;
    }
  }

  String get expenseDate {
    return "${expense.date.day}/${expense.date.month}/${expense.date.year}";
  }

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(expense),
      onDismissed: (_) => dismiss(),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      expense.title,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text("${expense.amount.toStringAsFixed(2)} \$"),
                  ],
                ),
                const Spacer(),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Icon(expenseIcon),
                    ),
                    Text(expenseDate),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
