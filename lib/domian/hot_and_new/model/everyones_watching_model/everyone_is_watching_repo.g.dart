// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'everyone_is_watching_repo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EveryoneIsWatchingRepo _$EveryoneIsWatchingRepoFromJson(
        Map<String, dynamic> json) =>
    EveryoneIsWatchingRepo(
      page: json['page'] as int?,
      results: (json['results'] as List<dynamic>?)
              ?.map((e) =>
                  EveryonesWatchingResult.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$EveryoneIsWatchingRepoToJson(
        EveryoneIsWatchingRepo instance) =>
    <String, dynamic>{
      'page': instance.page,
      'results': instance.results,
    };

EveryonesWatchingResult _$EveryonesWatchingResultFromJson(
        Map<String, dynamic> json) =>
    EveryonesWatchingResult(
      id: json['id'] as int?,
      originalName: json['original_name'] as String?,
      overview: json['overview'] as String?,
      posterPath: json['poster_path'] as String?,
    );

Map<String, dynamic> _$EveryonesWatchingResultToJson(
        EveryonesWatchingResult instance) =>
    <String, dynamic>{
      'id': instance.id,
      'original_name': instance.originalName,
      'overview': instance.overview,
      'poster_path': instance.posterPath,
    };
