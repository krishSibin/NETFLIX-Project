import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflixproject/application/search/search_bloc.dart';
import 'package:netflixproject/core/strings.dart';
import 'package:netflixproject/presentation/search/widgets/titlewidget.dart';

class SearchResultWidget extends StatelessWidget {
  const SearchResultWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final screensize = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const TitleWidget(title: 'Movies & TV'),
          Expanded(
            child: BlocBuilder<SearchBloc, SearchState>(
              builder: (context, state) {
                final list = state.searchResultList;
                if (state.isLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state.searchResultList.isEmpty) {
                  return const Center(child: Text('List is empty'));
                } else if (state.iserror) {
                  return const Center(child: Text('error occured'));
                } else {
                  return GridView.count(
                    childAspectRatio: 1.2 / 2,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 8,
                    shrinkWrap: true,
                    crossAxisCount: 3,
                    children: List.generate(list.length, (index) {
                      final imgEndUrl = list[index].posterPath;

                      return Container(
                        width: screensize * .3,
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage('$baseImgUrl$imgEndUrl'),
                          ),
                        ),
                      );
                    }),
                  );
                }
              },
            ),
          )
        ],
      ),
    );
  }
}
