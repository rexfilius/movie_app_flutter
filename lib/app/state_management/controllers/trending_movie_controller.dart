import 'dart:io';

import 'package:get/get.dart';
import 'package:movie_app_flutter/movie_app_lib.dart';

class TrendingMovieController extends GetxController {
  var listIsLoading = true.obs;
  var listHasError = false.obs;
  var listErrorMessage = ''.obs;
  var movieList = <Result>[].obs;

  @override
  void onInit() {
    getTrendingMovieList();
    super.onInit();
  }

  void getTrendingMovieList() async {
    try {
      listIsLoading(true);
      final moviesTrending = await MovieApi.getTrendingMovies();
      movieList.value = moviesTrending.results!;
    } on SocketException catch (e) {
      listHasError(true);
      listErrorMessage.value = e.toString();
    } catch (e) {
      listHasError(true);
      listErrorMessage.value = e.toString();
    } finally {
      listIsLoading(false);
    }
  }
}
