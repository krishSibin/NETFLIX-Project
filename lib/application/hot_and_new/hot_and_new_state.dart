part of 'hot_and_new_bloc.dart';

@freezed
class HotAndNewState with _$HotAndNewState {
  const factory HotAndNewState({
    required bool isLoading,
    required bool isError,
    required List<ComingSoonResult> comingSoonList,
    required List<EveryonesWatchingResult> everyonesWatchingList,
  }) = _HotAndNewState;

  factory HotAndNewState.initial() => const HotAndNewState(
      isLoading: true,
      isError: false,
      comingSoonList: [],
      everyonesWatchingList: []);
}
