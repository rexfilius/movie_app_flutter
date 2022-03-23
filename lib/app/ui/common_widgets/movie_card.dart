import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:movie_app_flutter/movie_app_lib.dart';

class MovieCard extends StatelessWidget {
  const MovieCard({
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
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(
            context,
            AppRoutes.movieDetailScreen,
            arguments: movie,
          );
        },
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
              child: Text(
                movie.title ?? "Null",
                style: AppStyles.movieTitleText,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
