import 'package:flutter/material.dart';
import 'package:social_media/core/services/firebase_auth_service.dart';
import 'package:social_media/feature/auth/presentation/views/login_view.dart';
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

            MyDrawerTile(
              title: 'H O M E ',
              icon: Icons.home,
              onTap: () => Navigator.of(context).pop,
            ),
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
              title: 'S E A R C H',
              icon: Icons.search,
              onTap: () {},
            ),
            Spacer(),
            MyDrawerTile(
              title: 'L O G O U T ',
              icon: Icons.logout,
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text(
                        'Confirm Logout',
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.onSurface,
                        ),
                      ),
                      content: Text(
                        'Are you sure you want to logout?',
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.onSurface,
                        ),
                      ),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop(); // Close the dialog
                          },
                          child: Text(
                            'Cancel',
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.primary,
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: () async {
                            // Perform logout operation here
                            Navigator.of(context).pop(); // Close the dialog
                            FirebaseAuthService().signOut();
                            Navigator.of(
                              context,
                            ).pushReplacementNamed(LoginView.routeName);
                          },
                          child: Text(
                            'Logout',
                            style: TextStyle(color: Colors.red),
                          ),
                        ),
                      ],
                    );
                  },
                );
              },
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
