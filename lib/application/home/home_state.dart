part of 'home_bloc.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState({
    required String stateId,
    required bool isLoading,
    required bool isError,
    required List<ComingSoonResult> releasedInPastYrList,
    required List<ComingSoonResult> trendingNow,
    required List<ComingSoonResult> tenseDrama,
    required List<ComingSoonResult> southIndianCinema,
    required List<EveryonesWatchingResult> tvTop10List,
  }) = _HomeState;

  factory HomeState.initial() => const HomeState(
      stateId: '0',
      isLoading: false,
      isError: false,
      releasedInPastYrList: [],
      trendingNow: [],
      tenseDrama: [],
      southIndianCinema: [],
      tvTop10List: []);
}
