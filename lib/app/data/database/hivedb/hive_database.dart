import 'package:movie_app_flutter/movie_app_lib.dart';

class HiveDatabase {
  static const String name = 'movie_database';
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
