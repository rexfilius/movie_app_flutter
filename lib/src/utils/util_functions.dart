import 'package:flutter/foundation.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:movie_app_flutter/library.dart';

/// This function returns the file path of where a [EntityMovie] poster image
/// will be saved on the app directory
Future<String> getMovieImageFilePath(Result movie) async {
  final directory = await getApplicationDocumentsDirectory();
  final filePath = directory.path; //directory.path + 'images';
  await Directory(filePath).create(recursive: true);
  final filePathAndName = '$filePath${movie.posterPath}';
  return filePathAndName;
}

/// This function returns the file path of where a [EntityTvShow] poster image
/// will be saved on the app directory
Future<String> getShowImageFilePath(TvResult tvShow) async {
  final directory = await getApplicationDocumentsDirectory();
  final filePath = directory.path; //directory.path + 'images';
  await Directory(filePath).create(recursive: true);
  final filePathAndName = '$filePath${tvShow.posterPath}';
  return filePathAndName;
}

/// This function downloads a [EntityMovie] poster image and saves it to
/// the app's directory. You do not need to ask for permission since you are
/// just working inside the app's directory and not the phone's storage.
///
/// It returns the file path of where the image is.
Future<String> saveMovieImageToAppDirectory(Result movie) async {
  HttpClient httpClient = HttpClient();
  String imageFilePath;
  String imageUrl;

  try {
    imageUrl = '$movieBaseUrlImage${movie.posterPath}';
    var request = await httpClient.getUrl(Uri.parse(imageUrl));
    var response = await request.close();

    if (response.statusCode == 200) {
      var bytes = await consolidateHttpClientResponseBytes(response);
      imageFilePath = await getMovieImageFilePath(movie);
      File file = File(imageFilePath);
      await file.writeAsBytes(bytes);
    } else {
      imageFilePath = 'Error code: ${response.statusCode}';
    }
  } catch (exception) {
    imageFilePath = 'cannot fetch url $exception';
  }
  return imageFilePath;
}

/// This function downloads a [EntityTvShow] poster image and saves it to
/// the app's directory. You do not need to ask for permission since you are
/// just working inside the app's directory and not the phone's storage.
///
/// It returns the file path of where the image is.
Future<String> saveShowImageToAppDirectory(TvResult tvShow) async {
  HttpClient httpClient = HttpClient();
  String imageFilePath;
  String imageUrl;

  try {
    imageUrl = '$tvBaseUrlImage${tvShow.posterPath}';
    var request = await httpClient.getUrl(Uri.parse(imageUrl));
    var response = await request.close();

    if (response.statusCode == 200) {
      var bytes = await consolidateHttpClientResponseBytes(response);
      imageFilePath = await getShowImageFilePath(tvShow);
      File file = File(imageFilePath);
      await file.writeAsBytes(bytes);
    } else {
      imageFilePath = 'Error code: ${response.statusCode}';
    }
  } catch (exception) {
    imageFilePath = 'cannot fetch url $exception';
  }
  return imageFilePath;
}
