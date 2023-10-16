import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:netflixproject/domian/core/api_end_points.dart';
import 'package:netflixproject/domian/core/failures/main_failure.dart';
import 'package:dartz/dartz.dart';
import 'package:netflixproject/domian/hot_and_new/hot_and_new_service.dart';
import 'package:netflixproject/domian/hot_and_new/model/everyones_watching_model/everyone_is_watching_repo.dart';
import 'package:netflixproject/domian/hot_and_new/model/coming_soon_model/coming_soon_movie_repo.dart';

@LazySingleton(as: HotAndNewService)
class HotAndNewImpl extends HotAndNewService {
  @override
  Future<Either<MainFailure, ComingSoonMovieRepo>>
      getComingSoonMovieData() async {
    final response =
        await Dio(BaseOptions()).get(ApiEndPoints.hotAndNewComingSoon);
    log(response.data.toString());

    try {
      if (response.statusCode == 200 || response.statusCode == 201) {
        final resultList = ComingSoonMovieRepo.fromJson(response.data);
        return Right(resultList);
      } else {
        return const Left(MainFailure.serverFailures());
      }
    } catch (_) {
      return const Left(MainFailure.clientFailures());
    }
  }

  @override
  Future<Either<MainFailure, EveryoneIsWatchingRepo>>
      getEveryOneIsWatchingData() async {
    final response =
        await Dio(BaseOptions()).get(ApiEndPoints.hotAndNewEveryonesWatching);
    log(response.data.toString());

    try {
      if (response.statusCode == 200 || response.statusCode == 201) {
        final resultList = EveryoneIsWatchingRepo.fromJson(response.data);
        return Right(resultList);
      } else {
        return const Left(MainFailure.serverFailures());
      }
    } catch (_) {
      return const Left(MainFailure.clientFailures());
    }
  }
}
