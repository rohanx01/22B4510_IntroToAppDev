import 'package:flutter/material.dart';
import 'expense.dart';

class AddExpenseScreen extends StatefulWidget {
  @override
  _AddExpenseScreenState createState() => _AddExpenseScreenState();
}

class _AddExpenseScreenState extends State<AddExpenseScreen> {
  TextEditingController amountController = TextEditingController();
  TextEditingController purposeController = TextEditingController();
  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Expense'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: amountController,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              decoration: InputDecoration(labelText: 'Amount'),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: purposeController,
              decoration: InputDecoration(labelText: 'Purpose'),
            ),
            SizedBox(height: 24.0),
            ElevatedButton(
              onPressed: () {
                // Get the input values and create a new Expense object.
                double amount = double.tryParse(amountController.text) ?? 0;
                String purpose = purposeController.text;
                Expense newExpense = Expense(amount: amount, purpose: purpose, date: selectedDate);

                // Return the newExpense back to the HomeScreen.
                Navigator.pop(context, newExpense);
              },
              child: Text('Save Expense'),
            ),
          ],
        ),
      ),
    );
  }
}
