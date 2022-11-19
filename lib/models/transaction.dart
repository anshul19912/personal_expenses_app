import 'package:flutter/material.dart';

class Transaction {
  final String? id;
  final String? title;
  final double? amount;
  final DateTime? date;

  Transaction({
    @required this.id,
    @required this.title,
    @required this.amount,
    @required this.date,
  });
}


// final means they are runtime constant, they get their value when this transaction is created but the value thereafter never changes.