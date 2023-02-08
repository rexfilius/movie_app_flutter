import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_app_flutter/library.dart';

class CardNowShowingTV extends StatelessWidget {
  const CardNowShowingTV({
    required this.tvShow,
    required this.clickable,
    super.key,
  });

  final TvResult tvShow;
  final bool clickable;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
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
      child: Padding(
        padding: const EdgeInsets.only(left: 8.0, right: 8.0),
        child: SizedBox(
          width: 0.5 * screenWidth,
          height: 0.7 * screenWidth,
          child: CachedNetworkImage(
            imageUrl: "$movieBaseUrlImage${tvShow.posterPath}",
          ),
        ),
      ),
    );
  }
}
