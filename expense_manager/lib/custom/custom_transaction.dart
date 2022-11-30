import 'package:expense_manager/model/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CustomTransaction extends StatelessWidget {
  Transaction transaction;
  CustomTransaction({super.key, required this.transaction});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListTile(
            tileColor: Colors.white,
            shape: RoundedRectangleBorder(
              side: const BorderSide(width: 4.0, color: Colors.white),
              borderRadius: BorderRadius.circular(8.0),
            ),
            title: Text(
              transaction.title,
              style:
                  const TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            subtitle:
                Text(DateFormat("M/d/y hh:mm a").format(transaction.date)),
            trailing: transaction.type
                ? Text(
                    "-${transaction.price}",
                    style: const TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.red),
                  )
                : Text(
                    "${transaction.price}",
                    style: const TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.green),
                  )));
  }
}
