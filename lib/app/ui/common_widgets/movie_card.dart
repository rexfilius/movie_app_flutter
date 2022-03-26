import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:movie_app_flutter/movie_app_lib.dart';

class MovieCard extends StatelessWidget {
  const MovieCard({
    required this.movie,
    required this.cardWidth,
    required this.cardHeight,
    required this.clickable,
    Key? key,
  }) : super(key: key);

  final Result movie;
  final double cardWidth;
  final double cardHeight;
  final bool clickable;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: cardWidth,
      height: cardHeight,
      child: GestureDetector(
        onTap: () {
          if (clickable) {
            Navigator.pushNamed(
              context,
              AppRoutes.movieDetailScreen,
              arguments: movie,
            );
          }
        },
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 0.5 * cardWidth,
              height: 0.65 * cardHeight,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: CachedNetworkImageProvider(
                    baseUrlImage + "${movie.posterPath}",
                  ),
                ),
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                movie.adult != null && movie.adult == true
                    ? const Text('18+', style: AppStyles.movieTitleText2)
                    : const Text('13+', style: AppStyles.movieTitleText2),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(
                      Icons.star,
                      color: AppColors.goldYellow,
                    ),
                    Text(
                      '${movie.voteAverage}',
                      style: AppStyles.movieTitleText2,
                    )
                  ],
                ),
              ],
            ),
            Flexible(
              child: Text(
                '${movie.title}',
                style: AppStyles.movieTitleText,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/**@override
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
    child: Padding(
    padding: const EdgeInsets.all(8.0),
    child: Row(
    mainAxisSize: MainAxisSize.min,
    children: [
    movie.adult != null && movie.adult == true
    ? const Text(
    '18+',
    style: AppStyles.movieTitleText2,
    )
    : const Text(
    '13+',
    style: AppStyles.movieTitleText2,
    ),
    Row(
    children: [
    const Icon(
    Icons.star,
    color: AppColors.goldYellow,
    ),
    Text(
    "${movie.voteCount}",
    style: AppStyles.movieTitleText2,
    ),
    ],
    )
    ],
    ),
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
    }*/
