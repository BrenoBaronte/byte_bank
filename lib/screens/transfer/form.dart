import 'package:bytebank/components/editor.dart';
import 'package:bytebank/models/transfer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const _appBarTitle = 'Ordering Tranfer';
const _labelValueField = 'Value';
const _hintValueField = '0.00';
const _labelAccountNumber = 'Account number';
const _hintAccountNumber = '0000';
const _confirmButtonText = 'Confirm';

class TransferForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => TransferFormState();
}

class TransferFormState extends State<TransferForm> {
  final TextEditingController _accountNumberController =
  TextEditingController();
  final TextEditingController _valueController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_appBarTitle),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Editor(
                controller: _accountNumberController,
                label: _labelAccountNumber,
                hint: _hintAccountNumber),
            Editor(
                controller: _valueController,
                label: _labelValueField,
                hint: _hintValueField,
                icon: Icons.monetization_on),
            RaisedButton(
              onPressed: () => _createTransfer(context),
              child: Text(_confirmButtonText),
            ),
          ],
        ),
      ),
    );
  }

  void _createTransfer(BuildContext context) {
    final int accountNumber = int.tryParse(_accountNumberController.text);
    final double value = double.tryParse(_valueController.text);
    if (accountNumber != null && value != null) {
      final createdTransfer =
      Transfer(value: value, accountNumber: accountNumber);
      Navigator.pop(context, createdTransfer);
    }
  }
}