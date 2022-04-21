import 'package:flutter/material.dart';
import 'package:movie_app_flutter/movie_app_lib.dart';
import 'package:get/get.dart';

class MovieSearchDelegate2 extends SearchDelegate<MoviesSearch> {
  final _searchController = Get.put(MovieSearchController());

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
    query = _searchController.queryText.value;
    return Obx(() {
      if (_searchController.listIsLoading.value) {
        return const LoadingListState(text: 'Loading your search results...');
      } else if (_searchController.listHasError.value) {
        return ErrorListState(text: _searchController.listErrorMessage.value);
      } else {
        if (_searchController.movieList == null &&
            _searchController.movieList.isEmpty) {
          return const ErrorListState(text: 'You search returned nothing');
        } else {
          return GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
            itemCount: _searchController.movieList.length,
            itemBuilder: (context, index) {
              return TrendingMovieCard(
                movie: _searchController.movieList[index],
                cardWidth: 0.5 * screenWidth,
                cardHeight: 210,
                clickable: true,
              );
            },
          );
        }
      }
    });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return const Center();
  }
}

/**
FutureBuilder<MoviesSearch>(
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
 */