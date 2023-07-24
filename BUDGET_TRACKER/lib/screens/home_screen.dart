import 'package:flutter/material.dart';
import 'expense_screen.dart';
import 'add_expense_screen.dart';
import 'credit_screen.dart'; // Add the new credit_screen.dart
import 'expense.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Expense> previousExpenses = [];
  double totalCredit = 0.0; // Initialize totalCredit to 0.0

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BUDGET TRACKER 2023', style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: Container(
        color: Colors.purple, // Set the background color to purple
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () async {
                  // Navigate to the AddExpenseScreen to add a new expense.
                  final newExpense = await Navigator.pushNamed(context, '/addExpense');
                  // This block executes when the AddExpenseScreen pops and returns a new expense.
                  if (newExpense != null && newExpense is Expense) {
                    setState(() {
                      previousExpenses.add(newExpense);
                    });
                  }
                },
                child: Text('Add Expense'),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  // Navigate to the CreditScreen to add credit.
                  final newCredit = await Navigator.pushNamed(context, '/addCredit');
                  // This block executes when the CreditScreen pops and returns the new credit.
                  if (newCredit != null && newCredit is double) {
                    setState(() {
                      totalCredit += newCredit;
                    });
                  }
                },
                child: Text('Add Credit'),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Navigate to the ExpenseScreen to view previous expenses.
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ExpenseScreen(expenses: previousExpenses),
                    ),
                  );
                },
                child: Text('View Expenses'),
              ),
              SizedBox(height: 20),
              Text(
                'Net Balance: \$${(totalCredit - calculateTotalExpenses()).toStringAsFixed(2)}',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }

  double calculateTotalExpenses() {
    double totalExpenses = 0.0;
    for (var expense in previousExpenses) {
      totalExpenses += expense.amount;
    }
    return totalExpenses;
  }
}
