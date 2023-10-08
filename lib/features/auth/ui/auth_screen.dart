import 'package:flutter/material.dart';
import 'package:appwrite/models.dart' as models;
import 'package:google_fonts/google_fonts.dart';
import 'package:nomadic/constants/colors.dart';
import 'package:nomadic/constants/dimensions.dart';
import 'package:nomadic/features/auth/ui/login_screen.dart';
import 'package:nomadic/features/auth/ui/register_screen.dart';
import 'package:nomadic/features/auth/widgets/continue_with_auth_provide_button.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({
    super.key,
  });

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  @override
  void initState() {
    super.initState();
  }

  models.User? loggedInUser;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primary,
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: getScreenheight(context) * 0.45),
          Text('Your super app,',
              style: GoogleFonts.leagueSpartan(
                  color: whiteColor,
                  fontSize: getScreenWidth(context) * 0.08,
                  fontWeight: FontWeight.w700)),
          Text('for travelling',
              style: GoogleFonts.leagueSpartan(
                  color: whiteColor,
                  fontSize: getScreenWidth(context) * 0.08,
                  fontWeight: FontWeight.w700)),
          SizedBox(height: getScreenheight(context) * 0.05),
          // Navigate to register page
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(
                  horizontal: getScreenWidth(context) * 0.35,
                  vertical: getScreenWidth(context) * 0.04),
              backgroundColor: pink,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const RegisterScreen(),
                ),
              );
            },
            child: const Text(
              'Sign-up free',
              style: TextStyle(color: whiteColor, fontWeight: FontWeight.w700),
            ),
          ),
          SizedBox(height: getScreenWidth(context) * 0.01),

          // Continue with auth provider button....
          ContinueWithAuthProvider(
              onPressed: () {}, text: 'Continue with phone number'),
          ContinueWithAuthProvider(
              onPressed: () {}, text: 'Continue with google'),
          ContinueWithAuthProvider(
              onPressed: () {}, text: 'Continue with facebook'),

          // Navigate to login screen
          TextButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const LogInScreen()));
            },
            child: const Text(
              'Login',
              style: TextStyle(
                color: pink,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ],
      )),
    );
  }
}
