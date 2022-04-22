import 'package:movie_app_flutter/movie_app_lib.dart';
import 'package:flutter/material.dart';

class TrendingMoviesList extends StatefulWidget {
  const TrendingMoviesList({Key? key}) : super(key: key);

  @override
  State<TrendingMoviesList> createState() => _TrendingMoviesListState();
}

class _TrendingMoviesListState extends State<TrendingMoviesList> {
  late Future<MoviesTrending> _moviesTrending;

  @override
  void initState() {
    super.initState();
    _moviesTrending = MovieApi.getTrendingMovies();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return FutureBuilder<MoviesTrending>(
      future: _moviesTrending,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasData) {
            return ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: snapshot.data?.results?.length,
              itemBuilder: (context, index) {
                return TrendingMovieCard(
                  movie: snapshot.data!.results![index],
                  cardHeight: 0.8 * screenWidth,
                  cardWidth: 0.6 * screenWidth,
                  clickable: true,
                );
              },
            );
          } else if (snapshot.hasError) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Oops! An error occurred',
                style: AppStyles.movieTitleText,
              ),
            );
          }
        }
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            'Loading movie list...',
            style: AppStyles.movieTitleText,
          ),
        );
      },
    );
  }
}
