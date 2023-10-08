import 'package:flutter/material.dart';
import 'package:nomadic/constants/colors.dart';
import 'package:nomadic/features/explore/widgets/head_text.dart';

class EnterDestinationPage extends StatefulWidget {
  const EnterDestinationPage({super.key});

  @override
  State<EnterDestinationPage> createState() => _EnterDestinationPageState();
}

class _EnterDestinationPageState extends State<EnterDestinationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: lightBlack,
        iconTheme: const IconThemeData(color: whiteColor),
      ),
      backgroundColor: lightBlack,
      body: const SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              HeadText(
                  color: pink,
                  sizeFactor: 0.06,
                  text: 'Search your destination!')
            ],
          ),
        ),
      ),
    );
  }
}
