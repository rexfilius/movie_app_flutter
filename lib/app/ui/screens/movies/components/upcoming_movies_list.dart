import 'package:movie_app_flutter/movie_app_lib.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UpcomingMoviesList extends StatelessWidget {
  UpcomingMoviesList({Key? key}) : super(key: key);

  final _movieController = Get.put(UpcomingMovieController());

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Obx(() {
      if (_movieController.listIsLoading.value) {
        return const LoadingListState(text: 'Loading movie list...');
      } else if (_movieController.listHasError.value) {
        return ErrorListState(text: _movieController.listErrorMessage.value);
      } else {
        return PageView.builder(
          controller: _movieController.pageController.value,
          scrollDirection: Axis.horizontal,
          itemCount: _movieController.movieList.length,
          itemBuilder: (context, index) {
            return UpcomingMovieCard(
              movie: _movieController.movieList[index],
              cardHeight: 210,
              cardWidth: 0.8 * screenWidth,
            );
          },
        );
      }
    });
  }
}
