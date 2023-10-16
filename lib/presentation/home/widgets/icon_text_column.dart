import 'package:flutter/material.dart';
import 'package:netflixproject/core/colors/material_color.dart';

class IconTextColumn extends StatelessWidget {
  const IconTextColumn(
      {super.key,
      required this.icon,
      required this.title,
      this.fontsize = 18,
      this.iconsize = 35,
      this.textcolor = kwhite});
  final IconData icon;
  final String title;
  final double fontsize;
  final double iconsize;
  final Color textcolor;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
          color: kwhite,
          size: iconsize,
        ),
        Text(
          title,
          style: TextStyle(
              color: textcolor,
              fontSize: fontsize,
              fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}
