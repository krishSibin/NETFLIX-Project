import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import 'package:netflixproject/domian/search/models/search/search_repo/search_repo.dart';
import 'package:netflixproject/domian/search/search_service.dart';

import '../../domian/core/api_end_points.dart';
import '../../domian/core/failures/main_failure.dart';

@LazySingleton(as: SearchService)
class SearchServiceImplementation implements SearchService {
  @override
  Future<Either<MainFailure, SearchRepo>> getSearchResult(
      {required String movieQuery}) async {
    // final dio = Dio(BaseOptions());
    final response = await Dio(BaseOptions())
        .get(ApiEndPoints.search, queryParameters: {'query': movieQuery});

    log(response.data.toString());
    try {
      if (response.statusCode == 200 || response.statusCode == 201) {
        final listD = SearchRepo.fromJson(response.data);

        return Right(listD);
      } else {
        return const Left(MainFailure.serverFailures());
      }
    } catch (_) {
      return const Left(MainFailure.clientFailures());
    }
  }
}
