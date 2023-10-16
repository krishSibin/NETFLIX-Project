import 'package:flutter/material.dart';
//import 'package:netflixproject/core/strings.dart';
//import 'package:netflixproject/presentation/home/widgets/list_main_card.dart';
import 'package:netflixproject/presentation/home/widgets/main_title.dart';
import 'package:netflixproject/presentation/home/widgets/number_tile_widget.dart';

class MainNumberTileWidget extends StatelessWidget {
  final List<String> posterPath;
  const MainNumberTileWidget({
    required this.posterPath,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const MainTitle(title: 'Top 10 Tv Shows In India Today'),
        LimitedBox(
          maxHeight: 200,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: List.generate(
                posterPath.length,
                (index) =>
                    NumberCardWidget(url: posterPath[index], index: index)),
          ),
        ),
      ],
    );
  }
}
