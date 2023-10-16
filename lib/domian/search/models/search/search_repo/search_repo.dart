import 'package:json_annotation/json_annotation.dart';

part 'search_repo.g.dart';

@JsonSerializable()
class SearchRepo {
  @JsonKey(name: 'results')
  List<ResultData> results;

  SearchRepo({this.results = const []});

  factory SearchRepo.fromJson(Map<String, dynamic> json) {
    return _$SearchRepoFromJson(json);
  }

  Map<String, dynamic> toJson() => _$SearchRepoToJson(this);
}

@JsonSerializable()
class ResultData {
  @JsonKey(name: 'original_title')
  String? originalTitle;

  @JsonKey(name: 'poster_path')
  String? posterPath;

  ResultData({
    this.originalTitle,
    this.posterPath,
  });

  factory ResultData.fromJson(Map<String, dynamic> json) {
    return _$ResultDataFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ResultDataToJson(this);
}
