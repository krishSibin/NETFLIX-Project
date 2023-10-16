
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:netflixproject/domian/downloads/idownloads_repo.dart';
import 'package:netflixproject/domian/downloads/models/downloads.dart';

import '../../domian/core/failures/main_failure.dart';

part 'downloads_event.dart';
part 'downloads_state.dart';
part 'downloads_bloc.freezed.dart';

@injectable
class DownloadsBloc extends Bloc<DownloadsEvent, DownloadsState> {
  final IdownloadsRepo downloadImages;
  DownloadsBloc(this.downloadImages) : super(DownloadsState.initial()) {
    on<_GetDownloadsImage>((event, emit) async {
      emit(
        state.copyWith(
          isLoading: true,
          downloadsSucessOrFailureOption: none(),
        ),
      );
      final Either<MainFailure, List<Downloads>> responseResult =
          await downloadImages.getDownloadsImages();

      emit(responseResult.fold(
        (failure) => state.copyWith(
          isLoading: false,
          downloadsSucessOrFailureOption: some(Left(failure)),
        ),
        (success) => state.copyWith(
          isLoading: false,
          downloadList: success,
          downloadsSucessOrFailureOption: some(
            Right(success),
          ),
        ),
      ));
    });
  }
}
