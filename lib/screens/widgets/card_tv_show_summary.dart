import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_app_flutter/library.dart';

class CardTvShowSummary extends StatelessWidget {
  const CardTvShowSummary({
    required this.tvShow,
    required this.clickable,
    super.key,
  });

  final TvResult tvShow;
  final bool clickable;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double widgetHeight = 0.7 * screenWidth;
    double widgetWidth = 0.95 * screenWidth;
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
          width: widgetWidth,
          height: widgetHeight,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 0.4 * widgetWidth,
                height: 0.9 * widgetHeight,
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
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Flexible(
                        child: Text(
                          "${tvShow.name}",
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Row(
                        children: <Widget>[
                          Icon(
                            Icons.star,
                            color: Colors.amber.shade600,
                          ),
                          Text("${tvShow.voteAverage} TMDB"),
                        ],
                      ),
                      Text("First aired - ${tvShow.firstAirDate}")
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
