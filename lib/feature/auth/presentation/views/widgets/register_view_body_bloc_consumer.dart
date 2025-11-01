import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media/core/helper/snak_bar_method.dart';
import 'package:social_media/core/widget/modal_progress_hud_loading_widget.dart';
import 'package:social_media/feature/auth/presentation/manger/auth/auth_cubit.dart';
import 'package:social_media/feature/auth/presentation/views/widgets/register_view_body.dart';

class RegisterViewBodyBlocConsumer extends StatelessWidget {
  const RegisterViewBodyBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthSuccess) {
          showSnakbar(context, 'Register Successfully');
        } else if (state is AuthFailure) {
          showSnakbar(context, state.errorMessage);
        }
      },
      builder: (context, state) {
        return ModalProgressHudIsLoadingWidget(
          isLoading: state is AuthLoading,
          child: RegisterViewBody(),
        );
      },
    );
  }
}
