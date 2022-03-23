import 'package:hive_flutter/adapters.dart';

part 'movie.g.dart';

@HiveType(typeId: 1)
class Movie extends HiveObject {
  @HiveField(0)
  bool? adult;

  @HiveField(1)
  List<int>? genreIds;

  @HiveField(2)
  int? id;

  @HiveField(3)
  String? originalLanguage;

  @HiveField(4)
  String? originalTitle;

  @HiveField(5)
  String? overview;

  @HiveField(6)
  double? popularity;

  @HiveField(7)
  String? releaseDate;

  @HiveField(8)
  String? title;

  @HiveField(9)
  bool? video;

  @HiveField(10)
  double? voteAverage;

  @HiveField(11)
  int? voteCount;

  // String? posterPath;
  // String? backdropPath;

  Movie({
    this.adult,
    this.genreIds,
    this.id,
    this.originalLanguage,
    this.originalTitle,
    this.overview,
    this.popularity,
    this.releaseDate,
    this.title,
    this.video,
    this.voteAverage,
    this.voteCount,
  });
}
