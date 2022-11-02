import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:movie_app_flutter/movie_app_lib.dart';

class UpcomingMovieCard extends StatelessWidget {
  const UpcomingMovieCard({
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
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          AppRoutes.movieDetailScreen,
          arguments: movie,
        );
      },
      child: Container(
        padding: const EdgeInsets.all(8.0),
        margin: const EdgeInsets.all(8.0),
        width: cardWidth,
        height: cardHeight,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          image: DecorationImage(
              image: CachedNetworkImageProvider(
                "$baseUrlImage${movie.posterPath}",
              ),
              fit: BoxFit.cover),
        ),
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Text(
            movie.title ?? "Null",
            style: AppStyles.upcomingMovieTitleText,
          ),
        ),
      ),
    );
  }
}
