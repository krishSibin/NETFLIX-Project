import 'package:flutter/material.dart';
import 'package:netflixproject/core/colors/material_color.dart';
import 'package:stroke_text/stroke_text.dart';

import '../../../core/constants.dart';

class NumberCardWidget extends StatelessWidget {
  final String url;
  final int index;
  const NumberCardWidget({super.key, required this.url, required this.index});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.only(left: 40),
          width: 150,
          height: 230,
          decoration: BoxDecoration(
            borderRadius: borderrad10,
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(url),
            ),
          ),
        ),
        Positioned(
          top: 78,
          left: 20,
          // right: 140,

          child: StrokeText(
            text: '${index + 1}',
            textStyle: const TextStyle(
              fontSize: 120,
              color: backgroundColor,
              fontWeight: FontWeight.bold,
            ),
            strokeColor: kwhite,
            strokeWidth: 5,
          ),
        ),
      ],
    );
  }
}
