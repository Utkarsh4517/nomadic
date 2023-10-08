import 'package:flutter/material.dart';
import 'package:nomadic/constants/colors.dart';

class TicketsPage extends StatefulWidget {
  const TicketsPage({super.key});

  @override
  State<TicketsPage> createState() => _TicketsPageState();
}

class _TicketsPageState extends State<TicketsPage> {
  @override
  Widget build(BuildContext context) {
        return const Scaffold(
          backgroundColor: lightBlack,
      body: Center(
        child: Text('Tickets Page'),
      ),
    );
  }
}