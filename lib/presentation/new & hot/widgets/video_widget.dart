import 'package:flutter/material.dart';
import 'package:netflixproject/core/colors/material_color.dart';

class VideoWidget extends StatelessWidget {
  final String posterPath;
  const VideoWidget({required this.posterPath, super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      // alignment: Alignment.bottomRight,
      children: [
        SizedBox(
          width: double.infinity,
          height: 200,
          child: Image.network(
            posterPath,
            fit: BoxFit.cover,
          ),
        ),
        const Positioned(
          bottom: 10,
          right: 10,
          child: Icon(
            Icons.volume_off,
            color: kwhite,
            size: 30,
          ),
        ),
      ],
    );
  }
}
