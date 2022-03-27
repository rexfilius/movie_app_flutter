import 'dart:ui';

import 'package:movie_app_flutter/movie_app_lib.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class MovieDetailScreen extends StatefulWidget {
  const MovieDetailScreen({Key? key}) : super(key: key);

  @override
  State<MovieDetailScreen> createState() => _MovieDetailScreenState();
}

class _MovieDetailScreenState extends State<MovieDetailScreen> {
  @override
  Widget build(BuildContext context) {
    final resultArgs = ModalRoute.of(context)!.settings.arguments as Result;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.black,
      ),
      backgroundColor: AppColors.black,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: SizedBox(
                width: 0.6 * screenWidth,
                height: 185,
                child: CachedNetworkImage(
                  imageUrl: baseUrlImage + "${resultArgs.posterPath}",
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: FutureBuilder<Movie>(
                future: convertJsonResultToMovie(resultArgs),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return IconButton(
                      onPressed: () {
                        if (HiveDatabase().isMovieInDatabase(snapshot.data!)) {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text('${resultArgs.title} already added'),
                          ));
                        } else {
                          HiveDatabase().addToFavorites(snapshot.data!);
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                '${resultArgs.title} added to favorites',
                              ),
                            ),
                          );
                        }
                      },
                      icon: const Icon(
                        Icons.save,
                        color: AppColors.white,
                      ),
                    );
                  }
                  return const Icon(Icons.http);
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                resultArgs.title ?? "Null",
                style: AppStyles.movieTitleText,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                resultArgs.overview ?? "Null",
                style: AppStyles.movieTitleText,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                resultArgs.originalTitle ?? "Null",
                style: AppStyles.movieTitleText,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                resultArgs.releaseDate ?? "Null",
                style: AppStyles.movieTitleText,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "${resultArgs.popularity}",
                style: AppStyles.movieTitleText,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "${resultArgs.voteCount}",
                style: AppStyles.movieTitleText,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
