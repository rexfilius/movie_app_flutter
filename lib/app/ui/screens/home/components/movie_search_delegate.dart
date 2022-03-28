import 'package:flutter/material.dart';
import 'package:movie_app_flutter/movie_app_lib.dart';

class MovieSearchDelegate extends SearchDelegate<MoviesSearch> {
  @override
  ThemeData appBarTheme(BuildContext context) {
    return ThemeData(canvasColor: AppColors.black);
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return const Center();
  }

  @override
  Widget buildResults(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return FutureBuilder<MoviesSearch>(
      future: searchMovies(query: query),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data?.results == null &&
              snapshot.data!.results!.isEmpty) {
            return const Text('Your search returned nothing');
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
          return Text(snapshot.error.toString());
        }
        return const Text('Loading Search...');
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return const Center();
  }
}
