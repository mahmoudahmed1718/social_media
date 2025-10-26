import 'package:flutter/material.dart';
import 'package:social_media/core/utils/styles.dart';
import 'package:social_media/core/widget/my_button.dart';
import 'package:social_media/core/widget/my_text_field.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isObscure = true;
  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: ListView(
        children: [
          const SizedBox(height: 50),
          Icon(
            Icons.login,
            size: 100,
            color: Theme.of(context).colorScheme.primary,
          ),
          const SizedBox(height: 20),

          Center(
            child: Text(
              'welcome Back...,you have been missed',
              style: TextStyle(
                fontSize: Styles.style16,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
          ),
          const SizedBox(height: 20),
          MyTextField(
            controller: emailController,
            hintText: 'Email',
            icon: Icons.email,
          ),
          const SizedBox(height: 10),
          MyTextField(
            controller: passwordController,
            hintText: 'Password',
            obscureText: isObscure,
            icon: isObscure ? Icons.visibility : Icons.visibility_off,
            onPressed: () {
              setState(() {
                isObscure = !isObscure;
              });
            },
          ),
          const SizedBox(height: 16),
          MyButton(text: 'Login', onTap: () {}),
        ],
      ),
    );
  }
}
