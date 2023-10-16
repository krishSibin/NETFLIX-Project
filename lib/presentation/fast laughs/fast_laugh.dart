import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflixproject/application/fastLaughs/fast_laughs_bloc.dart';
import 'package:netflixproject/presentation/fast%20laughs/widgets/page_container.dart';

class ScreenFastLaugh extends StatelessWidget {
  const ScreenFastLaugh({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<FastLaughsBloc>(context)
          .add(const FastLaughsEvent.initialize());
    });
    return Scaffold(
      body: SafeArea(child: BlocBuilder<FastLaughsBloc, FastLaughsState>(
        builder: (context, state) {
          if (state.isLoading) {
            return const Center(
              child: CircularProgressIndicator(
                strokeWidth: 2,
              ),
            );
          } else if (state.isError) {
            return const Center(
              child: Text('Error occured while fetching'),
            );
          } else if (state.downloadList.isEmpty) {
            return const Center(
              child: Text('No Movie'),
            );
          } else {
            return PageView(
              scrollDirection: Axis.vertical,
              children: List.generate(
                  state.downloadList.length,
                  (index) => ContainerPageInheritedWidget(
                      widget: ContainerPageWidget(index: index),
                      movieData: state.downloadList[index])),
            );
          }
        },
      )),
    );
  }
}
