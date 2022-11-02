import 'package:movie_app_flutter/movie_app_lib.dart';

class MovieNowPlaying {
  Dates? dates;
  int? page;
  List<Result>? results;
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
      dates: Dates.fromJson(json["dates"]),
      page: json["page"],
      results: List<Result>.from(
        json["results"].map((x) => Result.fromJson(x)),
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
