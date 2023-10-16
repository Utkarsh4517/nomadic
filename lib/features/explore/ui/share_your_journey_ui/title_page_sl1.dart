import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nomadic/constants/colors.dart';
import 'package:nomadic/constants/dimensions.dart';
import 'package:nomadic/features/explore/bloc/explore_bloc.dart';
import 'package:nomadic/features/explore/ui/share_your_journey_ui/enter_origin_page_sl2.dart';
import 'package:nomadic/features/explore/widgets/custom_text_field.dart';
import 'package:nomadic/features/explore/widgets/head_text.dart';
import 'package:nomadic/features/explore/widgets/large_button.dart';

class TitlePage extends StatefulWidget {
  const TitlePage({super.key});

  @override
  State<TitlePage> createState() => _TitlePageState();
}

class _TitlePageState extends State<TitlePage> {
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  final exploreBloc = ExploreBloc();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ExploreBloc, ExploreState>(
      bloc: exploreBloc,
      listenWhen: (previous, current) => current is ExploreActionState,
      buildWhen: (previous, current) => current is! ExploreActionState,
      listener: (context, state) {},
      builder: (context, state) {
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
                      text: 'Tell us about your journey!'),
                  const HeadText(
                      color: whiteColor,
                      sizeFactor: 0.035,
                      text: 'Enter a catchy title!!'),
                  CustomTextField(hintText: '', controller: _titleController),
                  const HeadText(
                      color: whiteColor,
                      sizeFactor: 0.035,
                      text: 'Add a cool description'),
                  CustomTextField(
                    hintText: '',
                    controller: _descriptionController,
                    height: 0.5,
                  ),
                  LargeButton(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => EnterOriginPage(
                            title: _titleController.text,
                            description: _descriptionController.text,
                          ),
                        ),
                      );
                    },
                    text: 'Next',
                  )
                ],
              ),
            )));
      },
    );
  }
}
