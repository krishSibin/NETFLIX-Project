import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import 'package:netflixproject/domian/downloads/idownloads_repo.dart';
import 'package:netflixproject/domian/downloads/models/downloads.dart';

part 'fast_laughs_event.dart';
part 'fast_laughs_state.dart';
part 'fast_laughs_bloc.freezed.dart';

final videoUrl = [
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4",
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4",
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4",
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerEscapes.mp4",
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerFun.mp4"
];

ValueNotifier<Set<int>> indexListNotifier = ValueNotifier({});

@injectable
class FastLaughsBloc extends Bloc<FastLaughsEvent, FastLaughsState> {
  FastLaughsBloc(IdownloadsRepo idownloadsService)
      : super(FastLaughsState.initial()) {
    on<Initialize>((event, emit) async {
      emit(const FastLaughsState(
          isLoading: true, isError: false, downloadList: []));
      final serviceResponse = await idownloadsService.getDownloadsImages();

      final state = serviceResponse.fold((l) {
        return const FastLaughsState(
            isLoading: false, isError: true, downloadList: []);
      },
          (r) => FastLaughsState(
              isLoading: false, isError: false, downloadList: r));

      emit(state);
    });

    on<LikeVideo>((event, emit) {
      indexListNotifier.value.add(event.index);
    });

    on<DislikeVideo>((event, emit) {
      indexListNotifier.value.remove(event.index);
    });
  }
}
