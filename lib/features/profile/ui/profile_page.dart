import 'package:flutter/material.dart';
import 'package:nomadic/constants/colors.dart';
import 'package:nomadic/features/auth/repo/auth_repo.dart';
import 'package:nomadic/features/auth/ui/auth_screen.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightBlack,
      body: Center(
        child: Column(
          children: [
            const Text('Profile Page'),
            TextButton(
                onPressed: () async {
                  await AuthServive().signOut();
                  // ignore: use_build_context_synchronously
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const AuthScreen()));
                },
                // selectedItemColor: blackColor,
                child: const Text('Sign Out'))
          ],
        ),
      ),
    );
  }
}
