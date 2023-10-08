import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'explore_event.dart';
part 'explore_state.dart';

class ExploreBloc extends Bloc<ExploreEvent, ExploreState> {
  ExploreBloc() : super(ExploreInitial()) {
    on<ExploreInitialEvent>(exploreInitialEvent);
  }

  FutureOr<void> exploreInitialEvent(
      ExploreInitialEvent event, Emitter<ExploreState> emit) {
        emit(ExplorePageLoadedSuccessState());
      }
}
