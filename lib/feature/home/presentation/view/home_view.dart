import 'package:flutter/material.dart';
import 'package:social_media/feature/home/presentation/view/widgets/home_view_body.dart';
import 'package:social_media/feature/home/presentation/view/widgets/my_drawer.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  static const String routeName = 'home_view';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: const Text('Home View')),
      drawer: MyDrawer(),
      body: HomeViewBody(),
    );
  }
}
