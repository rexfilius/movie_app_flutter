import 'package:flutter/material.dart';
import 'package:movie_app_flutter/library.dart';

class ScreenMovieTrending extends StatefulWidget {
  const ScreenMovieTrending({super.key});

  @override
  State<ScreenMovieTrending> createState() => _ScreenMovieTrendingState();
}

class _ScreenMovieTrendingState extends State<ScreenMovieTrending> {
  late Future<MovieTrending> movieTrending;
  MovieApi movieApi = MovieApi();

  @override
  void initState() {
    super.initState();
    movieTrending = movieApi.getTrendingMovies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Trending Movies'),
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder<MovieTrending>(
              future: movieTrending,
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
          ),
        ],
      ),
    );
  }
}
