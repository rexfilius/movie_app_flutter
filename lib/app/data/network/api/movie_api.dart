import 'dart:convert';
import 'package:movie_app_flutter/app/api_token/api_key.dart';
import 'package:movie_app_flutter/movie_app_lib.dart';
import 'package:http/http.dart' as http;

const String baseUrl = "https://api.themoviedb.org/3/";
const String baseUrlImage = "https://image.tmdb.org/t/p/original";

/// This function uses the http package to get the list of upcoming movies
/// from the API
Future<MoviesUpcoming> getUpcomingMovies() async {
  const String url = "${baseUrl}movie/upcoming?api_key=$apiKey";
  final response = await http.get(Uri.parse(url));

  if (response.statusCode == 200) {
    return MoviesUpcoming.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('${response.body} - Error: failed to get upcoming movies');
  }
}

/// This function uses the http package to get the list of trending movies
/// from the API.
Future<MoviesTrending> getTrendingMovies() async {
  const String url = "${baseUrl}trending/movie/day?api_key=$apiKey";
  final response = await http.get(Uri.parse(url));

  if (response.statusCode == 200) {
    return MoviesTrending.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('${response.body} - Error: failed to get trending movies');
  }
}

Future<MoviesSearch> searchMovies({required String query}) async {
  String url =
      "${baseUrl}search/movie?api_key=$apiKey&query=$query&adult=false";
  final response = await http.get(Uri.parse(url));

  if (response.statusCode == 200) {
    return MoviesSearch.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('${response.body} - Error: could not search movies');
  }
}
