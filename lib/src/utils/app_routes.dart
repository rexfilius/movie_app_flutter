import 'package:flutter/material.dart';
import 'package:movie_app_flutter/library.dart';

abstract class AppRoutes {
  static const screenHome = 'home_screen';
  static const screenMovie = 'movies_screen';
  static const screenExplore = 'bookmark_screen';
  static const screenMoviePopular = 'movie_popular_screen';
  static const screenMovieTopRated = 'movie_top_rated_screen';
  static const screenMovieTrending = 'movie_trending_screen';
  static const screenMovieUpcoming = 'movie_upcoming_screen';
  static const screenMovieDetail = 'movie_detail_screen';
  static const screenTvShowPopular = 'tvShow_popular_screen';
  static const screenTvShowDetail = 'tvShow_detail_screen';
  static const screenTvShowOnTheAir = 'tvShow_on_air_screen';
  static const screenBookmarkMovie = 'movie_bookmark_screen';
  static const screenBookmarkTvShow = 'tvShow_bookmark_screen';
}

Map<String, Widget Function(BuildContext)> appRoutesMap = {
  AppRoutes.screenHome: (context) => const ScreenHome(),
  AppRoutes.screenMovie: (context) => const ScreenMovie(),
  AppRoutes.screenExplore: (context) => const ScreenExplore(),
  AppRoutes.screenMoviePopular: (context) => const ScreenMoviePopular(),
  AppRoutes.screenMovieTopRated: (context) => const ScreenMovieTopRated(),
  AppRoutes.screenMovieTrending: (context) => const ScreenMovieTrending(),
  AppRoutes.screenMovieUpcoming: (context) => const ScreenMovieUpcoming(),
  AppRoutes.screenMovieDetail: (context) => const ScreenMovieDetail(),
  AppRoutes.screenTvShowPopular: (context) => const ScreenTvShowPopular(),
  AppRoutes.screenTvShowDetail: (context) => const ScreenTvShowDetail(),
  AppRoutes.screenTvShowOnTheAir: (context) => const ScreenTvShowOnTheAir(),
  AppRoutes.screenBookmarkMovie: (context) => const ScreenBookmarkMovie(),
  AppRoutes.screenBookmarkTvShow: (context) => const ScreenBookmarkTvShow(),
};
