import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:movie_app_flutter/movie_app_lib.dart';

class MovieFavoritesScreen extends StatefulWidget {
  const MovieFavoritesScreen({Key? key}) : super(key: key);

  @override
  State<MovieFavoritesScreen> createState() => _MovieFavoritesScreenState();
}

class _MovieFavoritesScreenState extends State<MovieFavoritesScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final movieList = HiveDatabase().getMovies();
    return Container(
      color: AppColors.black,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 8.0, left: 16),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Likes',
                style: AppStyles.movieListHeader,
              ),
            ),
          ),
          const SizedBox(height: 8.0),
          Expanded(
            child: ValueListenableBuilder<Box<Movie>>(
              valueListenable: HiveDatabase().getMovieBox().listenable(),
              builder: (context, box, widget) {
                return MovieDatabaseList(movieDatabaseList: movieList);
              },
            ),
          ),
        ],
      ),
    );
  }
}
