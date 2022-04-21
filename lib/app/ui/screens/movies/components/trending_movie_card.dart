import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:movie_app_flutter/movie_app_lib.dart';
import 'package:get/get.dart';

class TrendingMovieCard extends StatelessWidget {
  const TrendingMovieCard({
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
            Get.toNamed(AppRoutes.movieDetailScreen, arguments: movie);
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
