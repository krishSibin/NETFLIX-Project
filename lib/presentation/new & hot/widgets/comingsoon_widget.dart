import 'package:flutter/material.dart';
import 'package:netflixproject/core/colors/material_color.dart';
import 'package:netflixproject/core/constants.dart';
import 'package:netflixproject/core/strings.dart';
import 'package:netflixproject/presentation/home/widgets/icon_text_column.dart';

class ComingSoonWidget extends StatelessWidget {
  final String month;
  final String date;
  final String movieName;
  final String overview;
  final String posterPath;
  const ComingSoonWidget({
    required this.posterPath,
    required this.overview,
    required this.movieName,
    required this.month,
    required this.date,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      //   shrinkWrap: true,
      children: [
        kheight10,
        Row(
          children: [
            SizedBox(
              height: 400,
              width: 60,
              child: Column(
                children: [
                  Text(
                    month,
                    style: const TextStyle(color: kgrey, fontSize: 15),
                  ),
                  Text(
                    date,
                    style: const TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 5),
                  )
                ],
              ),
            ),
            Expanded(
              child: SizedBox(
                height: 400,
                width: 300,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        // alignment: Alignment.bottomRight,
                        children: [
                          SizedBox(
                            width: double.infinity,
                            height: 200,
                            child: Image.network(
                              '$baseImgUrl$posterPath',
                              fit: BoxFit.cover,
                            ),
                          ),
                          const Positioned(
                            bottom: 10,
                            right: 10,
                            child: Icon(
                              Icons.volume_off,
                              color: kwhite,
                              size: 30,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            movieName,
                            maxLines: 1,
                            style: const TextStyle(
                              overflow: TextOverflow.clip,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Spacer(),
                          const Row(
                            children: [
                              IconTextColumn(
                                icon: Icons.notifications,
                                title: 'Remind me',
                                fontsize: 12,
                                iconsize: 25,
                              ),
                              kwidth10,
                              IconTextColumn(
                                icon: Icons.info,
                                title: 'Info',
                                fontsize: 12,
                                iconsize: 25,
                              ),
                              kwidth10,
                            ],
                          )
                        ],
                      ),
                      Text('Coming on $date $month'),
                      kheight10,
                      Text(
                        movieName,
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      kheight15,
                      Text(
                        overview,
                        maxLines: 4,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(color: kgrey),
                      )
                    ]),
              ),
            )
          ],
        )
      ],
    );
  }
}
