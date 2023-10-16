part of 'explore_bloc.dart';

@immutable
sealed class ExploreEvent {}

class ExploreInitialEvent extends ExploreEvent {}

class ShareJourneyButtonClicked extends ExploreEvent {}

class TitlePageNextButtonClickedEvent extends ExploreEvent {
  final String title;
  final String description;
  TitlePageNextButtonClickedEvent({
    required this.title,
    required this.description,
  });
}
