import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function addTx;

  const NewTransaction(this.addTx);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final _titleControler = TextEditingController();
  final _amountContoler = TextEditingController();

  DateTime _selectedDate;

  void _SubmitData() {
    if (_amountContoler.text.isEmpty) {
      return;
    }
    final enteredTitle = _titleControler.text;
    final enteredAmount = double.parse(_amountContoler.text);

    if (enteredTitle.isEmpty || enteredAmount <= 0 || _selectedDate == null) {
      return;
    }

    widget.addTx(enteredTitle, enteredAmount, _selectedDate);
    Navigator.of(context).pop();
  }

  void _presentDatePicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(1998),
            lastDate: DateTime.now())
        .then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        _selectedDate = pickedDate;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
         child: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              decoration: const InputDecoration(labelText: 'Title'),
              controller: _titleControler,
              onSubmitted: (_) => _SubmitData(),
            ),
            TextField(
              decoration: const InputDecoration(labelText: 'Amount'),
              controller: _amountContoler,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => _SubmitData(),
            ),
            SizedBox(
              height: 70,
              child: Row(
                children: [
                  Text(_selectedDate == null
                      ? 'No choosen date!'
                      : DateFormat.yMMMMd().format(_selectedDate)),
                  FlatButton(
                    textColor: Theme.of(context).primaryColor,
                    onPressed: _presentDatePicker,
                    child: const Text('Choose Date'),
                  )
                ],
              ),
            ),
            Container(
              child: RaisedButton(
                padding: const EdgeInsets.all(10),
                color: Colors.deepPurple,
                onPressed: _SubmitData,
                child: const Text(
                  'Add',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
