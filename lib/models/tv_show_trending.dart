import 'package:movie_app_flutter/library.dart';

class TvShowTrending {
  int? page;
  List<TvTrendingResult>? results;
  int? totalPages;
  int? totalResults;

  TvShowTrending({
    this.page,
    this.results,
    this.totalPages,
    this.totalResults,
  });

  factory TvShowTrending.fromJson(Map<String, dynamic> json) {
    return TvShowTrending(
      page: json["page"],
      results: List<TvTrendingResult>.from(
        json["results"].map((e) => TvTrendingResult.fromJson(e)),
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

  @override
  String toString() {
    return {
      "CLASS": "TvShowTrending",
      "page": page,
      "results": results,
      "totalPages": totalPages,
      "totalResults": totalResults,
    }.toString();
  }
}
