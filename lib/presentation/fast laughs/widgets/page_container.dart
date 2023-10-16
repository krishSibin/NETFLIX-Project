import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflixproject/application/fastLaughs/fast_laughs_bloc.dart';
import 'package:netflixproject/core/colors/material_color.dart';
import 'package:netflixproject/core/constants.dart';
import 'package:netflixproject/core/strings.dart';
import 'package:netflixproject/domian/downloads/models/downloads.dart';
import 'package:video_player/video_player.dart';
import 'package:share_plus/share_plus.dart';

class ContainerPageInheritedWidget extends InheritedWidget {
  final Widget widget;
  final Downloads movieData;
  const ContainerPageInheritedWidget({
    super.key,
    required this.widget,
    required this.movieData,
  }) : super(child: widget);

  @override
  bool updateShouldNotify(covariant ContainerPageInheritedWidget oldWidget) {
    return oldWidget.movieData != movieData;
  }

  static ContainerPageInheritedWidget? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType();
  }
}

class ContainerPageWidget extends StatelessWidget {
  const ContainerPageWidget({super.key, required this.index});
  final int index;

  @override
  Widget build(BuildContext context) {
    final posterPath =
        ContainerPageInheritedWidget.of(context)!.movieData.posterPath;
    final movieVidUrl = videoUrl[index];
    return Stack(
      // alignment: Alignment.bottomLeft,
      children: [
        VideoPlayerWidget(vidUrl: movieVidUrl),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const CircleAvatar(
                  radius: 30,
                  child: Icon(Icons.volume_off),
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      CircleAvatar(
                        backgroundImage: NetworkImage('$baseImgUrl$posterPath'),
                      ),
                      kheight15,
                      ValueListenableBuilder(
                          valueListenable: indexListNotifier,
                          builder: (BuildContext context, value, _) {
                            if (value.contains(index)) {
                              return GestureDetector(
                                onTap: () {
                                  BlocProvider.of<FastLaughsBloc>(context)
                                      .add(DislikeVideo(index: index));
                                  //  indexListNotifier.notifyListeners();
                                },
                                child: const Reactions(
                                  icon: Icons.heart_broken_outlined,
                                  title: 'Liked',
                                ),
                              );
                            }
                            return GestureDetector(
                              onTap: () {
                                BlocProvider.of<FastLaughsBloc>(context)
                                    .add(LikeVideo(index: index));
                                //  indexListNotifier.notifyListeners();
                              },
                              child: const Reactions(
                                icon: Icons.emoji_emotions,
                                title: 'LOL',
                              ),
                            );
                          }),
                      kheight15,
                      const Reactions(
                        icon: Icons.add,
                        title: 'My List',
                      ),
                      kheight15,
                      GestureDetector(
                        onTap: () {
                          final shareVar =
                              ContainerPageInheritedWidget.of(context)!
                                  .movieData
                                  .posterPath;
                          if (shareVar == null) {
                            return;
                          }

                          Share.share(shareVar);
                        },
                        child: const Reactions(
                          icon: Icons.share,
                          title: 'Share',
                        ),
                      ),
                      kheight15,
                      const Reactions(
                        icon: Icons.play_arrow,
                        title: 'Play',
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class Reactions extends StatelessWidget {
  final IconData icon;
  final String title;
  const Reactions({super.key, required this.icon, required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
          color: kwhite,
          size: 30,
        ),
        Text(title),
      ],
    );
  }
}

class VideoPlayerWidget extends StatefulWidget {
  final String vidUrl;
  const VideoPlayerWidget({super.key, required this.vidUrl});

  @override
  State<VideoPlayerWidget> createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
  late VideoPlayerController videoPlayerController;
  @override
  void initState() {
    videoPlayerController = VideoPlayerController.network(widget.vidUrl);
    videoPlayerController.initialize().then((value) {
      setState(() {
        videoPlayerController.play();
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: videoPlayerController.value.isInitialized
          ? AspectRatio(
              aspectRatio: videoPlayerController.value.aspectRatio,
              child: VideoPlayer(videoPlayerController),
            )
          : const SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: Center(
                child: Text('No Video For Movie'),
              ),
            ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    videoPlayerController.dispose();
  }
}
