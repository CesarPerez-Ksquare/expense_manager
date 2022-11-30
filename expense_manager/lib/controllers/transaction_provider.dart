import 'package:expense_manager/model/transaction.dart';
import 'package:flutter/material.dart';

class TransactionProvider extends ChangeNotifier {
  List<Transaction> transactions = [];

  String? title;
  num? price;
  String? description;
  bool? type;
  String? date;

  TransactionProvider(
      {this.title, this.price, this.description, this.type, this.date});

  void transactionsAdd(Transaction trans) {
    transactions.add(trans);
    notifyListeners();
  }
}
