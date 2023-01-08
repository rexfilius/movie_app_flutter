import 'dart:io';

import 'package:flutter/material.dart';
import 'package:movie_app_flutter/library.dart';

class CardMovieEntitySummary extends StatelessWidget {
  const CardMovieEntitySummary({
    required this.movie,
    required this.clickable,
    super.key,
  });

  final EntityMovie movie;
  final bool clickable;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double widgetHeight = 0.7 * screenWidth;
    double widgetWidth = 0.95 * screenWidth;
    return GestureDetector(
      onTap: () {
        if (clickable) {
          // Navigator.pushNamed(
          //   context,
          //   AppRoutes.movieDetail,
          //   arguments: movie,
          // );
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
                    image: FileImage(File(movie.posterPath!)),
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
                          "${movie.title}",
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
                          Text("${movie.voteAverage} TMDB"),
                        ],
                      ),
                      Text("Released - ${movie.releaseDate}")
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
