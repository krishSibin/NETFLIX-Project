import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:netflixproject/application/downloads/downloads_bloc.dart';
import 'package:netflixproject/application/fastLaughs/fast_laughs_bloc.dart';
import 'package:netflixproject/application/home/home_bloc.dart';
import 'package:netflixproject/application/hot_and_new/hot_and_new_bloc.dart';
import 'package:netflixproject/application/search/search_bloc.dart';
import 'package:netflixproject/domian/core/di/dependency_injection.dart';

import 'package:netflixproject/presentation/main_page/main_page.dart';

import 'core/colors/material_Color.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureInjection();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (ctx) => get<DownloadsBloc>()),
        BlocProvider(create: (ctx) => get<SearchBloc>()),
        BlocProvider(create: (ctx) => get<FastLaughsBloc>()),
        BlocProvider(create: (ctx) => get<HotAndNewBloc>()),
        BlocProvider(create: (ctx) => get<HomeBloc>()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
            appBarTheme: const AppBarTheme(backgroundColor: Colors.transparent),
            fontFamily: GoogleFonts.montserrat().fontFamily,
            primarySwatch: Colors.blue,
            scaffoldBackgroundColor: backgroundColor,
            textTheme: const TextTheme(
                bodyLarge: TextStyle(
                  color: kwhite,
                ),
                bodyMedium: TextStyle(color: kwhite))),
        home: ScreenMainPage(),
      ),
    );
  }
}
