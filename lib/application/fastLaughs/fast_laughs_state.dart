part of 'fast_laughs_bloc.dart';

@freezed
class FastLaughsState with _$FastLaughsState {
  const factory FastLaughsState({
    required bool isLoading,
    required bool isError,
    required List<Downloads> downloadList,
  }) = _FastLaughsState;

  factory FastLaughsState.initial() => const FastLaughsState(
        isLoading: true,
        isError: false,
        downloadList: [],
      );
}
