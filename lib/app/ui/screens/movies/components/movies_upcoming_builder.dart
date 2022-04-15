import 'dart:async';

import 'package:movie_app_flutter/movie_app_lib.dart';
import 'package:flutter/material.dart';

class UpcomingMoviesBuilder extends StatefulWidget {
  const UpcomingMoviesBuilder({Key? key}) : super(key: key);

  @override
  State<UpcomingMoviesBuilder> createState() => _UpcomingMoviesBuilderState();
}

class _UpcomingMoviesBuilderState extends State<UpcomingMoviesBuilder> {
  late Future<MoviesUpcoming> _moviesUpcoming;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _moviesUpcoming = getUpcomingMovies();
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return FutureBuilder<MoviesUpcoming>(
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
            return const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Oops! An error occurred',
                style: AppStyles.movieTitleText,
              ),
            );
          }
        }
        return const Padding(
          padding: EdgeInsets.all(16.0),
          child: Text(
            'Loading movie list...',
            style: AppStyles.movieTitleText,
          ),
        );
      },
    );
  }
}
