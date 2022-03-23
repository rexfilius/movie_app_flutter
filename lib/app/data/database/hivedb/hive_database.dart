import 'package:hive_flutter/hive_flutter.dart';
import 'package:movie_app_flutter/movie_app_lib.dart';

class HiveDatabase {
  static const String name = 'movie_database';

  Box<Movie> getMovieBox() => Hive.box(HiveDatabase.name);

  void saveMovie(Movie movie) {
    final box = getMovieBox();
    box.add(movie);
  }

  List<Movie> getMovies() {
    final box = getMovieBox();
    final movieList = box.values.toList().cast<Movie>();
    return movieList;
  }

  void deleteMovie(int movieIndex) {
    final box = getMovieBox();
    box.deleteAt(movieIndex);
  }
}

Movie convertJsonResultToMovie(Result result) {
  return Movie(
    adult: result.adult,
    genreIds: result.genreIds,
    id: result.id,
    originalLanguage: result.originalLanguage,
    originalTitle: result.originalTitle,
    overview: result.overview,
    popularity: result.popularity,
    releaseDate: result.releaseDate,
    title: result.title,
    video: result.video,
    voteAverage: result.voteAverage,
    voteCount: result.voteCount,
  );
}
