import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nomadic/constants/colors.dart';
import 'package:nomadic/constants/dimensions.dart';

class LoginPageBoldText extends StatelessWidget {
  final String text;
  const LoginPageBoldText({
    required this.text,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: getScreenWidth(context) * 0.04,
        bottom: getScreenWidth(context) * 0.005,
      ),
      child: Text(
        text,
        style: GoogleFonts.roboto(
          color: secondary,
          fontSize: getScreenWidth(context) * 0.07,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}
