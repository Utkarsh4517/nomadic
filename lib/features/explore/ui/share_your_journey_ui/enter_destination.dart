import 'dart:async';

import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:nomadic/constants/colors.dart';
import 'package:nomadic/constants/dimensions.dart';
import 'package:nomadic/constants/google_api.dart';
import 'package:nomadic/features/explore/widgets/custom_text_field.dart';
import 'package:nomadic/features/explore/widgets/head_text.dart';

class EnterDestinationPage extends StatefulWidget {
  const EnterDestinationPage({super.key});

  @override
  State<EnterDestinationPage> createState() => _EnterDestinationPageState();
}

class _EnterDestinationPageState extends State<EnterDestinationPage> {
  Location _locationController = Location();

  final Completer<GoogleMapController> _mapController =
      Completer<GoogleMapController>();
  static const LatLng _kGooglePlex = LatLng(28.75327, 77.49683);
  static const LatLng _kApplePlex = LatLng(28.74689, 77.48786);

  LatLng? _currentP = null;

  Map<PolylineId, Polyline> polylines = {};

  @override
  void initState() {
    super.initState();
    getLocationUpdates().then((_) => getPolyLinePoints().then((coordinates) {
          generatePolyLineFromPoints(coordinates);
        }));
  }

  @override
  Widget build(BuildContext context) {
    final searchDestinationController = TextEditingController();
    final searcOriginController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: lightBlack,
        iconTheme: const IconThemeData(color: whiteColor),
      ),
      backgroundColor: lightBlack,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const HeadText(
                color: pink,
                sizeFactor: 0.06,
                text: 'Search your destination!',
              ),
              CustomTextField(
                icon: FeatherIcons.search,
                hintText: 'Search destination',
                controller: searchDestinationController,
              ),
              CustomTextField(
                icon: FeatherIcons.search,
                hintText: 'Enter origin',
                controller: searcOriginController,
              ),
              if (_currentP == null)
                Container(
                  alignment: Alignment.center,
                  child: const HeadText(
                      color: whiteColor, sizeFactor: 0.04, text: 'Loading..'),
                ),
              if (_currentP != null)
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
                        initialCameraPosition: const CameraPosition(
                          target: _kGooglePlex,
                          zoom: 13,
                        ),
                        markers: {
                          Marker(
                            markerId: const MarkerId("_currentLocation"),
                            icon: BitmapDescriptor.defaultMarker,
                            position: _currentP!,
                          ),
                          const Marker(
                            markerId: MarkerId("_sourceLocation"),
                            icon: BitmapDescriptor.defaultMarker,
                            position: _kGooglePlex,
                          ),
                          const Marker(
                            markerId: MarkerId("_destinationLocation"),
                            icon: BitmapDescriptor.defaultMarker,
                            position: _kApplePlex,
                          ),
                        },
                        polylines: Set<Polyline>.of(polylines.values),
                      ),
                    ))
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _cameraToPosition(LatLng pos) async {
    final GoogleMapController controller = await _mapController.future;
    CameraPosition _newCameraPosition = CameraPosition(target: pos, zoom: 13);
    await controller
        .animateCamera(CameraUpdate.newCameraPosition(_newCameraPosition));
  }

  Future<void> getLocationUpdates() async {
    bool _serviceEnabled;
    PermissionStatus _permissionGranted;

    _serviceEnabled = await _locationController.serviceEnabled();
    if (_serviceEnabled) {
      _serviceEnabled = await _locationController.requestService();
    } else {
      return;
    }

    _permissionGranted = await _locationController.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await _locationController.requestPermission();
      if (_permissionGranted == PermissionStatus.granted) {
        return;
      }
    }

    _locationController.onLocationChanged
        .listen((LocationData currentLocation) {
      if (currentLocation.latitude != null &&
          currentLocation.longitude != null) {
        setState(() {
          _currentP = LatLng(
            currentLocation.latitude!,
            currentLocation.longitude!,
          );
          _cameraToPosition(_currentP!);
        });
      }
    });
  }

  Future<List<LatLng>> getPolyLinePoints() async {
    List<LatLng> polyLineCoordinates = [];
    PolylinePoints polylinePoints = PolylinePoints();
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      mapsApiKey,
      PointLatLng(_kGooglePlex.latitude, _kGooglePlex.longitude),
      PointLatLng(_kApplePlex.latitude, _kApplePlex.longitude),
      travelMode: TravelMode.driving,
    );
    if (result.points.isNotEmpty) {
      result.points.forEach((PointLatLng point) {
        polyLineCoordinates.add(LatLng(point.latitude, point.longitude));
      });
    } else {
      print(result.errorMessage);
    }

    return polyLineCoordinates;
  }

  void generatePolyLineFromPoints(List<LatLng> polyLineCoordinates) async {
    // if we are going to show multiple polylines on our map then we need to show multiple polyline id
    PolylineId id = const PolylineId('poly');
    Polyline polyline = Polyline(
      polylineId: id,
      color: pink,
      points: polyLineCoordinates,
      width: 8,
    );
    setState(() {
      polylines[id] = polyline;
    });
  }
}
