import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:movie_app_flutter/library.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(EntityMovieAdapter());
  Hive.registerAdapter(EntityTvShowAdapter());
  await Hive.openBox<EntityMovie>(movieDatabaseName);
  await Hive.openBox<EntityTvShow>(tvShowDatabaseName);

  runApp(const MyApp());

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: appRoutesMap,
      theme: ThemeData(
        appBarTheme: globalAppBarTheme,
        scaffoldBackgroundColor: Colors.white,
        brightness: Brightness.light,
      ),
      home: const ScreenHome(),
    );
  }
}

/// AppBarTheme used all through the app
AppBarTheme globalAppBarTheme = AppBarTheme(
  elevation: 0,
  foregroundColor: Colors.black,
  backgroundColor: Colors.white,
  centerTitle: true,
  systemOverlayStyle: SystemUiOverlayStyle(
    statusBarColor: Colors.grey.shade400,
  ),
);
