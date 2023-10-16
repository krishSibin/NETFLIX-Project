import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflixproject/application/hot_and_new/hot_and_new_bloc.dart';
import 'package:netflixproject/core/colors/material_color.dart';
import 'package:netflixproject/presentation/new%20&%20hot/widgets/comingsoon_widget.dart';
import 'package:netflixproject/presentation/new%20&%20hot/widgets/everyones_watching_widget.dart';


class ScreenNewandHot extends StatelessWidget {
  const ScreenNewandHot({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        BlocProvider.of<HotAndNewBloc>(context)
            .add(const HotAndNewEvent.comingSoonInitialize());
        BlocProvider.of<HotAndNewBloc>(context)
            .add(const HotAndNewEvent.everyonesWatchingInitialize());
      },
    );
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: AppBar(
            title: const Text(
              'New & Hot',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            actions: [
              Row(
                children: [
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
              )
            ],
            bottom: TabBar(
                isScrollable: true,
                indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(30), color: kwhite),
                labelColor: kblack,
                labelStyle:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                unselectedLabelColor: kwhite,
                tabs: const [
                  Tab(
                    text: '🍿 Coming Soon',
                  ),
                  Tab(
                    text: "👀 Everyone's Watching",
                  ),
                ]),
          ),
          body: TabBarView(children: [
            BlocBuilder<HotAndNewBloc, HotAndNewState>(
              builder: (context, state) {
                final list = state.comingSoonList;
                if (state.isLoading) {
                  return const Center(
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                    ),
                  );
                } else if (state.isError) {
                  return const Center(
                    child: Text('error while fetching'),
                  );
                } else if (state.comingSoonList.isEmpty) {
                  return const Center(
                    child: Text('List is Empty'),
                  );
                } else {
                  //     final monthDate = DateFormat.MMMd().format();

                  //     final value = monthDate.split(' ');
                  //     final dmy = DateFormat.MMMd().format(DateTime.now());
                  return ListView.builder(
                    shrinkWrap: true,
                    itemBuilder: (context, index) => ComingSoonWidget(
                        posterPath: list[index].posterPath ?? ' ',
                        overview: list[index].overview ?? 'no overview',
                        movieName: list[index].originalTitle ?? 'No title',
                        month: 'MAR',
                        date: '12'),
                    itemCount: state.comingSoonList.length,
                  );
                }
              },
            ),
            const EveryoneIsWatchingWidgetFirst(),
            //  EveryOnesWatchingWidget(),
          ])),
    );
  }
}

class EveryoneIsWatchingWidgetFirst extends StatelessWidget {
  const EveryoneIsWatchingWidgetFirst({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HotAndNewBloc, HotAndNewState>(
      builder: (context, state) {
        final list = state.everyonesWatchingList;
        if (state.isLoading) {
          return const Center(
            child: CircularProgressIndicator(
              strokeWidth: 2,
            ),
          );
        } else if (state.isError) {
          return const Center(
            child: Text('Error while fetching tv'),
          );
        } else if (state.everyonesWatchingList.isEmpty) {
          return const Center(
            child: Text('No data'),
          );
        } else {
          return ListView.builder(
            shrinkWrap: true,
            itemBuilder: (context, index) => EveryOnesWatchingWidget(
                tvPosterPath: list[index].posterPath ?? ' ',
                overview: list[index].overview ?? 'no overview',
                movieName: list[index].originalName ?? 'No Movie Name'),
            itemCount: state.everyonesWatchingList.length,
          );
        }
      },
    );
  }
}
