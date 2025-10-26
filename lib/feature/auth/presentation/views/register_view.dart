import 'package:flutter/material.dart';
import 'package:social_media/feature/auth/presentation/views/widgets/register_view_body.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: const SafeArea(child: RegisterViewBody()));
  }
}
