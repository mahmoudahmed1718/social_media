import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media/core/services/get_it_service.dart';
import 'package:social_media/feature/auth/domain/repo/auth_repo.dart';
import 'package:social_media/feature/auth/presentation/manger/auth/auth_cubit.dart';
import 'package:social_media/feature/auth/presentation/views/widgets/register_view_body.dart';

class RegisterView extends StatelessWidget {
  static const String routeName = 'register_view';
  const RegisterView({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(repo: getIt.get<AuthRepo>()),
      child: Scaffold(body: const SafeArea(child: RegisterViewBody())),
    );
  }
}
