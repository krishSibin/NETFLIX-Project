import 'package:dartz/dartz.dart';
import 'package:netflixproject/domian/core/failures/main_failure.dart';
import 'package:netflixproject/domian/hot_and_new/model/coming_soon_model/coming_soon_movie_repo.dart';
import 'package:netflixproject/domian/hot_and_new/model/everyones_watching_model/everyone_is_watching_repo.dart';

abstract class HotAndNewService {
  Future<Either<MainFailure, ComingSoonMovieRepo>> getComingSoonMovieData();
  Future<Either<MainFailure, EveryoneIsWatchingRepo>>
      getEveryOneIsWatchingData();
}
