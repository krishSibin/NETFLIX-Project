import 'package:dartz/dartz.dart';
import 'package:netflixproject/domian/core/failures/main_failure.dart';
import 'package:netflixproject/domian/downloads/models/downloads.dart';

abstract class IdownloadsRepo {
  Future<Either<MainFailure, List<Downloads>>> getDownloadsImages();
}
