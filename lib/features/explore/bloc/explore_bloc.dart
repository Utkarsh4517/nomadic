import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'explore_event.dart';
part 'explore_state.dart';

class ExploreBloc extends Bloc<ExploreEvent, ExploreState> {
  ExploreBloc() : super(ExploreInitial()) {
    on<ExploreInitialEvent>(exploreInitialEvent);
    on<ShareJourneyButtonClicked>(shareJourneyButtonClicked);
  }

  FutureOr<void> exploreInitialEvent(
      ExploreInitialEvent event, Emitter<ExploreState> emit) {
    emit(ExplorePageLoadedSuccessState());
  }

  FutureOr<void> shareJourneyButtonClicked(
      ShareJourneyButtonClicked event, Emitter<ExploreState> emit) {
        emit(ShareJourneyButtonClickedState());
      }
}
