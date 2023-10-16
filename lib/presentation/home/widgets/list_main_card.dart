import 'package:flutter/material.dart';
//import 'package:netflixproject/core/strings.dart';
import 'package:netflixproject/presentation/home/widgets/image_container.dart';
import 'package:netflixproject/presentation/home/widgets/main_title.dart';

class ListMainCardWidget extends StatelessWidget {
  final String title;
  final List<String> posterPathList;

  ListMainCardWidget({
    super.key,
    required this.title,
    required this.posterPathList,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MainTitle(title: title),
        LimitedBox(
          maxHeight: 200,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: List.generate(
              posterPathList.length,
              (index) => ImageContainer(
                url: posterPathList[index],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
