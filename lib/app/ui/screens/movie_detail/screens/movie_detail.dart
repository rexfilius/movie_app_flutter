import 'dart:ui';

import 'package:movie_app_flutter/movie_app_lib.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class MovieDetailScreen extends StatelessWidget {
  const MovieDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Result;
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
                  imageUrl: baseUrlImage + "${args.posterPath}",
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.save,
                  color: AppColors.white,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                args.title ?? "Null",
                style: AppStyles.movieTitleText,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                args.overview ?? "Null",
                style: AppStyles.movieTitleText,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                args.originalTitle ?? "Null",
                style: AppStyles.movieTitleText,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                args.releaseDate ?? "Null",
                style: AppStyles.movieTitleText,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "${args.popularity}",
                style: AppStyles.movieTitleText,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "${args.voteCount}",
                style: AppStyles.movieTitleText,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
