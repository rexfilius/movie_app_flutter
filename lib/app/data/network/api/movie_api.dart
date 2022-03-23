import 'dart:convert';
import 'package:movie_app_flutter/app/api_token/api_key.dart';
import 'package:movie_app_flutter/movie_app_lib.dart';
import 'package:http/http.dart' as http;

const String baseUrl = "https://api.themoviedb.org/3/";
const String baseUrlImage = "https://image.tmdb.org/t/p/original";

Future<MoviesPopular> getPopularMovies() async {
  const String url = "${baseUrl}movie/popular?api_key=$apiKey";
  final response = await http.get(Uri.parse(url));

  if (response.statusCode == 200) {
    return MoviesPopular.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('${response.body} - Error: failed to get popular movies');
  }
}

Future<MoviesUpcoming> getUpcomingMovies() async {
  const String url = "${baseUrl}movie/upcoming?api_key=$apiKey";
  final response = await http.get(Uri.parse(url));

  if (response.statusCode == 200) {
    return MoviesUpcoming.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('${response.body} - Error: failed to get upcoming movies');
  }
}
