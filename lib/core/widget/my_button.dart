import 'package:flutter/material.dart';
import 'package:social_media/core/utils/styles.dart';

class MyButton extends StatelessWidget {
  const MyButton({super.key, this.onTap, required this.text});
  final void Function()? onTap;
  final String text;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.tertiary,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: Theme.of(context).colorScheme.inversePrimary,
              fontSize: Styles.style16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
