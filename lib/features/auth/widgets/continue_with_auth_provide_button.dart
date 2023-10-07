import 'package:flutter/material.dart';
import 'package:nomadic/constants/colors.dart';
import 'package:nomadic/constants/dimensions.dart';

class ContinueWithAuthProvider extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  const ContinueWithAuthProvider({
    required this.text,
    required this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      
        alignment: Alignment.center,
        margin:
            EdgeInsets.symmetric(horizontal: getScreenWidth(context) * 0.045, vertical: getScreenWidth(context) * 0.01),
        child: OutlinedButton(
          style: OutlinedButton.styleFrom(padding: EdgeInsets.symmetric(vertical: getScreenWidth(context) * 0.035)),            onPressed: onPressed,
            child: Container(
              alignment: Alignment.center,
              child: Text(
                text,
                style: const TextStyle(
                    color: whiteColor, fontWeight: FontWeight.w700),
              ),
            )));
  }
}
