import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nomadic/constants/colors.dart';
import 'package:nomadic/constants/dimensions.dart';
import 'package:nomadic/features/explore/bloc/explore_bloc.dart';
import 'package:nomadic/features/explore/widgets/head_text.dart';

class ExplorePage extends StatefulWidget {
  const ExplorePage({super.key});

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    exploreBloc.add(ExploreInitialEvent());
    super.initState();
  }

  final exploreBloc = ExploreBloc();

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocConsumer<ExploreBloc, ExploreState>(
      bloc: exploreBloc,
      listenWhen: (previous, current) => current is ExploreActionState,
      buildWhen: (previous, current) => current is! ExploreActionState,
      listener: (context, state) {},
      builder: (context, state) {
        switch (state.runtimeType) {
          case ExplorePageLoadingState:
            return const Scaffold(
              backgroundColor: lightBlack,
              body: Center(
                child: CircularProgressIndicator(
                  color: pink,
                ),
              ),
            );
          case ExplorePageLoadedSuccessState:
            return Scaffold(
                backgroundColor: lightBlack,
                floatingActionButton: SizedBox(
                  width: getScreenWidth(context) * 0.4,
                  child: FloatingActionButton(
                    backgroundColor: blackColor,
                    onPressed: () {},
                    child: const Text(
                      'Share your journey!',
                      style: TextStyle(
                        color: pink,
                      ),
                    ),
                  ),
                ),
                body: const SafeArea(
                    child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      HeadText(
                          text: 'Explore, inspire',
                          color: pink,
                          sizeFactor: 0.06),
                      HeadText(
                          text: 'Popular destinations!',
                          color: whiteColor,
                          sizeFactor: 0.03),

                      // Popular Destinations
                    ],
                  ),
                )));

          default:
            return const Scaffold(
              backgroundColor: lightBlack,
              body: Center(
                child: Text(
                  'Error!',
                  style: TextStyle(color: pink),
                ),
              ),
            );
        }
      },
    );
  }
}
