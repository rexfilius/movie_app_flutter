import 'package:movie_app_flutter/library.dart';

class TvTrendingResult extends TvShowResult {
  // bool? adult;
  // String? backdropPath;
  // int? id;
  // String? name;
  // String? originalLanguage;
  // String? originalName;
  // String? overview;
  // String? posterPath;
  // String? mediaType;
  // List<int>? genreIds;
  // double? popularity;
  // String? firstAirDate;
  // num? voteAverage;
  // int? voteCount;
  // List<String>? originCountry;

  TvTrendingResult({
    super.adult,
    super.backdropPath,
    super.id,
    super.name,
    super.originalLanguage,
    super.originalName,
    super.overview,
    super.posterPath,
    super.mediaType,
    super.genreIds,
    super.popularity,
    super.firstAirDate,
    super.voteAverage,
    super.voteCount,
    super.originCountry,
  });

  factory TvTrendingResult.fromJson(Map<String, dynamic> json) {
    return TvTrendingResult(
      adult: json['adult'],
      backdropPath: json['backdrop_path'],
      id: json['id'],
      name: json['name'],
      originalLanguage: json['original_language'],
      originalName: json['original_name'],
      overview: json['overview'],
      posterPath: json['poster_path'],
      mediaType: json['media_type'],
      genreIds: List<int>.from(json["genre_ids"].map((x) => x)),
      popularity: json['popularity'],
      firstAirDate: json['first_air_date'],
      voteAverage: json['vote_average'],
      voteCount: json['vote_count'],
      originCountry: List<String>.from(json["origin_country"].map((e) => e)),
    );
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['adult'] = adult;
    map['backdrop_path'] = backdropPath;
    map['id'] = id;
    map['name'] = name;
    map['original_language'] = originalLanguage;
    map['original_name'] = originalName;
    map['overview'] = overview;
    map['poster_path'] = posterPath;
    map['media_type'] = mediaType;
    map["genre_ids"] = genreIds?.map((e) => e).toList();
    map['popularity'] = popularity;
    map['first_air_date'] = firstAirDate;
    map["vote_average"] = voteAverage;
    map["vote_count"] = voteCount;
    map["origin_country"] = originCountry?.map((e) => e).toList();
    return map;
  }

  @override
  String toString() {
    return {
      "CLASS": "TvTrendingResult",
      "backdropPath": backdropPath,
      "id": id,
      "name": name,
      "originalLanguage": originalLanguage,
      "originalName": originalName,
      "overview": overview,
      "posterPath": posterPath,
      "mediaType": mediaType,
      "genreIds": genreIds,
      "popularity": popularity,
      "firstAirDate": firstAirDate,
      "voteAverage": voteAverage,
      "voteCount": voteCount,
      "originCountry": originCountry,
    }.toString();
  }
}
