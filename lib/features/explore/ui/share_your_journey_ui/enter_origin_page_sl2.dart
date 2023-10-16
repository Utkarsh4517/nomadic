// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:google_places_flutter/google_places_flutter.dart';
import 'package:google_places_flutter/model/prediction.dart';
import 'package:nomadic/constants/colors.dart';
import 'package:nomadic/constants/dimensions.dart';
import 'package:nomadic/constants/google_api.dart';
import 'package:nomadic/features/explore/widgets/head_text.dart';

class EnterOriginPage extends StatefulWidget {
  const EnterOriginPage({super.key});

  @override
  State<EnterOriginPage> createState() => _EnterOriginPageState();
}

class _EnterOriginPageState extends State<EnterOriginPage> {
  final _originController = TextEditingController();
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
                text: 'Enter your origin',
              ),

              // Text field to search origin using google places..
              GooglePlaceAutoCompleteTextField(
                boxDecoration: const BoxDecoration(),
                textEditingController: _originController,
                googleAPIKey: placesApiKey,
                textStyle: const TextStyle(color: Colors.white),
                inputDecoration: InputDecoration(
                  label: const Text('Enter origin'),
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
                },
                itemClick: (Prediction prediction) {
                  _originController.text = prediction.description!;
                  _originController.selection = TextSelection.fromPosition(
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
              )
            ],
          ),
        )));
  }
}
