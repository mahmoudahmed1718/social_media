import 'package:flutter/material.dart';
import 'package:social_media/feature/auth/presentation/views/login_view.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case '/':
      return MaterialPageRoute(builder: (context) => const Scaffold());

    case LoginView.routeName:
      return MaterialPageRoute(builder: (context) => const LoginView());

    default:
      return MaterialPageRoute(builder: (context) => const Scaffold());
  }
}
