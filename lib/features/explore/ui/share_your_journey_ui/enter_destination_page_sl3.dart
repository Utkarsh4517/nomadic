import 'package:flutter/material.dart';

class EnterDestinationScreen extends StatefulWidget {
  const EnterDestinationScreen({super.key});

  @override
  State<EnterDestinationScreen> createState() => _EnterDestinationScreenState();
}

class _EnterDestinationScreenState extends State<EnterDestinationScreen> {
  @override
  Widget build(BuildContext context) {
        return Scaffold(
      body: Center(
        child: Text('Destination Screen'),
      ),
    );
  }
}