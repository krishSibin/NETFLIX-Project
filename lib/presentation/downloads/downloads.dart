import 'dart:developer';
//import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflixproject/core/colors/material_color.dart';
import 'package:netflixproject/core/constants.dart';
import 'package:netflixproject/core/strings.dart';

import '../../application/downloads/downloads_bloc.dart';
import '../widgets/app_bar_widget.dart';

class ScreenDownloads extends StatelessWidget {
  ScreenDownloads({super.key});

  final _widgets = [
    const _SmartDownloads(),
    const Section2(),
    const Section3(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
          preferredSize: Size(50, 50),
          child: AppBarWidget(
            title: 'Downloads',
          )),
      body: SafeArea(
          child: ListView.separated(
        padding: const EdgeInsets.all(12),
        itemBuilder: (ctx, index) => _widgets[index],
        separatorBuilder: (ctx, index) => kheight,
        itemCount: _widgets.length,
      )),
    );
  }
}

// section 2 for body
class Section2 extends StatelessWidget {
  const Section2({super.key});
  // final List images = [
  //   'https://www.themoviedb.org/t/p/w600_and_h900_bestv2/3gztZ4150O5dunTCUtkr8hLz88q.jpg',
  //   'https://www.themoviedb.org/t/p/w600_and_h900_bestv2/r2J02Z2OpNTctfOSN1Ydgii51I3.jpg',
  //   'https://www.themoviedb.org/t/p/w600_and_h900_bestv2/liLN69YgoovHVgmlHJ876PKi5Yi.jpg',
  // ];

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      BlocProvider.of<DownloadsBloc>(context)
          .add(const DownloadsEvent.getDownloadsImage());
    });

    final Size size = MediaQuery.of(context).size;

    return Column(
      children: [
        const Text(
          'Introducing Downloads for you',
          style: TextStyle(
              color: kwhite, fontSize: 24, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        const Text(
          "We will download a personalised selection of\n movies and shows for you,so there's\n always something to watch on your \ndevice",
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.grey, fontSize: 16),
        ),
        BlocBuilder<DownloadsBloc, DownloadsState>(
          builder: (context, state) {
            log(state.downloadList.toString());

            return SizedBox(
              width: size.width,
              height: size.width,
              child: state.isLoading
                  ? const Center(
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        semanticsLabel: 'Please Wait',
                      ),
                    )
                  : Stack(
                      alignment: AlignmentDirectional.center,
                      children: [
                        CircleAvatar(
                          radius: size.width * .38,
                          backgroundColor: Colors.grey.withOpacity(.5),
                        ),
                        state.downloadList.isEmpty
                            ? const Center(child: CircularProgressIndicator())
                            : ContainerImage(
                                images:
                                    '$baseImgUrl${state.downloadList[0].posterPath}',
                                margin: const EdgeInsets.only(left: 160, bottom: 45),
                                angle: 23,
                                size: Size(size.width * .4, size.width * .5),
                              ),
                        state.downloadList.isEmpty
                            ? const Center(child: CircularProgressIndicator())
                            : ContainerImage(
                                images:
                                    '$baseImgUrl${state.downloadList[1].posterPath}',
                                margin: const EdgeInsets.only(right: 160, bottom: 45),
                                angle: -23,
                                size: Size(size.width * .4, size.width * .5),
                              ),
                        state.downloadList.isEmpty
                            ? const Center(child: CircularProgressIndicator())
                            : ContainerImage(
                                images:
                                    '$baseImgUrl${state.downloadList[2].posterPath}',
                                margin: const EdgeInsets.only(
                                    left: 0, bottom: 0, top: 15),
                                size: Size(size.width * .45, size.width * .61),
                              ),
                      ],
                    ),
            );
          },
        ),
      ],
    );
  }
}

//section3 for body

class Section3 extends StatelessWidget {
  const Section3({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: MaterialButton(
            color: kbluebutton,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            onPressed: () {},
            child: const Text(
              'Set up',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
          ),
        ),
        MaterialButton(
          color: kwhite,
          onPressed: () {},
          child: const Text(
            'See what you can download',
            style: TextStyle(
                color: kbuttonblack, fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}

class _SmartDownloads extends StatelessWidget {
  const _SmartDownloads();

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Icon(
          Icons.settings,
          color: kwhite,
        ),
        kwidth,
        Text(
          'Smart Downloads',
          style: TextStyle(color: kwhite),
        )
      ],
    );
  }
}

class ContainerImage extends StatelessWidget {
  const ContainerImage(
      {super.key,
      required this.images,
      required this.margin,
      this.angle = 0,
      required this.size});

  final String images;
  // ignore: prefer_typing_uninitialized_variables
  final margin;
  final double angle;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: angle * 2.47 / 180,
      child: Container(
        margin: margin,
        // width: size.width * .4,
        //height: size.width * .58,
        width: size.width,
        height: size.height,
        decoration: BoxDecoration(
            image:
                DecorationImage(fit: BoxFit.cover, image: NetworkImage(images)),
            borderRadius: BorderRadius.circular(10)),
      ),
    );
  }
}
