import 'package:movie_app_flutter/movie_app_lib.dart';

extension ResultExtension on Result {
  /// This function converts the Json response model class[Result]
  /// to the database model class[Movie]
  Future<Movie> convertToDatabaseModel() async {
    final filePath = await saveImageToAppDirectory(this);
    return Movie(
      adult: adult,
      genreIds: genreIds,
      id: id,
      originalLanguage: originalLanguage,
      originalTitle: originalTitle,
      overview: overview,
      popularity: popularity,
      releaseDate: releaseDate,
      title: title,
      video: video,
      voteAverage: voteAverage,
      voteCount: voteCount,
      posterPath: filePath,
    );
  }
}
