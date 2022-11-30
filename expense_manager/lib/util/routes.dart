import 'package:flutter/material.dart';

import '../screens/balance_screen.dart';
import '../screens/transaction_screen.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  final name = settings.name;

  return MaterialPageRoute(
    builder: routes[name]!,
    settings: settings,
  );
}

Map<String, WidgetBuilder> routes = <String, WidgetBuilder>{
  BalanceScreen.routeName: (context) => const BalanceScreen(),
  TransactionScreen.routeName: (context) => const TransactionScreen(),
};
