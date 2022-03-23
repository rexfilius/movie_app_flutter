import 'dart:convert';
import 'package:movie_app_flutter/movie_app_lib.dart';

MoviesPopular moviesPopularFromJson(String str) =>
    MoviesPopular.fromJson(json.decode(str));

String moviesPopularToJson(MoviesPopular data) => json.encode(data.toJson());

class MoviesPopular {
  MoviesPopular({
    this.page,
    this.results,
    this.totalPages,
    this.totalResults,
  });

  int? page;
  List<Result>? results;
  int? totalPages;
  int? totalResults;

  factory MoviesPopular.fromJson(Map<String, dynamic> json) {
    return MoviesPopular(
      page: json["page"],
      results:
          List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
      totalPages: json["total_pages"],
      totalResults: json["total_results"],
    );
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['page'] = page;
    if (results != null) {
      map['results'] = results?.map((e) => e.toJson()).toList();
    }
    // List<dynamic>.from(results.map((x) => x.toJson()))
    map['total_pages'] = totalPages;
    map['total_results'] = totalResults;
    return map;
  }
}
