import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/expense_screen.dart';
import 'screens/add_expense_screen.dart';
import 'screens/credit_screen.dart'; // Import the new credit_screen.dart

void main() {
  runApp(BudgetTrackerApp());
}

class BudgetTrackerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(),
        '/expense': (context) => ExpenseScreen(),
        '/addExpense': (context) => AddExpenseScreen(),
        '/addCredit': (context) => CreditScreen(), // Add the new credit route
      },
    );
  }
}
