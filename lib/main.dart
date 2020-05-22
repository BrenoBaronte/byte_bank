import 'package:flutter/material.dart';

void main() => runApp(
      MaterialApp(
        home: Scaffold(
          body: TransferList(),
          appBar: AppBar(
            title: Text('Transferências'),
          ),
          floatingActionButton: FloatingActionButton(child: Icon(Icons.add)),
        ),
      ),
    );

class TransferList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TransferItem(Transfer(value: 100.0, accountNumber: 1001)),
        TransferItem(Transfer(value: 200.0, accountNumber: 1001)),
        TransferItem(Transfer(value: 300.0, accountNumber: 2002)),
      ],
    );
  }
}

class TransferItem extends StatelessWidget {

  final Transfer _transfer;

  TransferItem( this._transfer );

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

  Transfer({ this.value, this. accountNumber });
}
