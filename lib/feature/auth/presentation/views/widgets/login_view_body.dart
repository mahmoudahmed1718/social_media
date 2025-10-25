import 'package:flutter/material.dart';
import 'package:social_media/core/utils/styles.dart';
import 'package:social_media/core/widget/my_text_field.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          Icons.login,
          size: 100,
          color: Theme.of(context).colorScheme.primary,
        ),
        const SizedBox(height: 20),

        Text(
          'welcome Back...,you have been missed',
          style: TextStyle(
            fontSize: Styles.style16,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        const SizedBox(height: 20),
        MyTextField(
          controller: emailController,
          hintText: 'Email',
          icon: Icons.email,
        ),
        const SizedBox(height: 16),
        MyTextField(
          controller: passwordController,
          hintText: 'Password',
          obscureText: true,
          icon: Icons.lock,
        ),
      ],
    );
  }
}
