abstract class TvShowResult {
  // common properties in TvResult and TvTrendingResult
  String? backdropPath;
  String? firstAirDate;
  List<int>? genreIds;
  int? id;
  String? name;
  List<String>? originCountry;
  String? originalLanguage;
  String? originalName;
  String? overview;
  double? popularity;
  String? posterPath;
  num? voteAverage;
  int? voteCount;

  // property unique only to TvTrendingResult
  bool? adult;
  String? mediaType;

  TvShowResult({
    this.backdropPath,
    this.firstAirDate,
    this.genreIds,
    this.id,
    this.name,
    this.originCountry,
    this.originalLanguage,
    this.originalName,
    this.overview,
    this.popularity,
    this.posterPath,
    this.voteAverage,
    this.voteCount,
    this.adult,
    this.mediaType,
  });
}
