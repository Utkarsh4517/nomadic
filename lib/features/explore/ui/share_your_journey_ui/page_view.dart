import 'package:flutter/material.dart';
import 'package:nomadic/features/explore/ui/share_your_journey_ui/add_points_to_map_page_sl4.dart';
import 'package:nomadic/features/explore/ui/share_your_journey_ui/enter_destination_page_sl3.dart';
import 'package:nomadic/features/explore/ui/share_your_journey_ui/enter_origin_page_sl2.dart';
import 'package:nomadic/features/explore/ui/share_your_journey_ui/final_map_page_sl5.dart';
import 'package:nomadic/features/explore/ui/share_your_journey_ui/title_page_sl1.dart';

class CreateJourneyPageView extends StatefulWidget {
  const CreateJourneyPageView({super.key});

  @override
  State<CreateJourneyPageView> createState() => CreateJourneyPageViewState();
}

class CreateJourneyPageViewState extends State<CreateJourneyPageView> {
  final pageController = PageController();
  bool onLastPage = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        onPageChanged: (index) {
          setState(() {
            onLastPage = (index == 5);
          });
        },
        controller: pageController,
        children: const [
          TitlePage(),
          EnterOriginPage(),
          EnterDestinationScreen(),
          AddPointsToMapPage(),
          FinalMapPage()
        ],
      ),
    );
  }
}
