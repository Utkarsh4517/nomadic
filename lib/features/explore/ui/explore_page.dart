import 'package:flutter/material.dart';
import 'package:nomadic/constants/colors.dart';

class ExplorePage extends StatefulWidget {
  const ExplorePage({super.key});

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: lightBlack,
      body: Center(
        child: Text('Explore Page'),
      ),
    );
  }
}
