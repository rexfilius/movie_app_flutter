import 'package:movie_app_flutter/movie_app_lib.dart';
import 'package:flutter/material.dart';

class MovieDatabaseList extends StatelessWidget {
  const MovieDatabaseList({
    required this.movieDatabaseList,
    Key? key,
  }) : super(key: key);

  final List<Movie> movieDatabaseList;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      shrinkWrap: true,
      itemCount: movieDatabaseList.length,
      itemBuilder: (context, index) {
        return FavoriteMovieCard(
          movie: movieDatabaseList[index],
          cardWidth: 0.5 * screenWidth,
          cardHeight: 210,
          clickable: false,
        );
      },
    );
  }
}
