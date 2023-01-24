import 'package:flutter/material.dart';
import 'package:movie_app_flutter/library.dart';

class ScreenMovieUpcoming extends StatefulWidget {
  const ScreenMovieUpcoming({super.key});

  @override
  State<ScreenMovieUpcoming> createState() => _ScreenMovieUpcomingState();
}

class _ScreenMovieUpcomingState extends State<ScreenMovieUpcoming> {
  late Future<MovieUpcoming> movieUpcoming;
  MovieApi movieApi = MovieApi();

  @override
  void initState() {
    super.initState();
    movieUpcoming = movieApi.getUpcomingMovies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Upcoming Movies'),
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder<MovieUpcoming>(
              future: movieUpcoming,
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
