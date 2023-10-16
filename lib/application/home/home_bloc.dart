import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:netflixproject/domian/core/failures/main_failure.dart';
import 'package:netflixproject/domian/hot_and_new/hot_and_new_service.dart';
import 'package:netflixproject/domian/hot_and_new/model/coming_soon_model/coming_soon_movie_repo.dart';
import 'package:netflixproject/domian/hot_and_new/model/everyones_watching_model/everyone_is_watching_repo.dart';

part 'home_event.dart';
part 'home_state.dart';
part 'home_bloc.freezed.dart';

@injectable
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HotAndNewService homeService;

  HomeBloc(this.homeService) : super(HomeState.initial()) {
    on<GetMovieData>((event, emit) async {
      emit(state.copyWith(isLoading: true, isError: false));

      final movieServiceResult = await homeService.getComingSoonMovieData();
      final tvServiceResult = await homeService.getEveryOneIsWatchingData();

      final movieState = movieServiceResult.fold((MainFailure f) {
        return const HomeState(
            stateId: '0',
            isLoading: false,
            isError: true,
            releasedInPastYrList: [],
            trendingNow: [],
            tenseDrama: [],
            southIndianCinema: [],
            tvTop10List: []);
      }, (ComingSoonMovieRepo comingSoonObj) {
        log('inside event');
        final releasedInPastYrList = comingSoonObj.results;
        final trendingNow = comingSoonObj.results;
        final tenseDrama = comingSoonObj.results;
        final southIndianCinema = comingSoonObj.results;

        // releasedInPastYrList.shuffle();
        // trendingNow.shuffle();
        // tenseDrama.shuffle();
        // southIndianCinema.shuffle();

        log('log1 ${releasedInPastYrList[0].originalTitle},,${releasedInPastYrList[1].originalTitle}');

        return HomeState(
            stateId: DateTime.now().millisecondsSinceEpoch.toString(),
            isLoading: false,
            isError: false,
            releasedInPastYrList: releasedInPastYrList,
            trendingNow: trendingNow,
            tenseDrama: tenseDrama,
            southIndianCinema: southIndianCinema,
            tvTop10List: state.tvTop10List);
      });

      emit(movieState);

      final tvState = tvServiceResult.fold((MainFailure f) {
        return state.copyWith(
          isLoading: false,
          isError: true,
          tvTop10List: [],
          releasedInPastYrList: [],
          trendingNow: [],
          tenseDrama: [],
          southIndianCinema: [],
        );
      }, (tvObj) {
        return HomeState(
            stateId: DateTime.now().millisecondsSinceEpoch.toString(),
            isLoading: false,
            isError: false,
            releasedInPastYrList: state.releasedInPastYrList,
            trendingNow: state.trendingNow,
            tenseDrama: state.tenseDrama,
            southIndianCinema: state.southIndianCinema,
            tvTop10List: tvObj.results);
      });
      emit(tvState);
    });
  }
}
