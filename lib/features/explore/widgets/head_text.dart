import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nomadic/constants/dimensions.dart';

class HeadText extends StatelessWidget {
  final String text;
  final Color color;
  final double sizeFactor;
  const HeadText({
    required this.color,
    required this.sizeFactor,
    required this.text,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          left: getScreenWidth(context) * 0.05,
          bottom: getScreenWidth(context) * 0.04,
          top: getScreenWidth(context) * 0.02),
      child: Text(
        text,
        style: GoogleFonts.roboto(
          color: color,
          fontSize: getScreenWidth(context) * sizeFactor,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}
