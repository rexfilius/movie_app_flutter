import 'package:flutter/material.dart';
import 'package:movie_app_flutter/movie_app_lib.dart';

class MovieSearchDelegate extends SearchDelegate<MoviesSearch> {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        color: Colors.white,
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
      color: Colors.white,
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
      close(context, MoviesSearch());
    }
  }

  @override
  Widget buildResults(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return FutureBuilder<MoviesSearch>(
      future: MovieApi.searchMovies(searchQuery: query),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const ErrorListState(
            text: 'Your search field may be empty',
          );
        }
        if (snapshot.data?.results == null && snapshot.data!.results!.isEmpty) {
          return const ErrorListState(text: 'Your search returned nothing');
        }
        return GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
          itemCount: snapshot.data?.results?.length,
          itemBuilder: (context, index) {
            return TrendingMovieCard(
              movie: snapshot.data!.results![index],
              cardWidth: 0.5 * screenWidth,
              cardHeight: 210,
              clickable: true,
            );
          },
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return FutureBuilder<MoviesSearch>(
      future: MovieApi.searchMovies(searchQuery: query),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const ErrorListState(
            text: 'Your search field may be empty',
          );
        }
        if (snapshot.data?.results == null && snapshot.data!.results!.isEmpty) {
          return const ErrorListState(text: 'Your search returned nothing');
        }
        return ListView.builder(
          itemCount: snapshot.data?.results?.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(snapshot.data!.results![index].title ?? 'None'),
              onTap: () {
                query = snapshot.data!.results![index].title ?? 'None';
                showResults(context);
              },
            );
          },
        );
      },
    );
  }
}
