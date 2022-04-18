import 'package:get/get.dart';
import 'package:movie_app_flutter/movie_app_lib.dart';

class MovieApiController extends GetxController {
  var upcomingMovieIsLoading = true.obs;
  var upcomingMovieHasError = false.obs;
  var upcomingMovieErrorMessage = ''.obs;
  var upcomingMovieList = <Result>[].obs;

  var isTrendingListLoading = true.obs;
  var trendingMovieList = <Result>[].obs;

  @override
  void onInit() {
    getUpcomingMovieList();
    super.onInit();
  }

  void getUpcomingMovieList() async {
    try {
      upcomingMovieIsLoading(true);
      final moviesUpcoming = await MovieApi.getUpcomingMovies();
      upcomingMovieList.value = moviesUpcoming.results!;
    } catch (e) {
      upcomingMovieHasError(true);
      upcomingMovieErrorMessage.value = e.toString();
    } finally {
      upcomingMovieIsLoading(false);
    }
  }
}
