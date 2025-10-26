import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  const MyTextField({
    super.key,
    required this.controller,
    required this.hintText,
    this.obscureText,
    this.icon,
    this.onPressed,
  });
  final TextEditingController controller;
  final String hintText;
  final bool? obscureText;
  final IconData? icon;
  final VoidCallback? onPressed;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText ?? false,
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(color: Theme.of(context).colorScheme.primary),
        suffixIcon: IconButton(
          onPressed: onPressed,
          icon: Icon(icon, color: Theme.of(context).colorScheme.primary),
        ),
        enabledBorder: outlineBorder(
          context,
          Theme.of(context).colorScheme.tertiary,
        ),
        focusedBorder: outlineBorder(
          context,
          Theme.of(context).colorScheme.primary,
        ),
      ),
    );
  }

  OutlineInputBorder outlineBorder(BuildContext context, Color color) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(color: color),
    );
  }
}
