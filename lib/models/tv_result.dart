import 'package:movie_app_flutter/library.dart';

class TvResult extends TvShowResult {
  // String? backdropPath;
  // String? firstAirDate;
  // List<int>? genreIds;
  // int? id;
  // String? name;
  // List<String>? originCountry;
  // String? originalLanguage;
  // String? originalName;
  // String? overview;
  // double? popularity;
  // String? posterPath;
  // double? voteAverage;
  // int? voteCount;

  TvResult({
    super.backdropPath,
    super.firstAirDate,
    super.genreIds,
    super.id,
    super.name,
    super.originCountry,
    super.originalLanguage,
    super.originalName,
    super.overview,
    super.popularity,
    super.posterPath,
    super.voteAverage,
    super.voteCount,
  });

  factory TvResult.fromJson(Map<String, dynamic> json) {
    return TvResult(
      backdropPath: json["backdrop_path"],
      firstAirDate: json["first_air_date"],
      genreIds: List<int>.from(json["genre_ids"].map((x) => x)),
      id: json['id'],
      name: json['name'],
      originCountry: List<String>.from(json["origin_country"].map((e) => e)),
      originalLanguage: json["original_language"],
      originalName: json["original_name"],
      overview: json["overview"],
      popularity: json["popularity"],
      posterPath: json["poster_path"],
      voteAverage: json["vote_average"],
      voteCount: json["vote_count"],
    );
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map["backdrop_path"] = backdropPath;
    map["first_air_date"] = firstAirDate;
    map["genre_ids"] = genreIds?.map((e) => e).toList();
    map["id"] = id;
    map["name"] = name;
    map["origin_country"] = originCountry?.map((e) => e).toList();
    map["original_language"] = originalLanguage;
    map["original_name"] = originalName;
    map["overview"] = overview;
    map["popularity"] = popularity;
    map["poster_path"] = posterPath;
    map["vote_average"] = voteAverage;
    map["vote_count"] = voteCount;
    return map;
  }

  @override
  String toString() {
    return {
      "backdropPath": backdropPath,
      "firstAirDate": firstAirDate,
      "genreIds": genreIds,
      "id": id,
      "name": name,
      "originCountry": originCountry,
      "originalLanguage": originalLanguage,
      "originalName": originalName,
      "overview": overview,
      "popularity": popularity,
      "posterPath": posterPath,
      "voteAverage": voteAverage,
      "voteCount": voteCount,
    }.toString();
  }
}
