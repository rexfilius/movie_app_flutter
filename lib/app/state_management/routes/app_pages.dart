import 'package:get/get.dart';
import 'package:movie_app_flutter/movie_app_lib.dart';

abstract class AppPages {
  static final list = [
    GetPage(
      name: AppRoutes.homeScreen,
      page: () => HomeScreen(),
    ),
    GetPage(
      name: AppRoutes.moviesScreen,
      page: () => const MoviesScreen(),
    ),
    GetPage(
      name: AppRoutes.movieFavoritesScreen,
      page: () => const MovieFavoritesScreen(),
    ),
    GetPage(
      name: AppRoutes.movieDetailScreen,
      page: () => const MovieDetailScreen(),
    ),
  ];
}
