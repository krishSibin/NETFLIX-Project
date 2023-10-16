import 'package:flutter/material.dart';

import 'package:netflixproject/core/colors/material_Color.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
        const Spacer(),
        const Icon(
          Icons.cast_sharp,
          color: kwhite,
        ),
        const SizedBox(
          width: 10,
        ),
        Container(
          color: Colors.blue,
          width: 25,
          height: 25,
        )
      ],
    );
  }
}
