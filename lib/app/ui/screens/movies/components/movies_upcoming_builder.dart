import 'dart:async';

import 'package:movie_app_flutter/movie_app_lib.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UpcomingMoviesBuilder extends StatefulWidget {
  const UpcomingMoviesBuilder({Key? key}) : super(key: key);

  @override
  State<UpcomingMoviesBuilder> createState() => _UpcomingMoviesBuilderState();
}

class _UpcomingMoviesBuilderState extends State<UpcomingMoviesBuilder> {
  //late Future<MoviesUpcoming> _moviesUpcoming;
  late PageController _pageController;

  final movieApiController = Get.put(MovieApiController());

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    //_moviesUpcoming = MovieApi.getUpcomingMovies();
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Obx(() {
      if (movieApiController.upcomingMovieIsLoading.value) {
        return const Padding(
          padding: EdgeInsets.all(16.0),
          child: Text(
            'Loading movie list...',
            style: AppStyles.movieTitleText,
          ),
        );
      } else if (movieApiController.upcomingMovieHasError.value) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            movieApiController.upcomingMovieErrorMessage.value,
            style: AppStyles.movieTitleText,
          ),
        );
      } else {
        return PageView.builder(
          controller: _pageController,
          scrollDirection: Axis.horizontal,
          itemCount: movieApiController.upcomingMovieList.length,
          itemBuilder: (context, index) {
            return UpcomingMovieCard(
              movie: movieApiController.upcomingMovieList[index],
              cardHeight: 210,
              cardWidth: 0.8 * screenWidth,
            );
          },
        );
      }
    });
  }
}

/*
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
  }**/