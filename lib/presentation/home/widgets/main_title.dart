import 'package:flutter/material.dart';

import '../../../core/colors/material_Color.dart';

class MainTitle extends StatelessWidget {
  final String title;
  const MainTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style:
          const TextStyle(fontSize: 23, color: kwhite, fontWeight: FontWeight.bold),
    );
  }
}
