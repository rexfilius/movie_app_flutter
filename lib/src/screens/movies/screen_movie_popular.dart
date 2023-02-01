import 'package:flutter/material.dart';
import 'package:movie_app_flutter/library.dart';

class ScreenMoviePopular extends StatefulWidget {
  const ScreenMoviePopular({super.key});

  @override
  State<ScreenMoviePopular> createState() => _ScreenMoviePopularState();
}

class _ScreenMoviePopularState extends State<ScreenMoviePopular> {
  late Future<MoviePopular> moviePopular;
  MovieApi movieApi = MovieApi();

  @override
  void initState() {
    super.initState();
    moviePopular = movieApi.getPopularMovies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Popular Movies'),
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder<MoviePopular>(
              future: moviePopular,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  List<Result> movies = snapshot.data!.results!;
                  return ListView.builder(
                    physics: const BouncingScrollPhysics(
                      parent: AlwaysScrollableScrollPhysics(),
                    ),
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
          )
        ],
      ),
    );
  }
}
