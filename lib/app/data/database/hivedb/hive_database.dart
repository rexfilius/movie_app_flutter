import 'package:hive_flutter/hive_flutter.dart';
import 'package:movie_app_flutter/movie_app_lib.dart';

const String movieDatabaseName = 'movie_database';

/// The class that handles database operations for the Hive database
class HiveDatabase {
  Box<Movie> getMovieBox() => Hive.box(movieDatabaseName);

  void saveMovie(Movie movie) {
    final box = getMovieBox();
    //final movieList = box.values.toSet().cast<Movie>();
    //movieList.add(movie);
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
