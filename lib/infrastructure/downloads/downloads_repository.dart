import 'dart:developer';

import 'package:injectable/injectable.dart';
import 'package:netflixproject/domian/core/api_end_points.dart';
import 'package:netflixproject/domian/core/failures/main_failure.dart';
import 'package:dartz/dartz.dart';
import 'package:netflixproject/domian/downloads/idownloads_repo.dart';
import 'package:netflixproject/domian/downloads/models/downloads.dart';
import 'package:dio/dio.dart';

@LazySingleton(as: IdownloadsRepo)
class DownloadsRepository implements IdownloadsRepo {
  @override
  Future<Either<MainFailure, List<Downloads>>> getDownloadsImages() async {
    // final dio = Dio(BaseOptions());
    final response = await Dio(BaseOptions()).get(ApiEndPoints.apiEndPoints);

    try {
      if (response.statusCode == 200 || response.statusCode == 201) {
        final listD = (response.data['results'] as List).map((e) {
          return Downloads.fromJson(e);
        }).toList();

        log(listD.toString());

        return Right(listD);
      } else {
        return const Left(MainFailure.serverFailures());
      }
    } catch (_) {
      return const Left(MainFailure.clientFailures());
    }
  }
}
