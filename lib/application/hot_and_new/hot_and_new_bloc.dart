import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:netflixproject/domian/core/failures/main_failure.dart';
import 'package:netflixproject/domian/hot_and_new/hot_and_new_service.dart';
import 'package:netflixproject/domian/hot_and_new/model/coming_soon_model/coming_soon_movie_repo.dart';
import 'package:netflixproject/domian/hot_and_new/model/everyones_watching_model/everyone_is_watching_repo.dart';

part 'hot_and_new_event.dart';
part 'hot_and_new_state.dart';
part 'hot_and_new_bloc.freezed.dart';

@injectable
class HotAndNewBloc extends Bloc<HotAndNewEvent, HotAndNewState> {
  HotAndNewService hotAndNewService;
  HotAndNewBloc(this.hotAndNewService) : super(HotAndNewState.initial()) {
    on<ComingSoonInitialize>((event, emit) async {
      emit(state.copyWith(isLoading: true, isError: false, comingSoonList: []));

      final comingsoonResponse =
          await hotAndNewService.getComingSoonMovieData();

      final comingSoonState = comingsoonResponse.fold(
          (MainFailure f) => const HotAndNewState(
              isLoading: false,
              isError: true,
              comingSoonList: [],
              everyonesWatchingList: []), (ComingSoonMovieRepo obj) {
        return state.copyWith(
            comingSoonList: obj.results, isLoading: false, isError: false);
      });

      emit(comingSoonState);
    });

    on<EveryonesWatchingInitialize>((event, emit) async {
      emit(state.copyWith(
          isLoading: true, isError: false, everyonesWatchingList: []));

      final everyonesWatchingResponse =
          await hotAndNewService.getEveryOneIsWatchingData();

      final everyonesWatchingState = everyonesWatchingResponse.fold(
          (MainFailure f) => const HotAndNewState(
              isLoading: false,
              isError: true,
              comingSoonList: [],
              everyonesWatchingList: []), (EveryoneIsWatchingRepo obj) {
        return state.copyWith(
            everyonesWatchingList: obj.results,
            isLoading: false,
            isError: false);
      });

      emit(everyonesWatchingState);
    });
  }
}
