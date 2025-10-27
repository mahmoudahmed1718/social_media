import 'package:flutter/material.dart';
import 'package:social_media/feature/auth/presentation/views/widgets/login_view_body_bloc_consumer.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});
  static const String routeName = 'login_view';
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(body: LoginViewBodyBlocConsumer()));
  }
}
