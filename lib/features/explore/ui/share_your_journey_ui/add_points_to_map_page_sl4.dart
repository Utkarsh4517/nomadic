import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:nomadic/constants/colors.dart';
import 'package:nomadic/constants/dimensions.dart';
import 'package:nomadic/constants/google_api.dart';

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
  Location _locationController = Location();

  final Completer<GoogleMapController> _mapController =
      Completer<GoogleMapController>();

  Map<PolylineId, Polyline> polylines = {};

  @override
  void initState() {
    super.initState();
    getPolylinePoints().then((coordinates) {
      generatePolylineFromPoints(coordinates);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightBlack,
      body: SafeArea(
        child: Column(
          children: [
            // Text(
            //     'Origin = ${widget.origin.longitude}, ${widget.origin.latitude}'),
            // Text(
            //     'Destionation = ${widget.destination.longitude}, ${widget.destination.latitude}'),
            // Text('Title = ${widget.title}'),
            // Text('Description = ${widget.description}')
            Container(
              margin: EdgeInsets.symmetric(
                  horizontal: getScreenWidth(context) * 0.05),
              height: getScreenheight(context) * 0.6,
              width: getScreenWidth(context) * 0.9,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: GoogleMap(
                  onMapCreated: (GoogleMapController controller) =>
                      _mapController.complete(
                    controller,
                  ),
                  initialCameraPosition: CameraPosition(
                    target:
                        LatLng(widget.origin.latitude, widget.origin.longitude),
                    zoom: 13,
                  ),
                  markers: {
                    Marker(
                      markerId: const MarkerId("_sourceLocation"),
                      icon: BitmapDescriptor.defaultMarker,
                      position: LatLng(
                          widget.origin.latitude, widget.origin.longitude),
                    ),
                    Marker(
                      markerId: const MarkerId("_destinationLocation"),
                      icon: BitmapDescriptor.defaultMarker,
                      position: LatLng(widget.destination.latitude,
                          widget.destination.longitude),
                    ),
                  },
                  polylines: Set<Polyline>.of(polylines.values),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<List<LatLng>> getPolylinePoints() async {
    List<LatLng> polylineCoordinates = [];
    PolylinePoints polylinePoints = PolylinePoints();
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      placesApiKey,
      PointLatLng(widget.origin.latitude, widget.origin.longitude),
      PointLatLng(widget.destination.latitude, widget.destination.longitude),
      travelMode: TravelMode.driving,
    );
    if (result.points.isNotEmpty) {
      result.points.forEach((PointLatLng point) {
        polylineCoordinates.add(LatLng(point.latitude, point.longitude));
      });
    } else {
      print(result.errorMessage);
    }
    print(polylineCoordinates);

    return polylineCoordinates;
  }

  void generatePolylineFromPoints(List<LatLng> polylineCoordinates) async {
    PolylineId id = const PolylineId('poly');
    Polyline polyline = Polyline(
      polylineId: id,
      color: pink,
      points: polylineCoordinates,
      width: 3,
    );
    setState(() {
      polylines[id] = polyline;
    });
  }
}
