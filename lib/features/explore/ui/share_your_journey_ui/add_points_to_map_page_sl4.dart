import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:nomadic/constants/colors.dart';

class AddPointsToMapPage extends StatefulWidget {
  final String title;
  final String description;
  final LatLng origin;
  final LatLng destination;
  const AddPointsToMapPage({
    required this.title,
    required this.description,
    required this.origin,
    required this.destination,
    super.key,
  });

  @override
  State<AddPointsToMapPage> createState() => _AddPointsToMapPageState();
}

class _AddPointsToMapPageState extends State<AddPointsToMapPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: SafeArea(
        child: Column(
          children: [
            Text(
                'Origin = ${widget.origin.longitude}, ${widget.origin.latitude}'),
            Text(
                'Destionation = ${widget.destination.longitude}, ${widget.destination.latitude}'),
            Text('Title = ${widget.title}'),
            Text('Description = ${widget.description}')
          ],
        ),
      ),
    );
  }
}
