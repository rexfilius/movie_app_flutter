import 'package:flutter/material.dart';
import 'package:movie_app_flutter/movie_app_lib.dart';

class UpcomingMovieCard extends StatelessWidget {
  const UpcomingMovieCard({
    required this.movie,
    required this.cardHeight,
    required this.cardWidth,
    Key? key,
  }) : super(key: key);

  final Result movie;
  final double cardWidth;
  final double cardHeight;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      margin: const EdgeInsets.all(8.0),
      width: cardWidth,
      height: cardHeight,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          width: 2.0,
          color: Colors.red,
        ),
      ),
      child: Stack(
        children: [
          Image.network(baseUrlImage + "${movie.posterPath}"),
          Text(movie.title ?? 'Null'),
        ],
      ),
    );
  }
}
