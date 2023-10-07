import 'package:flutter/material.dart';
import 'package:nomadic/features/auth/repo/auth_repo.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  final authService = AuthServive();
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: TextButton(onPressed: (){
          authService.signOut();
        }, child: const Text('Sign out')),
      ),
    );
  }
}