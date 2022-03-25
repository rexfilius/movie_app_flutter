import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:movie_app_flutter/movie_app_lib.dart';

Movie convertJsonResultToMovie(Result result) {
  String filePath = '';
  saveImage(result).then((value) {
    return filePath = value;
  });

  return Movie(
    adult: result.adult,
    genreIds: result.genreIds,
    id: result.id,
    originalLanguage: result.originalLanguage,
    originalTitle: result.originalTitle,
    overview: result.overview,
    popularity: result.popularity,
    releaseDate: result.releaseDate,
    title: result.title,
    video: result.video,
    voteAverage: result.voteAverage,
    voteCount: result.voteCount,
    posterPath: filePath,
  );
}

Future<String> getImageFilePath(Result result) async {
  final directory = await getApplicationDocumentsDirectory();
  final filePath = directory.path; //directory.path + 'images';
  await Directory(filePath).create(recursive: true);
  final filePathAndName = filePath + '${result.posterPath}';
  return filePathAndName;
}

Future<String> saveImage(Result result) async {
  HttpClient httpClient = HttpClient();
  String filePath;
  String imageUrl;

  try {
    imageUrl = baseUrlImage + '${result.posterPath}';
    var request = await httpClient.getUrl(Uri.parse(imageUrl));
    var response = await request.close();

    if (response.statusCode == 200) {
      var bytes = await consolidateHttpClientResponseBytes(response);
      filePath = await getImageFilePath(result);
      File file = File(filePath);
      await file.writeAsBytes(bytes);
    } else {
      filePath = 'Error code: ' + response.statusCode.toString();
    }
  } catch (exception) {
    filePath = 'cannot fetch url' + exception.toString();
  }
  return filePath;
}

Result result = Result();
var ff = getImageFilePath(result);
