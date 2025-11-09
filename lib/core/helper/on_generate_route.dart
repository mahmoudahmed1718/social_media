import 'package:flutter/material.dart';
import 'package:social_media/core/helper/get_user_data.dart';
import 'package:social_media/feature/auth/presentation/views/login_view.dart';
import 'package:social_media/feature/auth/presentation/views/register_view.dart';
import 'package:social_media/feature/home/presentation/view/home_view.dart';
import 'package:social_media/feature/profile/presentation/views/profile_view.dart';
import 'package:social_media/feature/splash/presentation/views/splash_view.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case SplashView.routeName:
      return MaterialPageRoute(builder: (context) => const SplashView());

    case LoginView.routeName:
      return MaterialPageRoute(builder: (context) => const LoginView());

    case RegisterView.routeName:
      return MaterialPageRoute(builder: (context) => const RegisterView());

    case HomeView.routeName:
      return MaterialPageRoute(builder: (context) => const HomeView());

    case ProfileView.routeName:
      final uid = settings.arguments as String? ?? getUserData().uId;
      return MaterialPageRoute(builder: (context) => ProfileView(userUid: uid));

    default:
      return MaterialPageRoute(builder: (context) => const Scaffold());
  }
}
