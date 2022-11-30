import 'package:expense_manager/controllers/transaction_provider.dart';
import 'package:expense_manager/model/transaction.dart';
import 'package:expense_manager/screens/balance_screen.dart';
import 'package:flutter/material.dart';

class TransactionScreen extends StatefulWidget {
  const TransactionScreen({super.key});

  static const String routeName = 'balance';

  @override
  State<TransactionScreen> createState() => _TransactionScreenState();
}

class _TransactionScreenState extends State<TransactionScreen> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController _titleController = TextEditingController();
  TextEditingController _priceController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();

  String? toModelTitle = "";
  String? toModelPrice = "";
  String? toModelDescription = "";

  bool transactionExpense = false;
  bool transactionIncome = false;

  bool? transactionValues;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
          color: Colors.white,
        ),
        backgroundColor: const Color(0xFF56b38f),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: 850,
          width: double.infinity,
          color: Colors.white,
          child: Column(children: [
            const SizedBox(
              height: 12.0,
            ),
            Row(children: [
              SizedBox(
                height: 50,
                width: 150,
                child: RadioListTile(
                  toggleable: true,
                  activeColor: const Color(0xFF56b38f),
                  title: const Text("Income",
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF56b38f),
                      )),
                  value: false,
                  groupValue: transactionValues,
                  onChanged: (value) {
                    setState(() {
                      transactionIncome = true;
                      transactionExpense = false;
                      transactionValues = value!;
                    });
                  },
                ),
              ),
              SizedBox(
                height: 50,
                width: 170,
                child: RadioListTile(
                  toggleable: true,
                  activeColor: const Color(0xFF56b38f),
                  title: const Text("Expense",
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF56b38f),
                      )),
                  value: true,
                  groupValue: transactionValues,
                  onChanged: (value) {
                    setState(() {
                      transactionIncome = false;
                      transactionExpense = true;
                      transactionValues = value!;
                    });
                  },
                ),
              ),
            ]),
            const SizedBox(
              height: 12.0,
            ),
            Form(
              key: _formKey,
              child: Column(children: [
                Padding(
                  padding:
                      const EdgeInsets.only(top: 12.0, left: 24.0, right: 24.0),
                  child: TextFormField(
                    controller: _titleController,
                    style: const TextStyle(fontSize: 20.0),
                    keyboardType: TextInputType.name,
                    decoration: const InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.grey, width: 1.0)),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(),
                            borderRadius:
                                BorderRadius.all(Radius.circular(8.0))),
                        labelText: "Title",
                        hintStyle: TextStyle(
                            fontSize: 20.0,
                            color: Colors.grey,
                            fontWeight: FontWeight.bold)),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(top: 12.0, left: 24.0, right: 24.0),
                  child: TextFormField(
                    controller: _priceController,
                    style: const TextStyle(fontSize: 20.0),
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.grey, width: 1.0)),
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(8.0))),
                        labelText: "Amount",
                        hintStyle: TextStyle(
                            fontSize: 20.0,
                            color: Colors.grey,
                            fontWeight: FontWeight.bold)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 12.0, left: 24.0, right: 24.0, bottom: 24.0),
                  child: TextFormField(
                    controller: _descriptionController,
                    style: const TextStyle(fontSize: 20.0),
                    maxLines: 3,
                    keyboardType: TextInputType.text,
                    decoration: const InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.grey, width: 1.0)),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8.0)),
                        ),
                        labelText: "Description",
                        alignLabelWithHint: true,
                        hintStyle: TextStyle(
                            fontSize: 20.0,
                            color: Colors.grey,
                            fontWeight: FontWeight.bold)),
                  ),
                ),
              ]),
            ),
            SizedBox(
              height: 50,
              width: 360,
              child: ElevatedButton(
                onPressed: () {
                  TransactionProvider model = TransactionProvider(
                    title: _titleController.text,
                    price: transactionValues == true
                        ? num.tryParse(_priceController.text)
                        : num.tryParse(_priceController.text)! * -1,
                    description: _descriptionController.text,
                    type: transactionValues,
                    date: DateTime.now().toIso8601String(),
                  );
                  Navigator.pop(context);
                },
                style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0))),
                    backgroundColor: MaterialStateProperty.all<Color>(
                        const Color(0xFF56b38f)),
                    elevation: MaterialStateProperty.all(0.00)),
                child: const Text(
                  "SUBMIT",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
