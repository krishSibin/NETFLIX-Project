import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflixproject/application/search/search_bloc.dart';
import 'package:netflixproject/core/colors/material_color.dart';
import 'package:netflixproject/core/constants.dart';
import 'package:netflixproject/core/strings.dart';
import 'package:netflixproject/presentation/search/widgets/titlewidget.dart';

class SearchIdleWidget extends StatelessWidget {
  const SearchIdleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size.width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const TitleWidget(
          title: 'Top Searches',
        ),
        Expanded(
          child: BlocBuilder<SearchBloc, SearchState>(
            builder: (context, state) {
              if (state.isLoading == true) {
                return const Center(child: CircularProgressIndicator());
              } else if (state.idleList.isEmpty) {
                return const Center(child: Text('List is Empty'));
              } else {
                return ListView.separated(
                  shrinkWrap: true,
                  itemBuilder: ((context, index) {
                    final image = state.idleList[index].posterPath;
                    final imgTitle = state.idleList[index].title;
                    return MainCard(
                      size: size,
                      img: '$baseImgUrl$image',
                      title: imgTitle ?? 'No Movie',
                    );
                  }),
                  separatorBuilder: ((context, index) {
                    return kheight10;
                  }),
                  itemCount: 10,
                );
              }
            },
          ),
        ),
      ],
    );
  }
}

class MainCard extends StatelessWidget {
  const MainCard({
    super.key,
    required this.size,
    required this.img,
    required this.title,
  });
  final String img;
  final String title;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: size * .35,
          height: 65,
          decoration: BoxDecoration(
              color: kwhite,
              image:
                  DecorationImage(fit: BoxFit.cover, image: NetworkImage(img))),
        ),
        const SizedBox(
          width: 8,
        ),
        Expanded(
          child: Text(
            title,
            style: const TextStyle(fontSize: 15, color: kwhite),
          ),
        ),
        const CircleAvatar(
          backgroundColor: kwhite,
          radius: 30,
          child: CircleAvatar(
            backgroundColor: backgroundColor,
            radius: 28,
            child: Icon(
              CupertinoIcons.play_fill,
              color: kwhite,
            ),
          ),
        )
      ],
    );
  }
}
