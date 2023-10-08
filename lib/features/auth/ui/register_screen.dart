// ignore_for_file: use_build_context_synchronously

import 'package:appwrite/appwrite.dart';
import 'package:flutter/material.dart';
import 'package:nomadic/constants/colors.dart';
import 'package:nomadic/features/auth/repo/auth_repo.dart';
import 'package:nomadic/features/auth/widgets/auth_text_field.dart';
import 'package:nomadic/features/auth/widgets/full_size_button.dart';
import 'package:nomadic/features/auth/widgets/login_page_bold_text.dart';
import 'package:nomadic/features/navbar/ui/nav_bar.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final emailTextController = TextEditingController();
  final passwordTextController = TextEditingController();
  final nameTextController = TextEditingController();

  createAccount() async {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return const Dialog(
            backgroundColor: Colors.transparent,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CircularProgressIndicator(),
                ]),
          );
        });
    try {
      final AuthServive appwrite = context.read<AuthServive>();
      await appwrite.createUser(
        email: emailTextController.text,
        password: passwordTextController.text,
        name: nameTextController.text,
      );
      Navigator.pop(context);
      const snackbar = SnackBar(content: Text('Account created!'));
      ScaffoldMessenger.of(context).showSnackBar(snackbar);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const NavBar(),
        ),
      );
    } on AppwriteException catch (e) {
      Navigator.pop(context);
      showAlert(title: 'Account creation failed', text: e.message.toString());
    }
  }

  showAlert({required String title, required String text}) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(title),
            content: Text(text),
            actions: [
              ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Ok'))
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: lightBlack,
        iconTheme: const IconThemeData(color: whiteColor),
      ),
      backgroundColor: lightBlack,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const LoginPageBoldText(
              text: 'Enter your name',
            ),
            AuthTextField(
              controller: nameTextController,
              obscure: false,
            ),
            const LoginPageBoldText(
              text: 'Enter your email',
            ),
            AuthTextField(
              controller: emailTextController,
              obscure: false,
            ),
            const LoginPageBoldText(
              text: 'Password',
            ),
            AuthTextField(
              controller: passwordTextController,
              obscure: false,
            ),
            FullSizeButton(
              text: 'Sign-up',
              function: createAccount,
            ),
          ],
        ),
      ),
    );
  }
}
