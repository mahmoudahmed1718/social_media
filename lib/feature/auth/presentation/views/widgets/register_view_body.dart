import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media/core/helper/snak_bar_method.dart';
import 'package:social_media/core/utils/styles.dart';
import 'package:social_media/core/widget/my_button.dart';
import 'package:social_media/core/widget/my_text_field.dart';
import 'package:social_media/feature/auth/presentation/manger/auth/auth_cubit.dart';

class RegisterViewBody extends StatefulWidget {
  const RegisterViewBody({super.key});

  @override
  State<RegisterViewBody> createState() => _RegisterViewBodyState();
}

class _RegisterViewBodyState extends State<RegisterViewBody> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  bool isObscurePassWord = true;
  bool isObscureConfirmPassWord = true;
  String? name;
  String? email;
  String? password;
  String? confirmPassword;
  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    passwordConfirmController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Form(
        key: formKey,
        child: ListView(
          children: [
            const SizedBox(height: 60),
            Icon(
              Icons.login,
              size: 100,
              color: Theme.of(context).colorScheme.primary,
            ),
            const SizedBox(height: 16),

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
              onchanged: (value) => name = value,
              controller: nameController,
              hintText: 'Full Name',
              icon: Icons.person,
            ),
            const SizedBox(height: 16),
            MyTextField(
              onchanged: (value) => email = value,
              controller: emailController,
              hintText: 'Email',
              icon: Icons.email,
            ),
            const SizedBox(height: 16),
            MyTextField(
              onchanged: (value) => password = value,
              controller: passwordController,
              hintText: 'Password',
              obscureText: isObscurePassWord,
              icon: isObscurePassWord ? Icons.visibility : Icons.visibility_off,
              onPressed: () {
                setState(() {
                  isObscurePassWord = !isObscurePassWord;
                });
              },
            ),
            const SizedBox(height: 16),
            MyTextField(
              onchanged: (value) => confirmPassword = value,
              controller: passwordConfirmController,
              hintText: 'Confirm Password',
              obscureText: isObscureConfirmPassWord,
              icon: isObscureConfirmPassWord
                  ? Icons.visibility
                  : Icons.visibility_off,
              onPressed: () {
                setState(() {
                  isObscureConfirmPassWord = !isObscureConfirmPassWord;
                });
              },
            ),
            const SizedBox(height: 24),
            MyButton(
              text: 'Register',
              onTap: () {
                if (password == confirmPassword) {
                  if (formKey.currentState!.validate()) {
                    BlocProvider.of<AuthCubit>(
                      context,
                    ).rigster(name: name!, email: email!, password: password!);
                  } else {
                    setState(() {
                      autovalidateMode = AutovalidateMode.always;
                    });
                  }
                } else {
                  showSnakbar(context, 'Password Not Match');
                }
              },
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Already have an account...?',
                  style: TextStyle(
                    fontSize: Styles.style16,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    'Login now',
                    style: TextStyle(
                      fontSize: Styles.style16,
                      color: Theme.of(context).colorScheme.inversePrimary,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
