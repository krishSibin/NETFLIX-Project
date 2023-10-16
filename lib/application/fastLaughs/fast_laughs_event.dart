part of 'fast_laughs_bloc.dart';

@freezed
class FastLaughsEvent with _$FastLaughsEvent {
  const factory FastLaughsEvent.initialize() = Initialize;
  const factory FastLaughsEvent.likeVideo({
    required int index,
  }) = LikeVideo;
  const factory FastLaughsEvent.dislikeVideo({
    required int index,
  }) = DislikeVideo;
}
