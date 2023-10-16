
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:netflixproject/domian/core/failures/main_failure.dart';
import 'package:netflixproject/domian/downloads/idownloads_repo.dart';
import 'package:netflixproject/domian/downloads/models/downloads.dart';
import 'package:netflixproject/domian/search/search_service.dart';

import '../../domian/search/models/search/search_repo/search_repo.dart';

part 'search_event.dart';
part 'search_state.dart';
part 'search_bloc.freezed.dart';

@injectable
class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final IdownloadsRepo _downloadService;
  final SearchService _searchService;
  SearchBloc(this._downloadService, this._searchService)
      : super(SearchState.initial()) {
    on<Initialize>((event, emit) async {
      final response = await _downloadService.getDownloadsImages();
      emit(const SearchState(
          searchResultList: [], idleList: [], isLoading: true, iserror: false));

      emit(response.fold((MainFailure f) {
        return const SearchState(
            searchResultList: [],
            idleList: [],
            isLoading: false,
            iserror: true);
      }, (List<Downloads> list) {
        return SearchState(
            searchResultList: [],
            idleList: list,
            isLoading: false,
            iserror: false);
      }));
    });

    on<SearchMovie>((event, emit) async {
      emit(state
          .copyWith(isLoading: true, iserror: false, searchResultList: []));
      final searchResponse =
          await _searchService.getSearchResult(movieQuery: event.movieQuery);

      emit(searchResponse.fold((MainFailure f) {
        return state
            .copyWith(isLoading: false, iserror: false, searchResultList: []);
      }, (SearchRepo obj) {
        return state.copyWith(
            isLoading: false, iserror: false, searchResultList: obj.results);
      }));
    });
  }
}
