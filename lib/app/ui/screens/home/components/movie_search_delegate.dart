import 'package:flutter/material.dart';
import 'package:movie_app_flutter/movie_app_lib.dart';

class MovieSearchDelegate extends SearchDelegate<MoviesSearch> {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return <Widget>[
      IconButton(
        color: Colors.white,
        onPressed: () {
          if (query.isEmpty) {
            Navigator.pop(context);
          } else {
            query = '';
            showSuggestions(context);
          }
        },
        icon: const Icon(Icons.close_sharp),
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      color: Colors.white,
      onPressed: () {
        Navigator.pop(context);
      },
      icon: const Icon(Icons.arrow_back_sharp),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return FutureBuilder<MoviesSearch>(
      future: MovieApi.searchMovies(searchQuery: query),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data?.results == null &&
              snapshot.data!.results!.isEmpty) {
            return const ErrorListState(text: 'You search returned nothing');
          } else {
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
          }
        } else if (snapshot.hasError) {
          return const ErrorListState(
              text: 'Oops!! Error - Your search field may be empty');
        }
        return const LoadingListState(text: 'Loading your search results...');
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return const Center();
  }
}

/**
 FutureBuilder<List<Result>>(
      future: MovieApi.getMovieTitleSuggestions(searchQuery: query),
      builder: (context, snapshot) {
        if (query.isEmpty) {
          return const ErrorListState(text: 'Query is empty');
        }
        if (snapshot.hasData) {
          if (snapshot.data == null && snapshot.data!.isEmpty) {
            return const ErrorListState(text: 'No suggestions');
          } else {
            return ListView.builder(
              itemCount: snapshot.data?.length,
              itemBuilder: (context, index) {
                final suggestions = snapshot.data![index].title!;
                return ListTile(
                  onTap: () {
                    query = suggestions;
                    showResults(context);
                  },
                  title: Text(snapshot.data![index].title!),
                );
              },
            );
          }
        } else if (snapshot.hasError) {
          return const ErrorListState(text: 'No result, an error occured');
        }
        return const LoadingListState(text: 'Loading your search results...');
      },
    );
 */
