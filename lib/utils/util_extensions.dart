import 'package:movie_app_flutter/library.dart';

extension ResultExtension on Result {
  /// This function converts the Json response model class[Result]
  /// to the database model class[EntityMovie]
  Future<EntityMovie> convertToDatabaseModel() async {
    final filePath = await saveMovieImageToAppDirectory(this);
    return EntityMovie(
      adult: adult,
      genreIds: genreIds,
      id: id,
      originalLanguage: originalLanguage,
      originalTitle: originalTitle,
      overview: overview,
      popularity: popularity,
      releaseDate: releaseDate,
      title: title,
      voteAverage: voteAverage, // change type to num?
      voteCount: voteCount,
      posterPath: filePath,
    );
  }
}

extension TvShowResultExtension on TvShowResult {
  Future<EntityTvShow> convertToDatabaseModel() async {
    final filePath = await saveShowImageToAppDirectory(this);
    return EntityTvShow(
      firstAirDate: firstAirDate,
      genreIds: genreIds,
      id: id,
      name: name,
      originCountry: originCountry,
      originalLanguage: originalLanguage,
      originalName: originalName,
      overview: overview,
      popularity: popularity,
      posterPath: filePath,
      voteAverage: voteAverage,
      voteCount: voteCount,
    );
  }
}
