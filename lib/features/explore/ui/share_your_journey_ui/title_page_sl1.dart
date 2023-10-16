import 'package:flutter/material.dart';
import 'package:nomadic/constants/colors.dart';
import 'package:nomadic/constants/dimensions.dart';
import 'package:nomadic/features/explore/widgets/custom_text_field.dart';
import 'package:nomadic/features/explore/widgets/head_text.dart';

class TitlePage extends StatefulWidget {
  const TitlePage({super.key});

  @override
  State<TitlePage> createState() => _TitlePageState();
}

class _TitlePageState extends State<TitlePage> {
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: lightBlack,
      body: SafeArea(child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: getScreenWidth(context) * 0.04),
            const HeadText(color: pink, sizeFactor: 0.06, text: 'Tell us about your journey!'),
            const HeadText(color: whiteColor, sizeFactor: 0.035, text: 'Enter a catchy title!!'),
            CustomTextField(hintText: '', controller: _titleController),
            const HeadText(color: whiteColor, sizeFactor: 0.035, text: 'Add a cool description'),
            CustomTextField(hintText: '', controller: _descriptionController, height: 0.5,)
          ],
        ),
      ))
    );
  }
}