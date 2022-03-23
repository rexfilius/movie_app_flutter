import 'package:movie_app_flutter/movie_app_lib.dart';
import 'package:flutter/material.dart';

class MoviesScreen extends StatefulWidget {
  const MoviesScreen({Key? key}) : super(key: key);

  @override
  State<MoviesScreen> createState() => _MoviesScreenState();
}

class _MoviesScreenState extends State<MoviesScreen> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: const [
          Text('Coming Soon'),
          SizedBox(height: 8.0),
          SizedBox(
            height: 185,
            child: UpcomingMoviesBuilder(),
          ),
          Text('Coming Soon'),
          SizedBox(height: 8.0),
          SizedBox(
            height: 220,
            child: PopularMovieBuilder(),
          ),
        ],
      ),
    );
  }
}
