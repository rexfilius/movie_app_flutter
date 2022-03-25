import 'dart:io';

import 'package:movie_app_flutter/movie_app_lib.dart';
import 'package:flutter/material.dart';

class MovieList extends StatelessWidget {
  const MovieList({
    required this.movieList,
    Key? key,
  }) : super(key: key);

  final List<Movie> movieList;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      shrinkWrap: true,
      itemCount: movieList.length,
      itemBuilder: (context, index) {
        return FavMovieCard(
            movie: movieList[index],
            cardWidth: 0.5 * screenWidth,
            cardHeight: 210);
      },
    );
  }
}

class FavMovieCard extends StatelessWidget {
  const FavMovieCard({
    required this.movie,
    required this.cardWidth,
    required this.cardHeight,
    Key? key,
  }) : super(key: key);

  final Movie movie;
  final double cardWidth;
  final double cardHeight;

  @override
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
            Expanded(
              child: SizedBox(
                width: 150,
                height: 170,
                child: Image.file(File(movie.posterPath ?? '')),
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
  }
}

// Container(
// padding: const EdgeInsets.all(8.0),
// margin: const EdgeInsets.all(8.0),
// width: 180,
// height: 195,
// child: Column(
// mainAxisSize: MainAxisSize.min,
// children: [
// SizedBox(
// width: 140,
// height: 150,
// child: Image.file(
// File(movieList[index].posterPath ?? ''),
// fit: BoxFit.cover,
// ),
// ),
// Flexible(
// child: Text(
// movieList[index].title ?? "Null",
// style: AppStyles.movieTitleText,
// ),
// ),
// ],
// ),
// )

// return ListTile(
// title: Text(movieList[index].title ?? 'Null'),
// subtitle: Text(movieList[index].originalLanguage ?? 'Null'),
// );
