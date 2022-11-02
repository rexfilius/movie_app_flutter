import 'dart:async';

import 'package:movie_app_flutter/movie_app_lib.dart';
import 'package:flutter/material.dart';

class UpcomingMoviesList extends StatefulWidget {
  const UpcomingMoviesList({Key? key}) : super(key: key);

  @override
  State<UpcomingMoviesList> createState() => _UpcomingMoviesListState();
}

class _UpcomingMoviesListState extends State<UpcomingMoviesList> {
  late Future<MovieUpcoming> _moviesUpcoming;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _moviesUpcoming = MovieApi.getUpcomingMovies();
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return FutureBuilder<MovieUpcoming>(
      future: _moviesUpcoming,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasData) {
            return PageView.builder(
              controller: _pageController,
              scrollDirection: Axis.horizontal,
              itemCount: snapshot.data?.results?.length,
              itemBuilder: (context, index) {
                return UpcomingMovieCard(
                  movie: snapshot.data!.results![index],
                  cardHeight: 210,
                  cardWidth: 0.8 * screenWidth,
                );
              },
            );
          } else if (snapshot.hasError) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Oops! An error occurred',
                style: AppStyles.movieTitleText,
              ),
            );
          }
        }
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            'Loading movie list...',
            style: AppStyles.movieTitleText,
          ),
        );
      },
    );
  }
}
