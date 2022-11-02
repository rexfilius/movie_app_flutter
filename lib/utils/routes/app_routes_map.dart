import 'package:flutter/material.dart';
import 'package:movie_app_flutter/movie_app_lib.dart';

Map<String, Widget Function(BuildContext)> appRoutesMap = {
  AppRoutes.homeScreen: (context) => const HomeScreen(),
  AppRoutes.moviesScreen: (context) => const MoviesScreen(),
  AppRoutes.movieFavoritesScreen: (context) => const MovieBookmarkScreen(),
  AppRoutes.movieDetailScreen: (context) => const MovieDetailScreen(),
};
