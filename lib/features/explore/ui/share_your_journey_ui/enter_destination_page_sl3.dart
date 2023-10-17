import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_places_flutter/google_places_flutter.dart';
import 'package:google_places_flutter/model/prediction.dart';
import 'package:nomadic/constants/colors.dart';
import 'package:nomadic/constants/dimensions.dart';
import 'package:nomadic/constants/google_api.dart';
import 'package:nomadic/features/explore/ui/share_your_journey_ui/add_points_to_map_page_sl4.dart';
import 'package:nomadic/features/explore/widgets/head_text.dart';
import 'package:nomadic/features/explore/widgets/large_button.dart';

class EnterDestinationScreen extends StatefulWidget {
  final String title;
  final String description;
  final LatLng origin;
  const EnterDestinationScreen({
    required this.title,
    required this.description,
    required this.origin,
    super.key,
  });

  @override
  State<EnterDestinationScreen> createState() => _EnterDestinationScreenState();
}

class _EnterDestinationScreenState extends State<EnterDestinationScreen> {
  final _destinationController = TextEditingController();
  double destinationLat = 0;
  double destinationLng = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: lightBlack,
        body: SafeArea(
            child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: getScreenWidth(context) * 0.04),
              const HeadText(
                color: pink,
                sizeFactor: 0.06,
                text: 'Enter your destination',
              ),
            
              // Text field to search origin using google places..
              GooglePlaceAutoCompleteTextField(
                boxDecoration: const BoxDecoration(),
                textEditingController: _destinationController,
                googleAPIKey: placesApiKey,
                textStyle: const TextStyle(color: Colors.white),
                inputDecoration: InputDecoration(
                  label: const Text('Enter destination'),
                  labelStyle: const TextStyle(color: secondary),
                  filled: true,
                  fillColor: grey,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide.none,
                  ),
                ),
                debounceTime: 800,
                isLatLngRequired: true,
                getPlaceDetailWithLatLng: (Prediction prediction) {
                  print("placeDetails${prediction.lng} ${prediction.lat}");
                  setState(() {
                    destinationLat = double.parse(prediction.lat!);
                    destinationLng = double.parse(prediction.lng!);
                  });
                },
                itemClick: (Prediction prediction) {
                  _destinationController.text = prediction.description!;
                  _destinationController.selection = TextSelection.fromPosition(
                      TextPosition(offset: prediction.description!.length));
                },
                itemBuilder: (context, index, Prediction prediction) {
                  return Container(
                    margin: EdgeInsets.symmetric(
                        horizontal: getScreenWidth(context) * 0.04),
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      children: [
                        const Icon(Icons.location_on),
                        const SizedBox(
                          width: 7,
                        ),
                        Expanded(child: Text(prediction.description ?? ""))
                      ],
                    ),
                  );
                },
                seperatedBuilder: const Divider(),
                isCrossBtnShown: true,
              ),
              LargeButton(
                  onTap: () {
                    if (destinationLat != 0 && destinationLng != 0) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AddPointsToMapPage(
                            title: widget.title,
                            description: widget.description,
                            origin: widget.origin,
                            destination: LatLng(
                              destinationLat,
                              destinationLng,
                            ),
                          ),
                        ),
                      );
                    }
                  },
                  text: 'Next')
            ],
          ),
        )));
  }
}
