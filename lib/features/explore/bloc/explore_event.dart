part of 'explore_bloc.dart';

@immutable
sealed class ExploreEvent {}

class ExploreInitialEvent extends ExploreEvent {}

class ShareJourneyButtonClicked extends ExploreEvent {}
