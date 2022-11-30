import 'package:expense_manager/model/transaction.dart';
import 'package:flutter/material.dart';

class TransactionProvider extends ChangeNotifier {
  List<Transaction> transactions = [];
  num total = 0;

  void transactionsAdd(Transaction trans) {
    transactions.add(trans);
    sum(trans);
    notifyListeners();
  }

  void sum(Transaction trans) {
    trans.type ? total -= trans.price : total += trans.price;
  }
}
