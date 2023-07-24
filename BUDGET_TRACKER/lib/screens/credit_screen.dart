import 'package:flutter/material.dart';

class CreditScreen extends StatefulWidget {
  @override
  _CreditScreenState createState() => _CreditScreenState();
}

class _CreditScreenState extends State<CreditScreen> {
  TextEditingController amountController = TextEditingController();
  TextEditingController purposeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Credit'),
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
                // Get the input values and return the credit back to the HomeScreen.
                double amount = double.tryParse(amountController.text) ?? 0;
                String purpose = purposeController.text;
                Navigator.pop(context, amount);
              },
              child: Text('Save Credit'),
            ),
          ],
        ),
      ),
    );
  }
}
