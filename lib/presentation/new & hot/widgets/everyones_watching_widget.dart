import 'package:flutter/material.dart';
import 'package:netflixproject/core/colors/material_color.dart';
import 'package:netflixproject/core/constants.dart';
import 'package:netflixproject/core/strings.dart';
import 'package:netflixproject/presentation/home/widgets/icon_text_column.dart';
import 'package:netflixproject/presentation/new%20&%20hot/widgets/video_widget.dart';

class EveryOnesWatchingWidget extends StatelessWidget {
  final String tvPosterPath;
  final String movieName;
  final String overview;
  const EveryOnesWatchingWidget(
      {required this.tvPosterPath,
      required this.overview,
      required this.movieName,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          movieName,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        kheight10,
        Text(
          overview,
          style: const TextStyle(color: kgrey, fontSize: 16),
        ),
        kheight,
        VideoWidget(
          posterPath: '$baseImgUrl$tvPosterPath',
        ),
        kheight10,
        const Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            IconTextColumn(
              icon: Icons.share,
              title: 'Share',
              fontsize: 15,
              iconsize: 25,
              textcolor: kgrey,
            ),
            kwidth10,
            IconTextColumn(
              icon: Icons.add,
              title: 'My List',
              fontsize: 15,
              iconsize: 25,
              textcolor: kgrey,
            ),
            kwidth10,
            IconTextColumn(
              icon: Icons.play_arrow,
              title: 'Play',
              fontsize: 15,
              iconsize: 25,
              textcolor: kgrey,
            ),
            kwidth10
          ],
        )
      ],
    );
  }
}
