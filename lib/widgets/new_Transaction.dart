// ignore_for_file: file_names

import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function addTx;

  NewTransaction(this.addTx);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  void submitData() {
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);
    if (enteredTitle.isEmpty || enteredAmount <= 0) {
      return;
    }

    widget.addTx(enteredTitle, enteredAmount);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            TextField(
              // onChanged: (value) {
              //   titleController = value;
              // },
              controller: titleController,
              onSubmitted: (_) => submitData(),
              decoration: InputDecoration(
                  labelText: 'Title',
                  labelStyle: TextStyle(
                    color: Colors.lime.shade700,
                  )),
            ),
            TextField(
              // onChanged: (value) => amountInput = value,
              controller: amountController,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => submitData(),
              decoration: InputDecoration(
                  labelText: 'Amount',
                  labelStyle: TextStyle(color: Colors.lime.shade700)),
            ),
            TextButton(
              onPressed: submitData,
              child: Text('Add Transaction'),
            )
          ],
        ),
      ),
    );
  }
}
