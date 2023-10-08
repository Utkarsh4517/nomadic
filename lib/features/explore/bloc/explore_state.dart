part of 'explore_bloc.dart';

@immutable
sealed class ExploreState {}

final class ExploreInitial extends ExploreState {}

abstract class ExploreActionState extends ExploreState {}

class ExplorePageLoadingState extends ExploreState {}

class ExplorePageLoadedSuccessState extends ExploreState {}
