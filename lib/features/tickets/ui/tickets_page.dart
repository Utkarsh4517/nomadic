import 'package:flutter/material.dart';

class TicketsPage extends StatefulWidget {
  const TicketsPage({super.key});

  @override
  State<TicketsPage> createState() => _TicketsPageState();
}

class _TicketsPageState extends State<TicketsPage> {
  @override
  Widget build(BuildContext context) {
        return const Scaffold(
      body: Center(
        child: Text('Tickets Page'),
      ),
    );
  }
}