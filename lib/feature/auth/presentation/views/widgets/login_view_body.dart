import 'package:flutter/material.dart';
import 'package:social_media/core/utils/styles.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});
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
      ],
    );
  }
}
