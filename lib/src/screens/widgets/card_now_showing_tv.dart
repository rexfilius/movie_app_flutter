import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_app_flutter/library.dart';

class CardNowShowingTv extends StatelessWidget {
  const CardNowShowingTv({
    required this.tvShow,
    required this.clickable,
    super.key,
  });

  final TvResult tvShow;
  final bool clickable;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double movieCardWidth = 0.65 * screenWidth;
    double movieCardHeight = 0.9 * screenWidth;
    return GestureDetector(
      onTap: () {
        if (clickable) {
          Navigator.pushNamed(
            context,
            AppRoutes.screenTvShowDetail,
            arguments: tvShow,
          );
        }
      },
      child: Container(
        margin: const EdgeInsets.all(8.0),
        padding: const EdgeInsets.only(left: 8.0, right: 8.0),
        width: movieCardWidth,
        height: movieCardHeight,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Material(
              elevation: 14.0,
              child: Container(
                width: 0.95 * movieCardWidth,
                height: 1.1 * movieCardHeight,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: CachedNetworkImageProvider(
                      "$movieBaseUrlImage${tvShow.posterPath}",
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "${tvShow.name}",
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Flexible(
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0, top: 8.0),
                child: Row(
                  children: <Widget>[
                    Icon(
                      Icons.star,
                      color: Colors.amber.shade600,
                    ),
                    Text("${tvShow.voteAverage} TMDB"),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
