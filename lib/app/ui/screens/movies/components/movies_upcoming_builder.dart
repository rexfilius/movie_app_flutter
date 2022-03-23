import 'package:movie_app_flutter/movie_app_lib.dart';
import 'package:flutter/material.dart';

class UpcomingMoviesBuilder extends StatefulWidget {
  const UpcomingMoviesBuilder({Key? key}) : super(key: key);

  @override
  State<UpcomingMoviesBuilder> createState() => _UpcomingMoviesBuilderState();
}

class _UpcomingMoviesBuilderState extends State<UpcomingMoviesBuilder> {
  late Future<MoviesUpcoming> _moviesUpcoming;

  @override
  void initState() {
    super.initState();
    _moviesUpcoming = getUpcomingMovies();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return FutureBuilder<MoviesUpcoming>(
      future: _moviesUpcoming,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasData) {
            return ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: snapshot.data?.results?.length,
              itemBuilder: (context, index) {
                return MovieCard(
                  movie: snapshot.data!.results![index],
                  cardHeight: 210,
                  cardWidth: 0.5 * screenWidth,
                );
              },
            );
          } else if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }
        }
        return const Text('Loading movie list...');
      },
    );
  }
}
