import 'package:flutter/material.dart';
import 'package:nomadic/constants/colors.dart';
import 'package:nomadic/constants/dimensions.dart';

class FullSizeButton extends StatelessWidget {
  final String text;
  final VoidCallback function;
  const FullSizeButton({
    required this.text,
    required this.function,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: pink,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            padding: EdgeInsets.symmetric(
              horizontal: getScreenWidth(context) * 0.42,
            )),
        onPressed: function,
        child: Text(
          text,
          style:
              const TextStyle(color: whiteColor, fontWeight: FontWeight.w700),
        ),
      ),
    );
  }
}
