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
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                controller: _accountNumberController,
                style: TextStyle(fontSize: 24.0),
                decoration: InputDecoration(
                    labelText: 'Account number', hintText: '0000'),
                keyboardType: TextInputType.number,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                controller: _valueController,
                style: TextStyle(fontSize: 24.0),
                decoration: InputDecoration(
                    icon: Icon(Icons.monetization_on),
                    labelText: 'Value',
                    hintText: '0.00'),
                keyboardType: TextInputType.number,
              ),
            ),
            RaisedButton(
              onPressed: () {
                final int accountNumber =
                    int.tryParse(_accountNumberController.text);
                final double value = double.tryParse(_valueController.text);
                if (accountNumber != null && value != null) {
                  final createdTransfer =
                      Transfer(value: value, accountNumber: accountNumber);
                  debugPrint(createdTransfer.toString());
                }
              },
              child: Text('Confirmar'),
            ),
          ],
        ));
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
