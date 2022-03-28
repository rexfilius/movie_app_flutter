# movie_app_flutter

A mobile app that displays "Trending" and "Upcoming" movies from an API.

## Getting Started

To run the app, you need an API key from [MovieDB](https://www.themoviedb.org/)

The app was built with these SDKs:
- Dart = 2.16.1
- Flutter = 2.10.1

## How it works
On app startup, the first screen contains an AppBar with two tabs - My Movies & My List.
A search icon is also present on the AppBar, where the user can click and search for movie titles.

My Movies Tab shows a list of upcoming movies and trending movies, which are gotten from the api.
The lists are scrolled horizontally.

My List Tab shows a GridView list of movies that the user liked and has been saved to a local database.

When a movie item on the list is clicked, it naviagates to another screen - where more details of the movie are shown on the screen. On this movie detail screen, the
user can add a movie to the 'favorite' list or remove it from the list.

## Packages/Libraries Used For Development
- [http](https://pub.dev/packages/http) = a Future-based library for making HTTP requests.
- [hive](https://pub.dev/packages/hive) = a lightweight and blazing fast key-value database written in pure Dart.
- [cached_network_image](https://pub.dev/packages/cached_network_image) = a Flutter library to show images from the internet and keep them in the cache directory.
- [path_provider](https://pub.dev/packages/path_provider) = a Flutter plugin for finding commonly used locations on the filesystem.
- [flutter_svg](https://pub.dev/packages/flutter_svg) = an SVG rendering and widget library for Flutter.
