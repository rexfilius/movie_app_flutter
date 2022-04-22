import 'package:flutter/material.dart';
import 'package:movie_app_flutter/movie_app_lib.dart';

class MovieSearchDelegate extends SearchDelegate<MoviesSearch> {
  @override
  ThemeData appBarTheme(BuildContext context) {
    return ThemeData(canvasColor: AppColors.black);
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    return null;
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return const Center();
  }

  @override
  Widget buildResults(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return FutureBuilder<MoviesSearch>(
      future: MovieApi.searchMovies(query: query),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data?.results == null &&
              snapshot.data!.results!.isEmpty) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Your search returned nothing',
                style: AppStyles.movieTitleText,
              ),
            );
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
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Oops!! Error - Your search field may be empty',
              style: AppStyles.movieTitleText,
            ),
          );
        }
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            'Loading your Search result...',
            style: AppStyles.movieTitleText,
          ),
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return const Center();
  }
}
