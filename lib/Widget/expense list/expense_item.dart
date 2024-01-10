import 'package:expenses/data%20model/expense.dart';
import 'package:flutter/material.dart';

class ExpenseItem extends StatelessWidget {
  const ExpenseItem(this.expense, {super.key});

  final Expense expense;

  @override
  Widget build(BuildContext context) {
    return Card(
      //color: const Color.fromARGB(255, 96, 152, 97),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              expense.title,
              style: Theme.of(context)
                  .textTheme
                  .titleLarge, /*style: const TextStyle(color: Color.fromARGB(255, 29, 22, 22)),*/
            ),
            const SizedBox(height: 4),
            Row(
              children: [
                Text('\$${expense.amount.toStringAsFixed(2)}',
                    style: const TextStyle(color: Colors.white)),
                const Spacer(),
                Row(
                  children: [
                    Icon(categoryItems[expense.category],
                        color: Colors.white60),
                    const SizedBox(width: 8),
                    Text(expense.formattedDate,
                        style: const TextStyle(color: Colors.white))
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
