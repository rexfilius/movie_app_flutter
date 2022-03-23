import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:movie_app_flutter/movie_app_lib.dart';

class PopularMovieCard extends StatelessWidget {
  const PopularMovieCard({
    required this.movie,
    required this.cardWidth,
    required this.cardHeight,
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
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: 150,
            height: 170,
            child: CachedNetworkImage(
              imageUrl: baseUrlImage + "${movie.posterPath}",
            ),
          ),
          Flexible(
            child: Text(movie.title ?? "Null"),
          ),
        ],
      ),
    );
  }
}
