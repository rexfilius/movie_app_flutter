import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:movie_app_flutter/movie_app_lib.dart';

class MovieSearchController extends GetxController {
  var listIsLoading = true.obs;
  var listHasError = false.obs;
  var listErrorMessage = ''.obs;
  var movieList = <Result>[].obs;
  var textController = TextEditingController().obs;
  var queryText = ''.obs;

  @override
  void onInit() {
    getSearchResults(query: queryText.value);
    super.onInit();
  }

  void getSearchResults({required String query}) async {
    try {
      listIsLoading(true);
      final moviesSearch = await MovieApi.searchMovies(searchQuery: query);
      movieList.value = moviesSearch.results!;
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
