import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media/core/helper/snak_bar_method.dart';
import 'package:social_media/feature/auth/presentation/manger/auth/auth_cubit.dart';
import 'package:social_media/feature/auth/presentation/views/widgets/login_view_body.dart';

class LoginViewBodyBlocConsumer extends StatelessWidget {
  const LoginViewBodyBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthSuccess) {
          showSnakbar(context, 'Login Successfully');
          // ignore: avoid_types_as_parameter_names
          Navigator.pushNamedAndRemoveUntil(context, '', (route) => false);
        }
      },
      builder: (context, state) {
        return LoginViewBody();
      },
    );
  }
}
