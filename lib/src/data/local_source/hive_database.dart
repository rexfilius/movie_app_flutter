import 'package:hive_flutter/hive_flutter.dart';
import 'package:movie_app_flutter/library.dart';

const String movieDatabaseName = 'movie_database';
const String tvShowDatabaseName = 'tv_show_database';

/// The class that handles database operations for the Hive database
class HiveDatabase {
  Box<EntityMovie> getMovieBox() => Hive.box(movieDatabaseName);
  Box<EntityTvShow> getTvShowBox() => Hive.box(tvShowDatabaseName);

  void addMovieToDatabase(EntityMovie movie) {
    final box = getMovieBox();
    if (box.containsKey(movie.id)) {
      return;
    } else {
      box.put(movie.id, movie);
    }
  }

  void addShowToDatabase(EntityTvShow tvShow) {
    final box = getTvShowBox();
    if (box.containsKey(tvShow.id)) {
      return;
    } else {
      box.put(tvShow.id, tvShow);
    }
  }

  void removeMovieFromDatabase(EntityMovie movie) {
    final box = getMovieBox();
    if (box.containsKey(movie.id)) {
      box.delete(movie.id);
    } else {
      return;
    }
  }

  void removeTvShowFromDatabase(EntityTvShow tvShow) {
    final box = getTvShowBox();
    if (box.containsKey(tvShow.id)) {
      box.delete(tvShow.id);
    } else {
      return;
    }
  }

  bool isMovieInDatabase(EntityMovie movie) {
    final box = getMovieBox();
    if (box.containsKey(movie.id)) {
      return true;
    } else {
      return false;
    }
  }

  bool isTvShowInDatabase(EntityTvShow tvShow) {
    final box = getTvShowBox();
    if (box.containsKey(tvShow.id)) {
      return true;
    } else {
      return false;
    }
  }

  List<EntityMovie> getMovieListFromDatabase() {
    final box = getMovieBox();
    final movieList = box.values.toList().cast<EntityMovie>();
    return movieList;
  }

  List<EntityTvShow> getTvShowListFromDatabase() {
    final box = getTvShowBox();
    final showList = box.values.toList().cast<EntityTvShow>();
    return showList;
  }
}
