import 'package:flutter/material.dart';
import 'package:nomadic/constants/colors.dart';
import 'package:nomadic/constants/dimensions.dart';

class AuthTextField extends StatelessWidget {
  final bool obscure;
  final TextEditingController controller;
  const AuthTextField({
    required this.controller,
    required this.obscure,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: getScreenWidth(context) * 0.04)
          .copyWith(
        bottom: getScreenWidth(context) * 0.08,
      ),
      height: getScreenWidth(context) * 0.125,
      child: TextField(
        controller: controller,
        obscureText: obscure,
        style: const TextStyle(color: secondary),
        decoration: InputDecoration(
          filled: true,
          fillColor: grey,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}
