part of 'search_bloc.dart';

@freezed
class SearchState with _$SearchState {
  const factory SearchState({
    required List<ResultData> searchResultList,
    required List<Downloads> idleList,
    required bool isLoading,
    required bool iserror,
  }) = _SearchState;

  factory SearchState.initial() => const SearchState(
      searchResultList: [], idleList: [], isLoading: true, iserror: false);
}
