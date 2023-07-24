import 'package:flutter/material.dart';
import 'expense.dart';

class ExpenseScreen extends StatelessWidget {
  final List<Expense>? expenses;

  ExpenseScreen({this.expenses});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Expense Screen'),
      ),
      body: ListView.builder(
        itemCount: expenses?.length ?? 0,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('Amount: \$${expenses?[index].amount.toString()}'),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Purpose: ${expenses?[index].purpose}'),
                Text('Date: ${expenses?[index].date.toString()}'),
              ],
            ),
          );
        },
      ),
    );
  }
}
