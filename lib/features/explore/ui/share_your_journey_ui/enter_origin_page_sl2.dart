import 'package:flutter/material.dart';

class EnterOriginPage extends StatefulWidget {
  const EnterOriginPage({super.key});

  @override
  State<EnterOriginPage> createState() => _EnterOriginPageState();
}

class _EnterOriginPageState extends State<EnterOriginPage> {
  @override
  Widget build(BuildContext context) {
        return Scaffold(
      body: Center(
        child: Text('Enter Origin Page'),
      ),
    );
  }
}