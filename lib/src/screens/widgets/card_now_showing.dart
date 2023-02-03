import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_app_flutter/library.dart';

class CardNowShowing extends StatelessWidget {
  const CardNowShowing({
    required this.movie,
    required this.clickable,
    super.key,
  });

  final Result movie;
  final bool clickable;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: () {
        if (clickable) {
          Navigator.pushNamed(
            context,
            AppRoutes.screenMovieDetail,
            arguments: movie,
          );
        }
      },
      child: Material(
        elevation: 14.0,
        child: Container(
          margin: const EdgeInsets.all(8.0),
          padding: const EdgeInsets.only(left: 8.0, right: 8.0),
          width: 0.5 * screenWidth,
          height: 0.2 * screenWidth,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: CachedNetworkImageProvider(
                "$movieBaseUrlImage${movie.posterPath}",
              ),
            ),
          ),
        ),
      ),
    );
  }
}
