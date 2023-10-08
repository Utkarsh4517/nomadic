import 'package:flutter/material.dart';


class MemoriesPage extends StatefulWidget {
  const MemoriesPage({super.key});

  @override
  State<MemoriesPage> createState() => _MemoriesPageState();
}

class _MemoriesPageState extends State<MemoriesPage> {
  @override
  Widget build(BuildContext context) {
        return const Scaffold(
      body: Center(
        child: Text('Memories Page'),
      ),
    );
  }
}