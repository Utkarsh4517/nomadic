import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nomadic/constants/colors.dart';
import 'package:nomadic/constants/dimensions.dart';

class LargeButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  const LargeButton({
    required this.onTap,
    required this.text,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: pink,
          borderRadius: BorderRadius.circular(
            10,
          ),
        ),
        margin: EdgeInsets.all(
          getScreenWidth(context) * 0.05,
        ),
        padding: EdgeInsets.symmetric(
          horizontal: getScreenWidth(context) * 0.06,
          vertical: getScreenWidth(context) * 0.035,
        ),
        child: Text(
          'Next',
          style: GoogleFonts.roboto(
            color: blackColor,
            fontSize: getScreenWidth(context) * 0.04,
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
    );
  }
}
