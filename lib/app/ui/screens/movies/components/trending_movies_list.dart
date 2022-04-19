import 'package:movie_app_flutter/movie_app_lib.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TrendingMoviesList extends StatelessWidget {
  TrendingMoviesList({Key? key}) : super(key: key);

  final _movieController = Get.put(TrendingMovieController());

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Obx(() {
      if (_movieController.listIsLoading.value) {
        return const LoadingListState(text: 'Loading movie list...');
      } else if (_movieController.listHasError.value) {
        return ErrorListState(text: _movieController.listErrorMessage.value);
      } else {
        return ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: _movieController.movieList.length,
          itemBuilder: (context, index) {
            return TrendingMovieCard(
              movie: _movieController.movieList[index],
              cardHeight: 0.8 * screenWidth,
              cardWidth: 0.6 * screenWidth,
              clickable: true,
            );
          },
        );
      }
    });
  }
}
