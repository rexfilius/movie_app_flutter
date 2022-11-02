class MovieNowPlaying {
  DatesNowPlaying? dates;
  int? page;
  List<ResultNowPlaying>? results;
  int? totalPages;
  int? totalResults;

  MovieNowPlaying({
    this.dates,
    this.page,
    this.results,
    this.totalPages,
    this.totalResults,
  });

  factory MovieNowPlaying.fromJson(Map<String, dynamic> json) {
    return MovieNowPlaying(
      dates: DatesNowPlaying.fromJson(json["dates"]),
      page: json["page"],
      results: List<ResultNowPlaying>.from(
        json["results"].map((x) => ResultNowPlaying.fromJson(x)),
      ),
      totalPages: json["total_pages"],
      totalResults: json["total_results"],
    );
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map["dates"] = dates?.toJson();
    map["page"] = page;
    map["results"] = results?.map((e) => e.toJson()).toList() ?? [];
    map["total_pages"] = totalPages;
    map["total_results"] = totalResults;
    return map;
  }
}

class ResultNowPlaying {
  ResultNowPlaying({
    this.adult,
    this.backdropPath,
    this.genreIds,
    this.id,
    this.originalLanguage,
    this.originalTitle,
    this.overview,
    this.popularity,
    this.posterPath,
    this.releaseDate,
    this.title,
    this.video,
    this.voteAverage,
    this.voteCount,
  });

  bool? adult;
  String? backdropPath;
  List<int>? genreIds;
  int? id;
  String? originalLanguage;
  String? originalTitle;
  String? overview;
  double? popularity;
  String? posterPath;
  String? releaseDate;
  String? title;
  bool? video;
  double? voteAverage;
  int? voteCount;

  factory ResultNowPlaying.fromJson(Map<String, dynamic> json) {
    return ResultNowPlaying(
      adult: json["adult"],
      backdropPath: json["backdrop_path"],
      genreIds: List<int>.from(json["genre_ids"].map((x) => x)),
      id: json["id"],
      originalLanguage: json["original_language"],
      originalTitle: json["original_title"],
      overview: json["overview"],
      popularity: json["popularity"].toDouble(),
      posterPath: json["poster_path"],
      releaseDate: json["release_date"],
      title: json["title"],
      video: json["video"],
      voteAverage: json["vote_average"].toDouble(),
      voteCount: json["vote_count"],
    );
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map["adult"] = adult;
    map["backdrop_path"] = backdropPath;
    map["genre_ids"] = genreIds;
    map["id"] = id;
    map["original_language"] = originalLanguage;
    map["original_title"] = originalTitle;
    map["overview"] = overview;
    map["popularity"] = popularity;
    map["poster_path"] = posterPath;
    map["release_date"] = releaseDate;
    map["title"] = title;
    map["video"] = video;
    map["vote_average"] = voteAverage;
    map["vote_count"] = voteCount;
    return map;
  }

  @override
  String toString() {
    return "ResultNowPlaying(adult:$adult, backdropPath:$backdropPath,"
        " genreIds:$genreIds, id:$id, originalLanguage:$originalLanguage,"
        " originalTitle:$originalTitle, overview:$overview,"
        " popularity:$popularity, posterPath:$posterPath,"
        " releaseDate:$releaseDate, title:$title, video:$video,"
        " voteAverage:$voteAverage, voteCount:$voteCount)";
  }
}

class DatesNowPlaying {
  String? maximum;
  String? minimum;

  DatesNowPlaying({
    this.maximum,
    this.minimum,
  });

  factory DatesNowPlaying.fromJson(Map<String, dynamic> json) {
    return DatesNowPlaying(
      maximum: json['maximum'],
      minimum: json['minimum'],
    );
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['maximum'] = maximum;
    map['minimum'] = minimum;
    return map;
  }
}
