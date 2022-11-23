import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function addTrans;

  NewTransaction(this.addTrans);

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
      return; // acest return nu va executa functia daca este inregistrata una dintre conditiile impuse =>  nu va adauga o noua tranzatie => functia (metoda addTrans nu va fi executata)
    }

    widget.addTrans(
      enteredTitle,
      enteredAmount,
    );

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: 'Title'),
              controller: titleController,
              onSubmitted: (_) => submitData,
              // onChanged: (value) {
              // titleInput = value;
              // },
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              controller: amountController,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => submitData,
              // onChanged: (value) {
              // amountInput = value;
              // },
            ),
            TextButton(
              child: Text('Add Transaction'),
              style: TextButton.styleFrom(backgroundColor: Colors.amber),
              onPressed: submitData,
            ),
          ],
        ),
      ),
    );
  }
}
