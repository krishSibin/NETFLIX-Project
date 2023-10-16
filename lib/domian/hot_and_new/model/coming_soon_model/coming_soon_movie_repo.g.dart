// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coming_soon_movie_repo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ComingSoonMovieRepo _$ComingSoonMovieRepoFromJson(Map<String, dynamic> json) =>
    ComingSoonMovieRepo(
      page: json['page'] as int?,
      results: (json['results'] as List<dynamic>?)
              ?.map((e) => ComingSoonResult.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$ComingSoonMovieRepoToJson(
        ComingSoonMovieRepo instance) =>
    <String, dynamic>{
      'page': instance.page,
      'results': instance.results,
    };

ComingSoonResult _$ComingSoonResultFromJson(Map<String, dynamic> json) =>
    ComingSoonResult(
      id: json['id'] as int?,
      originalTitle: json['original_title'] as String?,
      overview: json['overview'] as String?,
      posterPath: json['poster_path'] as String?,
      releaseDate: json['release_date'] as String?,
    );

Map<String, dynamic> _$ComingSoonResultToJson(ComingSoonResult instance) =>
    <String, dynamic>{
      'id': instance.id,
      'original_title': instance.originalTitle,
      'overview': instance.overview,
      'poster_path': instance.posterPath,
      'release_date': instance.releaseDate,
    };
