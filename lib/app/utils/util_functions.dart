import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:movie_app_flutter/movie_app_lib.dart';

/// This function converts the Json response model class - Result - to the
/// database model class - Movie.
Future<Movie> convertJsonResultToMovie(Result result) async {
  final filePath = await saveImageToAppDirectory(result);

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

/// This function returns the file path of where the movie image will be saved
/// on the app directory
Future<String> getImageFilePath(Result result) async {
  final directory = await getApplicationDocumentsDirectory();
  final filePath = directory.path; //directory.path + 'images';
  await Directory(filePath).create(recursive: true);
  final filePathAndName = filePath + '${result.posterPath}';
  return filePathAndName;
}

/// This function downloads the movie image and saves it to the app's directory
Future<String> saveImageToAppDirectory(Result result) async {
  HttpClient httpClient = HttpClient();
  String imageFilePath;
  String imageUrl;

  try {
    imageUrl = baseUrlImage + '${result.posterPath}';
    var request = await httpClient.getUrl(Uri.parse(imageUrl));
    var response = await request.close();

    if (response.statusCode == 200) {
      var bytes = await consolidateHttpClientResponseBytes(response);
      imageFilePath = await getImageFilePath(result);
      File file = File(imageFilePath);
      await file.writeAsBytes(bytes);
    } else {
      imageFilePath = 'Error code: ' + response.statusCode.toString();
    }
  } catch (exception) {
    imageFilePath = 'cannot fetch url' + exception.toString();
  }
  return imageFilePath;
}

Future<bool> isPermissionGranted() async {
  var status = await Permission.storage.request();
  switch (status) {
    case PermissionStatus.denied:
      return false;
    case PermissionStatus.granted:
      return true;
    case PermissionStatus.restricted:
      return false;
    case PermissionStatus.limited:
      return false;
    case PermissionStatus.permanentlyDenied:
      return false;
  }
}
