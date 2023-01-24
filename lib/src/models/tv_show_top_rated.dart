import 'package:movie_app_flutter/library.dart';

class TvShowTopRated {
  int? page;
  List<TvResult>? results;
  int? totalPages;
  int? totalResults;

  TvShowTopRated({
    this.page,
    this.results,
    this.totalPages,
    this.totalResults,
  });

  factory TvShowTopRated.fromJson(Map<String, dynamic> json) {
    return TvShowTopRated(
      page: json["page"],
      results: List<TvResult>.from(
        json["results"].map((e) => TvResult.fromJson(e)),
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
      "CLASS": "TvShowTopRated",
      "page": page,
      "results": results,
      "totalPages": totalPages,
      "totalResults": totalResults,
    }.toString();
  }
}
