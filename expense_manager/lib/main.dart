import 'package:expense_manager/util/routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'controllers/transaction_provider.dart';
import 'screens/balance_screen.dart';

void main() => runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => TransactionProvider()),
      ],
      child: const MyApp(),
    ));

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: onGenerateRoute,
      title: 'Expense Manager',
      home: BalanceScreen(),
    );
  }
}
