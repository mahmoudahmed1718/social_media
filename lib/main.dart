import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:social_media/core/helper/on_generate_route.dart';
import 'package:social_media/core/services/get_it_service.dart';
import 'package:social_media/core/services/shared_prefence_singleton.dart';
import 'package:social_media/feature/auth/domain/repo/auth_repo.dart';
import 'package:social_media/feature/auth/presentation/manger/auth/auth_cubit.dart';
import 'package:social_media/feature/profile/domain/repo/profile_repo.dart';
import 'package:social_media/feature/profile/presentation/manger/profile/profile_cubit.dart';
import 'package:social_media/feature/splash/presentation/views/splash_view.dart';
import 'package:social_media/theme/light_mode.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await SharedPreferences.getInstance();
  await SharedPreferenceSingleton.init();
  setupGetItService();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => AuthCubit(repo: getIt.get<AuthRepo>())),
        BlocProvider(
          create: (_) => ProfileCubit(profileRepo: getIt.get<ProfileRepo>()),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: lightMode,
      onGenerateRoute: onGenerateRoute,
      initialRoute: SplashView.routeName,
    );
  }
}
