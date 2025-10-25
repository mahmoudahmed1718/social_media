import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:social_media/core/helper/on_generate_route.dart';
import 'package:social_media/core/services/get_it_service.dart';
import 'package:social_media/core/services/shared_prefence_singleton.dart';
import 'package:social_media/feature/splash/presentation/views/splash_view.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await SharedPreferences.getInstance();
  await SharedPreferenceSingleton.init();
  setupGetItService();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: onGenerateRoute,
      initialRoute: SplashView.routeName,
      home: Scaffold(
        appBar: AppBar(title: const Text('Social Media App')),
        body: const Center(child: Text('Welcome to the Social Media App!')),
      ),
    );
  }
}
