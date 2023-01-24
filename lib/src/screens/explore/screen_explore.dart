import 'package:flutter/material.dart';
import 'package:movie_app_flutter/library.dart';

class ScreenExplore extends StatefulWidget {
  const ScreenExplore({Key? key}) : super(key: key);

  @override
  State<ScreenExplore> createState() => _ScreenExploreState();
}

class _ScreenExploreState extends State<ScreenExplore> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Material(
          elevation: 14.0,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Bookmarked Movies',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      AppRoutes.screenBookmarkMovie,
                    );
                  },
                  icon: const Icon(Icons.navigate_next_sharp),
                ),
              ],
            ),
          ),
        ),
        Material(
          elevation: 14.0,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Bookmarked TV Shows',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      AppRoutes.screenBookmarkTvShow,
                    );
                  },
                  icon: const Icon(Icons.navigate_next_sharp),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  /*@override
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
  }*/
}
