import 'package:flutter/material.dart';
import 'package:nomadic/constants/colors.dart';


class MemoriesPage extends StatefulWidget {
  const MemoriesPage({super.key});

  @override
  State<MemoriesPage> createState() => _MemoriesPageState();
}

class _MemoriesPageState extends State<MemoriesPage> {
  @override
  Widget build(BuildContext context) {
        return const Scaffold(
          backgroundColor: lightBlack,
      body: Center(
        child: Text('Memories Page'),
      ),
    );
  }
}