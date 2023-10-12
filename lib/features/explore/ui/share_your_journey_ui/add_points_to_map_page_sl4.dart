import 'package:flutter/material.dart';

class AddPointsToMapPage extends StatefulWidget {
  const AddPointsToMapPage({super.key});

  @override
  State<AddPointsToMapPage> createState() => _AddPointsToMapPageState();
}

class _AddPointsToMapPageState extends State<AddPointsToMapPage> {
  @override
  Widget build(BuildContext context) {
        return Scaffold(
      body: Center(
        child: Text('Add Points to map'),
      ),
    );
  }
}