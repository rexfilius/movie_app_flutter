import 'package:movie_app_flutter/movie_app_lib.dart';
import 'package:flutter/material.dart';

class PopularMovieBuilder extends StatefulWidget {
  const PopularMovieBuilder({Key? key}) : super(key: key);

  @override
  State<PopularMovieBuilder> createState() => _PopularMovieBuilderState();
}

class _PopularMovieBuilderState extends State<PopularMovieBuilder> {
  late Future<MoviesPopular> _moviesPopular;

  @override
  void initState() {
    super.initState();
    _moviesPopular = getPopularMovies();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return FutureBuilder<MoviesPopular>(
      future: _moviesPopular,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasData) {
            return ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: snapshot.data?.results?.length,
              itemBuilder: (context, index) {
                return PopularMovieCard(
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
