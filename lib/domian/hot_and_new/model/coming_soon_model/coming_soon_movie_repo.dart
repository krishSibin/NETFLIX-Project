import 'package:json_annotation/json_annotation.dart';

part 'coming_soon_movie_repo.g.dart';

@JsonSerializable()
class ComingSoonMovieRepo {
  int? page;
  List<ComingSoonResult> results;

  ComingSoonMovieRepo({this.page, this.results = const []});

  factory ComingSoonMovieRepo.fromJson(Map<String, dynamic> json) {
    return _$ComingSoonMovieRepoFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ComingSoonMovieRepoToJson(this);
}

@JsonSerializable()
class ComingSoonResult {
  @JsonKey(name: 'id')
  int? id;

  @JsonKey(name: 'original_title')
  String? originalTitle;

  @JsonKey(name: 'overview')
  String? overview;

  @JsonKey(name: 'poster_path')
  String? posterPath;

  @JsonKey(name: 'release_date')
  String? releaseDate;

  ComingSoonResult({
    this.id,
    this.originalTitle,
    this.overview,
    this.posterPath,
    this.releaseDate,
  });

  factory ComingSoonResult.fromJson(Map<String, dynamic> json) {
    return _$ComingSoonResultFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ComingSoonResultToJson(this);
}
