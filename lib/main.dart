import 'package:flutter/material.dart';

void main() => runApp(ByteBankApp());

class ByteBankApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: TransferForm(),
      ),
    );
  }
}

class TransferForm extends StatelessWidget {
  final TextEditingController _accountNumberController =
      TextEditingController();
  final TextEditingController _valueController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Ordering Tranfer'),
        ),
        body: Column(
          children: <Widget>[
            Editor(
                controller: _accountNumberController,
                label: 'Account number',
                hint: '0000'),
            Editor(
                controller: _valueController,
                label: 'Value',
                hint: '0.00',
                icon: Icons.monetization_on),
            RaisedButton(
              onPressed: () => _createTransfer(),
              child: Text('Confirmar'),
            ),
          ],
        ));
  }

  void _createTransfer() {
    final int accountNumber =
        int.tryParse(_accountNumberController.text);
    final double value = double.tryParse(_valueController.text);
    if (accountNumber != null && value != null) {
      final createdTransfer =
          Transfer(value: value, accountNumber: accountNumber);
      debugPrint(createdTransfer.toString());
    }
  }
}

class Editor extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final String hint;
  final IconData icon;

  Editor({this.controller, this.label, this.hint, this.icon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        controller: controller,
        style: TextStyle(fontSize: 24.0),
        decoration: InputDecoration(
            icon: icon != null ? Icon(icon) : null,
            labelText: label,
            hintText: hint),
        keyboardType: TextInputType.number,
      ),
    );
  }
}

class TransferList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Transferências'),
      ),
      body: Column(
        children: <Widget>[
          TransferItem(Transfer(value: 100.0, accountNumber: 1001)),
          TransferItem(Transfer(value: 200.0, accountNumber: 1001)),
          TransferItem(Transfer(value: 300.0, accountNumber: 2002)),
        ],
      ),
      floatingActionButton: FloatingActionButton(child: Icon(Icons.add)),
    );
  }
}

class TransferItem extends StatelessWidget {
  final Transfer _transfer;

  TransferItem(this._transfer);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(Icons.monetization_on),
        title: Text(_transfer.value.toString()),
        subtitle: Text(_transfer.accountNumber.toString()),
      ),
    );
  }
}

class Transfer {
  final double value;
  final int accountNumber;

  Transfer({this.value, this.accountNumber});

  @override
  String toString() {
    return 'Transfer{value: $value, accountNumber: $accountNumber}';
  }
}
