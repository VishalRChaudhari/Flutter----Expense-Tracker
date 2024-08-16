import 'package:expenses/Widget/chart/chart.dart';
import 'package:expenses/Widget/expense%20list/registerd_list.dart';
import 'package:expenses/Widget/new_expense.dart';
import 'package:expenses/data%20model/expense.dart';
import 'package:flutter/material.dart';
//import 'package:flutter/services.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});
  @override
  State<Expenses> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> registerdExpenses = [
    Expense(
        amount: 78.55,
        title: 'flutter course',
        date: DateTime.now(),
        category: Category.work),
  ];

  void _openAddExpenseOverlay() {
    showModalBottomSheet(
      useSafeArea: true,
      isScrollControlled: true,
      context: context,
      builder: (ctx) => Newexpense(onAddExpense: _addexpense),
    );
  }

  void _addexpense(Expense expense) {
    setState(
      () {
        registerdExpenses.add(expense);
      },
    );
  }

  void _removeExpense(Expense expense) {
    final expenseIndex = registerdExpenses.indexOf(expense);
    setState(
      () {
        registerdExpenses.remove(expense);
      },
    );

    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('Expense Deleted'),
        duration: const Duration(seconds: 3),
        action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            setState(
              () {
                registerdExpenses.insert(expenseIndex, expense);
              },
            );
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    Widget mainContent = const Center(
      child: Text('No Expense found.Try adding some !'),
    );

    if (registerdExpenses.isNotEmpty) {
      mainContent = RegisteredExpenses(
          expenses: registerdExpenses, onRemoveExpense: _removeExpense);
    }

    return Scaffold(
      appBar: AppBar(
        //backgroundColor: const Color.fromARGB(255, 133, 209, 152),
        title: const Text(
          'Expense Tracker App',
          style: TextStyle(fontSize: 15),
        ),
        actions: [
          IconButton(
            onPressed: _openAddExpenseOverlay,
            icon: const Icon(Icons.add),
          )
        ],
      ),
      body: width < 600
          ? Column(
              children: [
                Chart(expenses: registerdExpenses),
                Expanded(child: mainContent),
              ],
            )
          : Row(
              children: [
                Expanded(
                  child: Chart(expenses: registerdExpenses),
                ),
                Expanded(child: mainContent),
              ],
            ),
      //backgroundColor: const Color.fromARGB(255, 175, 215, 196),
    );
  }
}
