import 'package:json_annotation/json_annotation.dart';

part 'everyone_is_watching_repo.g.dart';

@JsonSerializable()
class EveryoneIsWatchingRepo {
  int? page;
  List<EveryonesWatchingResult> results;

  EveryoneIsWatchingRepo({this.page, this.results = const []});

  factory EveryoneIsWatchingRepo.fromJson(Map<String, dynamic> json) {
    return _$EveryoneIsWatchingRepoFromJson(json);
  }

  Map<String, dynamic> toJson() => _$EveryoneIsWatchingRepoToJson(this);
}

@JsonSerializable()
class EveryonesWatchingResult {
  @JsonKey(name: 'id')
  int? id;

  @JsonKey(name: 'original_name')
  String? originalName;

  @JsonKey(name: 'overview')
  String? overview;

  @JsonKey(name: 'poster_path')
  String? posterPath;

  EveryonesWatchingResult({
    this.id,
    this.originalName,
    this.overview,
    this.posterPath,
  });

  factory EveryonesWatchingResult.fromJson(Map<String, dynamic> json) {
    return _$EveryonesWatchingResultFromJson(json);
  }

  Map<String, dynamic> toJson() => _$EveryonesWatchingResultToJson(this);
}
