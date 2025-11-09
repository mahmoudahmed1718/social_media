import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media/feature/auth/domain/entites/app_user.dart';
import 'package:social_media/feature/auth/presentation/manger/auth/auth_cubit.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key, required this.userUid});
  final String userUid;
  static const String routeName = 'profile';

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  AuthCubit? authCubit;
  AppUserEntity? currentUser;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      authCubit = context.read<AuthCubit>();
      _loadUser();
    });
  }

  Future<void> _loadUser() async {
    if (authCubit == null) return;
    try {
      final user = await authCubit!.getCurrentUser();
      if (!mounted) return;
      setState(() {
        currentUser = user;
        isLoading = false;
      });
    } catch (e) {
      if (!mounted) return;
      setState(() => isLoading = false);
      debugPrint('Error loading user: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    if (currentUser == null) {
      return const Scaffold(body: Center(child: Text('No user found')));
    }

    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text(currentUser!.email)),
      body: Center(child: Text('Profile View for User ID: ${widget.userUid}')),
    );
  }
}
