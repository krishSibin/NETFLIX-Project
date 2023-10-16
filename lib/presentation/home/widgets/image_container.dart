import 'package:flutter/material.dart';

import '../../../core/constants.dart';

class ImageContainer extends StatelessWidget {
  final String url;
  const ImageContainer({
    required this.url,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8),
      child: Container(
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
    );
  }
}
