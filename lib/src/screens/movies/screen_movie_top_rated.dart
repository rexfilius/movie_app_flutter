import 'package:flutter/material.dart';
import 'package:movie_app_flutter/library.dart';

class ScreenMovieTopRated extends StatefulWidget {
  const ScreenMovieTopRated({super.key});

  @override
  State<ScreenMovieTopRated> createState() => _ScreenMovieTopRatedState();
}

class _ScreenMovieTopRatedState extends State<ScreenMovieTopRated> {
  late Future<MovieTopRated> movieTopRated;
  MovieApi movieApi = MovieApi();

  @override
  void initState() {
    super.initState();
    movieTopRated = movieApi.getTopRatedMovies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Top Rated Movies'),
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder<MovieTopRated>(
              future: movieTopRated,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  List<Result> movies = snapshot.data!.results!;
                  return ListView.builder(
                    itemCount: movies.length,
                    itemBuilder: (context, index) {
                      return CardMovieSummary(
                        movie: movies[index],
                        clickable: true,
                      );
                    },
                  );
                }
                return const AnimateMovieSummaryList();
              },
            ),
          ),
        ],
      ),
    );
  }
}
