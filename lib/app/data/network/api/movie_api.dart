import 'dart:convert';
import 'dart:io';
import 'package:movie_app_flutter/app/api_token/api_key.dart';
import 'package:movie_app_flutter/movie_app_lib.dart';
import 'package:http/http.dart' as http;

const String baseUrl = "https://api.themoviedb.org/3/";
const String baseUrlImage = "https://image.tmdb.org/t/p/original";

class MovieApi {
  static http.Client client = http.Client();

  /// This function uses the http package to get the list of upcoming movies
  /// from the API
  static Future<MoviesUpcoming> getUpcomingMovies() async {
    const String url = "${baseUrl}movie/upcoming?api_key=$apiKey";

    try {
      final response = await client.get(Uri.parse(url));
      if (response.statusCode == 200) {
        return MoviesUpcoming.fromJson(jsonDecode(response.body));
      } else {
        throw '${response.body}: Error: failed to get upcoming movies';
      }
    } on SocketException {
      throw 'You are not connected to the internet';
    } catch (e) {
      throw e.toString();
    }
  }

  /// This function uses the http package to get the list of trending movies
  /// from the API.
  static Future<MoviesTrending> getTrendingMovies() async {
    const String url = "${baseUrl}trending/movie/day?api_key=$apiKey";

    try {
      final response = await client.get(Uri.parse(url));
      if (response.statusCode == 200) {
        return MoviesTrending.fromJson(jsonDecode(response.body));
      } else {
        throw '${response.body}: Error: failed to get trending movies';
      }
    } on SocketException {
      throw 'You are not connected to the internet';
    } catch (e) {
      throw e.toString();
    }
  }

  /// This function uses the http package to return a list of movies
  /// from the api that match the query data it received. The 'query'
  /// data is expected to be a 'movie title'.
  static Future<MoviesSearch> searchMovies({required String query}) async {
    String url =
        "${baseUrl}search/movie?api_key=$apiKey&query=$query&adult=false";

    try {
      final response = await client.get(Uri.parse(url));
      if (response.statusCode == 200) {
        return MoviesSearch.fromJson(jsonDecode(response.body));
      } else {
        throw '${response.body}: Error: could not search movies';
      }
    } on SocketException {
      throw 'You are not connected to the internet';
    } catch (e) {
      throw e.toString();
    }
  }
}
