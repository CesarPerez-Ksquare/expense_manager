import 'package:expense_manager/controllers/transaction_provider.dart';
import 'package:expense_manager/custom/custom_transaction.dart';
import 'package:expense_manager/screens/transaction_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/transaction.dart';

class BalanceScreen extends StatefulWidget {
  const BalanceScreen({super.key});

  static const String routeName = 'balance';

  @override
  State<BalanceScreen> createState() => _BalanceScreenState();
}

class _BalanceScreenState extends State<BalanceScreen> {
  @override
  Widget build(BuildContext context) {
    String price = Provider.of<TransactionProvider>(context, listen: true)
        .total
        .toString();

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            height: 850,
            width: double.infinity,
            color: Colors.white,
            child: Column(children: [
              Container(
                height: 450,
                width: double.infinity,
                color: const Color(0xFF56b38f),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          const SizedBox(
                            height: 100,
                          ),
                          const Text(
                            "BALANCE",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 28,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 100,
                            width: 250,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  "\$",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 48,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  Provider.of<TransactionProvider>(context,
                                          listen: true)
                                      .total
                                      .toString(),
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 48,
                                      fontWeight: FontWeight.bold),
                                ),
                                const Text(
                                  "USD",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 48,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 120,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(
                                context, TransactionScreen.routeName);
                          },
                          style: ButtonStyle(
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(8.0))),
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.white),
                              elevation: MaterialStateProperty.all(0.00)),
                          child: const Text(
                            "Create",
                            style: TextStyle(
                                color: Color(0xFF56b38f),
                                fontSize: 24,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ]),
              ),
              Expanded(
                  child:
                      Provider.of<TransactionProvider>(context, listen: false)
                              .transactions
                              .isEmpty
                          ? const Center(
                              child: Text(
                                "No Transactions Found",
                                style: TextStyle(fontSize: 20.0),
                              ),
                            )
                          : Consumer<TransactionProvider>(
                              builder: (context, value, child) {
                                List<Transaction> transaction =
                                    value.transactions;
                                return ListView.builder(
                                    itemCount: transaction.length,
                                    itemBuilder: (context, index) {
                                      return CustomTransaction(
                                          transaction: transaction[index]);
                                    });
                              },
                            ))
            ]),
          ),
        ),
      ),
    );
  }
}
