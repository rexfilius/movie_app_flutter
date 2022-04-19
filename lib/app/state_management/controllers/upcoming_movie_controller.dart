import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app_flutter/movie_app_lib.dart';

class UpcomingMovieController extends GetxController {
  var listIsLoading = true.obs;
  var listHasError = false.obs;
  var listErrorMessage = ''.obs;
  var movieList = <Result>[].obs;

  var pageController = PageController().obs;

  @override
  void onInit() {
    getUpcomingMovieList();
    pageController.value = PageController();
    super.onInit();
  }

  @override
  void onClose() {
    pageController.value.dispose();
    super.onClose();
  }

  void getUpcomingMovieList() async {
    try {
      listIsLoading(true);
      final moviesUpcoming = await MovieApi.getUpcomingMovies();
      movieList.value = moviesUpcoming.results!;
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
