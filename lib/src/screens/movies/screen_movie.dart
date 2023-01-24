import 'package:movie_app_flutter/library.dart';
import 'package:flutter/material.dart';

class ScreenMovie extends StatefulWidget {
  const ScreenMovie({Key? key}) : super(key: key);

  @override
  State<ScreenMovie> createState() => _ScreenMovieState();
}

class _ScreenMovieState extends State<ScreenMovie> {
  late Future<MovieNowPlaying> movieNowPlaying;
  MovieApi movieApi = MovieApi();

  @override
  void initState() {
    super.initState();
    movieNowPlaying = movieApi.getNowPlayingMovies();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: EdgeInsets.only(left: 16.0, top: 8.0),
            child: Text(
              'Now Showing',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        FutureBuilder<MovieNowPlaying>(
          future: movieNowPlaying,
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(child: Text(snapshot.error.toString()));
            }
            if (snapshot.hasData) {
              List<Result> movieList = snapshot.data!.results!;
              return Flexible(
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: movieList.length,
                  itemBuilder: (context, index) {
                    Result movie = movieList[index];
                    return CardNowShowing(
                      movie: movie,
                      clickable: true,
                    );
                  },
                ),
              );
            }
            //return const CircularProgressIndicator();
            return const AnimateNowShowingList();
          },
        ),
        const Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: EdgeInsets.only(left: 16.0),
            child: Text(
              'More',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              MoreOptionsCard(
                tag: 'Popular movies',
                onTapCard: () {
                  Navigator.pushNamed(context, AppRoutes.screenMoviePopular);
                },
              ),
              MoreOptionsCard(
                tag: 'Top rated movies',
                onTapCard: () {
                  Navigator.pushNamed(context, AppRoutes.screenMovieTopRated);
                },
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              MoreOptionsCard(
                tag: 'Upcoming movies',
                onTapCard: () {
                  Navigator.pushNamed(context, AppRoutes.screenMovieUpcoming);
                },
              ),
              MoreOptionsCard(
                tag: 'Trending movies',
                onTapCard: () {
                  Navigator.pushNamed(context, AppRoutes.screenMovieTrending);
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
