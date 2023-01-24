class TvResult {
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
  num? voteCount;

  TvResult({
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
      voteAverage: json["vote_average"] as num?,
      voteCount: json["vote_count"] as num?,
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
