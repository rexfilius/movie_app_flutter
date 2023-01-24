class TvTrendingResult {
  bool? adult;
  String? backdropPath;
  int? id;
  String? name;
  String? originalLanguage;
  String? originalName;
  String? overview;
  String? posterPath;
  String? mediaType;
  List<int>? genreIds;
  double? popularity;
  String? firstAirDate;
  num? voteAverage;
  num? voteCount;
  List<String>? originCountry;

  TvTrendingResult({
    this.adult,
    this.backdropPath,
    this.id,
    this.name,
    this.originalLanguage,
    this.originalName,
    this.overview,
    this.posterPath,
    this.mediaType,
    this.genreIds,
    this.popularity,
    this.firstAirDate,
    this.voteAverage,
    this.voteCount,
    this.originCountry,
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
      voteAverage: json['vote_average'] as num?,
      voteCount: json['vote_count'] as num?,
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
