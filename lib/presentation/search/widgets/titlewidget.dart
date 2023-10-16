import 'package:flutter/material.dart';

import '../../../core/colors/material_Color.dart';

class TitleWidget extends StatelessWidget {
  const TitleWidget({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style:
          const TextStyle(fontSize: 23, color: kwhite, fontWeight: FontWeight.bold),
    );
  }
}
