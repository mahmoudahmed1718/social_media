import 'package:flutter/material.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case '/':
      return MaterialPageRoute(builder: (context) => const Scaffold());

    default:
      return MaterialPageRoute(builder: (context) => const Scaffold());
  }
}
