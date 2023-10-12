import 'package:flutter/material.dart';
import 'package:nomadic/constants/colors.dart';
import 'package:nomadic/constants/dimensions.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final TextEditingController controller;
  const CustomTextField({
    required this.hintText,
    required this.icon,
    required this.controller,
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
        style: const TextStyle(color: secondary),
        decoration: InputDecoration(
          suffixIcon: Icon(icon, color: secondary),
          label: Text(hintText),
          labelStyle: const TextStyle(color: secondary),
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
