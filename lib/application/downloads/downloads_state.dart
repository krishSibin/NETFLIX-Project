part of 'downloads_bloc.dart';

@freezed
class DownloadsState with _$DownloadsState {
  const factory DownloadsState({
    required bool isLoading,
    required List<Downloads> downloadList,
    required Option<Either<MainFailure, List<Downloads>>>
        downloadsSucessOrFailureOption,
  }) = _DownloadsState;

  factory DownloadsState.initial() => const DownloadsState(
        isLoading: false,
        downloadsSucessOrFailureOption: None(),
        downloadList: [],
      );
}
