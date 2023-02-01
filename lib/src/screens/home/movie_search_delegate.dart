import 'package:flutter/material.dart';
import 'package:movie_app_flutter/library.dart';

class MovieSearchDelegate extends SearchDelegate<MovieSearch> {
  MovieApi movieApi = MovieApi();

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          cleanQueryTextAndDismissSearch(context);
        },
        icon: const Icon(Icons.clear_sharp),
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        cleanQueryTextAndDismissSearch(context);
      },
      icon: const Icon(Icons.arrow_back_sharp),
    );
  }

  void cleanQueryTextAndDismissSearch(BuildContext context) {
    if (query.isNotEmpty) {
      query = '';
    } else {
      close(context, MovieSearch());
    }
  }

  @override
  Widget buildResults(BuildContext context) {
    //double screenWidth = MediaQuery.of(context).size.width;
    return FutureBuilder<MovieSearch>(
      future: movieApi.searchMovies(query: query),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const ErrorText(
            text: 'Your search field may be empty',
          );
        }
        if (snapshot.hasData) {
          final movieList = snapshot.data?.results;
          if (movieList == null || movieList.isEmpty) {
            return const ErrorText(
              text: 'Your search returned nothing',
            );
          }
          return ListView.builder(
            itemCount: movieList.length,
            itemBuilder: (context, index) {
              return CardMovieSummary(
                movie: movieList[index],
                clickable: true,
              );
            },
          );
        }
        return const AnimateMovieSummaryList();
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return FutureBuilder<MovieSearch>(
      future: movieApi.searchMovies(query: query),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const ErrorText(
            text: 'Your search field may be empty',
          );
        }
        if (snapshot.hasData) {
          final movieList = snapshot.data?.results;
          if (movieList == null || movieList.isEmpty) {
            return const ErrorText(
              text: 'Your search returned nothing',
            );
          }
          return ListView.builder(
            itemCount: snapshot.data?.results?.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(movieList[index].title ?? 'None'),
                onTap: () {
                  query = movieList[index].title ?? 'None';
                  showResults(context);
                },
              );
            },
          );
        }
        return const Padding(
          padding: EdgeInsets.all(16.0),
          child: CircularProgressIndicator(strokeWidth: 8.0),
        );
      },
    );
  }
}
