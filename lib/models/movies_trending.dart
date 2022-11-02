import 'package:movie_app_flutter/movie_app_lib.dart';

/// This is the model class that represents the Json response from the API
/// when the 'trending' movies endpoint is called
class MoviesTrending {
  MoviesTrending({
    this.page,
    this.results,
    this.totalPages,
    this.totalResults,
  });

  int? page;
  List<Result>? results;
  int? totalPages;
  int? totalResults;

  factory MoviesTrending.fromJson(Map<String, dynamic> json) {
    return MoviesTrending(
      page: json["page"],
      results:
          List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
      totalPages: json["total_pages"],
      totalResults: json["total_results"],
    );
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};

    map["page"] = page;
    if (results != null) {
      map["results"] = results?.map((e) => e.toJson()).toList();
    }
    map["total_pages"] = totalPages;
    map["total_results"] = totalResults;

    return map;
  }
}
