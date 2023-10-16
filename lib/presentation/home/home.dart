import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflixproject/application/home/home_bloc.dart';
import 'package:netflixproject/core/constants.dart';
import 'package:netflixproject/core/strings.dart';
import 'package:netflixproject/presentation/home/widgets/icon_text_column.dart';

import 'package:netflixproject/presentation/home/widgets/list_main_card.dart';

import 'package:netflixproject/presentation/home/widgets/mainnumber_tile_widget.dart';
//import 'package:netflixproject/presentation/home/widgets/number_tile_widget.dart';

import '../../core/colors/material_Color.dart';

ValueNotifier<bool> scrollNotifier = ValueNotifier(true);

// ignore: must_be_immutable
class ScreenHome extends StatelessWidget {
  ScreenHome({super.key});
  bool checker = true;

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        BlocProvider.of<HomeBloc>(context).add(const GetMovieData());
      },
    );

    return Scaffold(
      body: ValueListenableBuilder(
        valueListenable: scrollNotifier,
        builder: (BuildContext context, bool value, _) {
          //new feature notification Listener
          return NotificationListener<UserScrollNotification>(
            onNotification: (notification) {
              final ScrollDirection direction = notification.direction;
              if (direction == ScrollDirection.forward) {
                scrollNotifier.value = true;
              } else if (direction == ScrollDirection.reverse) {
                scrollNotifier.value = false;
              }

              // print(notification);
              return true;
            },
            child: Stack(children: [
              BlocBuilder<HomeBloc, HomeState>(
                builder: (context, state) {
                  log('inside builder');

                  if (state.isLoading) {
                    return const Center(
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                      ),
                    );
                  } else if (state.isError) {
                    return const Text('error occured while fetching');
                  } else {
                    List<String> pastYearList =
                        state.releasedInPastYrList.map((m) {
                      return '$baseImgUrl${m.posterPath}';
                    }).toList();

                    List<String> trending = state.trendingNow.map((m) {
                      return '$baseImgUrl${m.posterPath}';
                    }).toList();

                    List<String> drama = state.tenseDrama.map((m) {
                      return '$baseImgUrl${m.posterPath}';
                    }).toList();

                    List<String> southIndian = state.southIndianCinema.map((m) {
                      return '$baseImgUrl${m.posterPath}';
                    }).toList();

                    List<String> top10 = state.tvTop10List.map((m) {
                      return '$baseImgUrl${m.posterPath}';
                    }).toList();

                    if (checker == true &&
                        state.releasedInPastYrList.isNotEmpty) {
                      log('inside checker');
                      pastYearList.shuffle();
                      trending.shuffle();
                      drama.shuffle();
                      southIndian.shuffle();
                      checker = false;
                    }

                    return ListView(
                      children: [
                        Stack(
                          children: [
                            Container(
                              width: double.infinity,
                              height: 650,
                              decoration: const BoxDecoration(
                                  image: DecorationImage(
                                      image: NetworkImage(
                                          'https://www.themoviedb.org/t/p/w600_and_h900_bestv2/2tQmx1ja9lY518OUOQy8xiOa5x9.jpg'))),
                            ),
                            Positioned(
                              bottom: 0,
                              left: 0,
                              right: 0,
                              child: Padding(
                                padding: const EdgeInsets.only(bottom: 15),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    const IconTextColumn(
                                        icon: Icons.add, title: 'My List'),
                                    TextButton.icon(
                                      style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all(kwhite),
                                      ),
                                      onPressed: () {},
                                      icon: const Icon(
                                        Icons.play_arrow,
                                        color: backgroundColor,
                                      ),
                                      label: const Text(
                                        'Play',
                                        style:
                                            TextStyle(color: backgroundColor),
                                      ),
                                    ),
                                    const IconTextColumn(
                                        icon: Icons.info, title: 'Info'),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                        ListMainCardWidget(
                          title: 'Released in the past year',
                          posterPathList: pastYearList.sublist(0, 10),
                        ),
                        kheight10,
                        ListMainCardWidget(
                          title: 'Trending now',
                          posterPathList: trending.sublist(10, 20),
                        ),
                        MainNumberTileWidget(
                          posterPath: top10,
                        ),
                        ListMainCardWidget(
                          title: 'Tense Drama',
                          posterPathList: drama.sublist(5, 15),
                        ),
                        ListMainCardWidget(
                          title: 'South Indian Cinema',
                          posterPathList: southIndian.sublist(8, 18),
                        ),
                      ],
                    );
                  }
                },
              ),
              scrollNotifier.value == true
                  //new feature animated container
                  ? AnimatedContainer(
                      duration: const Duration(seconds: 10),
                      child: Container(
                        width: double.infinity,
                        height: 75,
                        color: Colors.black.withOpacity(.3),
                        child: Column(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 5),
                              child: Row(
                                children: [
                                  Image.network(
                                    "https://cdn-images-1.medium.com/v2/resize:fit:1200/1*ty4NvNrGg4ReETxqU2N3Og.png",
                                    width: 60,
                                    height: 50,
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
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  "TV Shows",
                                  style: ktextstyle,
                                ),
                                Text(
                                  "Movies",
                                  style: ktextstyle,
                                ),
                                Text(
                                  "categories",
                                  style: ktextstyle,
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    )
                  : kheight
            ]),
          );
        },
      ),
    );
  }
}
