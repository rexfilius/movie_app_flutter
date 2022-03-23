import 'package:movie_app_flutter/movie_app_lib.dart';
import 'package:flutter/material.dart';

class MoviesScreen extends StatefulWidget {
  const MoviesScreen({Key? key}) : super(key: key);

  @override
  State<MoviesScreen> createState() => _MoviesScreenState();
}

class _MoviesScreenState extends State<MoviesScreen> {
  // late Future<MoviesPopular> _moviesPopular;

  @override
  void initState() {
    super.initState();
    //_moviesPopular = getPopularMovies();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text('Coming Soon'),
          const SizedBox(height: 8.0),
          const SizedBox(
            height: 185,
            child: UpcomingMoviesBuilder(),
          ),
          const Text('Coming Soon'),
          const SizedBox(height: 8.0),
          SizedBox(
            height: 100,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: movies.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(movies[index]),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

final List<String> movies = [
  'Olympus has fallen',
  'Olympus has fallen',
  'Olympus has fallen',
  'Olympus has fallen',
  'Olympus has fallen',
  'Olympus has fallen',
  'Olympus has fallen',
  'Olympus has fallen',
  'Olympus has fallen'
];

/// TEST CODE TO CONFIRM API CALL IS A SUCCESS
// Center(
// child: FutureBuilder<MoviesPopular>(
// future: _moviesPopular,
// builder: (context, snapshot) {
// if (snapshot.hasData) {
// return ListView.builder(
// itemCount: snapshot.data?.results?.length,
// itemBuilder: (context, index) {
// return Padding(
// padding: const EdgeInsets.all(8.0),
// child: Text('${snapshot.data?.results?[index]}'),
// );
// },
// );
// } else if (snapshot.hasError) {
// return Text('${snapshot.error}');
// }
// return const CircularProgressIndicator();
// },
// ),
// );
