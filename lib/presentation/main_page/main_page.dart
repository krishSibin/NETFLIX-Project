import 'package:flutter/material.dart';
import 'package:netflixproject/presentation/downloads/downloads.dart';
import 'package:netflixproject/presentation/fast%20laughs/fast_laugh.dart';
import 'package:netflixproject/presentation/home/home.dart';
import 'package:netflixproject/presentation/main_page/widgets/bottomnav_widget.dart';
import 'package:netflixproject/presentation/new%20&%20hot/new_and_hot.dart';
import 'package:netflixproject/presentation/search/search.dart';

class ScreenMainPage extends StatelessWidget {
  ScreenMainPage({super.key});

  final _pages = [
    ScreenHome(),
    const ScreenNewandHot(),
    const ScreenFastLaugh(),
    ScreenSearch(),
    ScreenDownloads(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: ValueListenableBuilder(
        valueListenable: BottomNavigationWidget.bottomNavIndexNotfier,
        builder: (context, int newIndex, _) {
          return _pages[newIndex];
        },
      )),
      bottomNavigationBar: const BottomNavigationWidget(),
    );
  }
}
