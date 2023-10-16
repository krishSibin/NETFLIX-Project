import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflixproject/application/search/search_bloc.dart';

import 'package:netflixproject/core/colors/material_color.dart';
import 'package:netflixproject/core/constants.dart';
import 'package:netflixproject/presentation/search/widgets/idlewidget.dart';
import 'package:netflixproject/presentation/search/widgets/resultwidget.dart';

import '../../domian/core/debouncer/debouncer.dart';

class ScreenSearch extends StatelessWidget {
  ScreenSearch({super.key});

  final _debouncer = Debouncer(milliseconds: 1 * 1000);

  final searchFormController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<SearchBloc>(context).add(const Initialize());
    });
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CupertinoSearchTextField(
                controller: searchFormController,
                style: const TextStyle(color: kwhite),
                backgroundColor: Colors.grey.withOpacity(.2),
                prefixIcon: const Icon(
                  CupertinoIcons.search,
                  color: kwhite,
                ),
                suffixIcon: const Icon(
                  CupertinoIcons.xmark_circle_fill,
                  color: kwhite,
                ),
                onChanged: (value) {
                  _debouncer.run(() {
                    BlocProvider.of<SearchBloc>(context)
                        .add(SearchMovie(movieQuery: value));
                  });
                },
              ),
              kheight,
              BlocBuilder<SearchBloc, SearchState>(
                builder: (context, state) {
                  if (state.searchResultList.isEmpty) {
                    return const Expanded(child: SearchIdleWidget());
                  } else {
                    return const Expanded(child: SearchResultWidget());
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
