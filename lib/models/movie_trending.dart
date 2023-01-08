import 'package:movie_app_flutter/library.dart';

/// This is the model class that represents the Json response from the API
/// when the 'trending' movies endpoint is called
class MovieTrending {
  MovieTrending({
    this.page,
    this.results,
    this.totalPages,
    this.totalResults,
  });

  int? page;
  List<Result>? results;
  int? totalPages;
  int? totalResults;

  factory MovieTrending.fromJson(Map<String, dynamic> json) {
    return MovieTrending(
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
    map["page"] = page;
    map["results"] = results?.map((e) => e.toJson()).toList() ?? [];
    map["total_pages"] = totalPages;
    map["total_results"] = totalResults;
    return map;
  }
}
