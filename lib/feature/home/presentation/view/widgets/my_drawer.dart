import 'package:flutter/material.dart';
import 'package:social_media/feature/home/presentation/view/widgets/my_drawer_tile.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.surface,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            const SizedBox(height: 60),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 36),
              child: Icon(
                Icons.person,
                size: 100,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            Divider(color: Theme.of(context).colorScheme.secondary),

            MyDrawerTile(title: 'H O M E ', icon: Icons.home, onTap: () {}),
            MyDrawerTile(
              title: 'P R O F I L E ',
              icon: Icons.person,
              onTap: () {},
            ),
            MyDrawerTile(
              title: 'S E T T I N G S ',
              icon: Icons.settings,
              onTap: () {},
            ),
            MyDrawerTile(
              title: 'L O G O U T ',
              icon: Icons.logout,
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
