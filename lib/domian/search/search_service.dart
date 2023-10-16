import 'package:dartz/dartz.dart';
import 'package:netflixproject/domian/core/failures/main_failure.dart';
import 'package:netflixproject/domian/search/models/search/search_repo/search_repo.dart';

abstract class SearchService {
  Future<Either<MainFailure, SearchRepo>> getSearchResult(
      {required String movieQuery});
}
