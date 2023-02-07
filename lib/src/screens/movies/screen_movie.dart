import 'package:movie_app_flutter/library.dart';
import 'package:flutter/material.dart';

class ScreenMovie extends StatefulWidget {
  const ScreenMovie({Key? key}) : super(key: key);

  @override
  State<ScreenMovie> createState() => _ScreenMovieState();
}

class _ScreenMovieState extends State<ScreenMovie> {
  late Future<MovieNowPlaying> movieNowPlaying;
  late Future<MovieUpcoming> movieUpcoming;
  MovieApi movieApi = MovieApi();

  @override
  void initState() {
    super.initState();
    movieNowPlaying = movieApi.getNowPlayingMovies();
    movieUpcoming = movieApi.getUpcomingMovies();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return ListView(
      physics: const BouncingScrollPhysics(
        parent: AlwaysScrollableScrollPhysics(),
      ),
      children: [
        const Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: EdgeInsets.only(left: 8.0, top: 8.0, bottom: 8.0),
            child: Text(
              'Now Showing',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        SizedBox(
          width: 0.55 * screenWidth,
          height: 0.75 * screenWidth,
          child: FutureBuilder<MovieNowPlaying>(
            future: movieNowPlaying,
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Center(child: Text(snapshot.error.toString()));
              }
              if (snapshot.hasData) {
                List<Result> movieList = snapshot.data!.results!;
                return ListView.builder(
                  physics: const BouncingScrollPhysics(
                    parent: AlwaysScrollableScrollPhysics(),
                  ),
                  scrollDirection: Axis.horizontal,
                  itemCount: movieList.length,
                  itemBuilder: (context, index) {
                    Result movie = movieList[index];
                    return CardNowShowing(
                      movie: movie,
                      clickable: true,
                    );
                  },
                );
              }
              return const AnimateNowShowingList();
            },
          ),
        ),
        const Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: EdgeInsets.only(left: 8.0, top: 8.0, bottom: 8.0),
            child: Text(
              'Upcoming Movies',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        const Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: EdgeInsets.only(left: 8.0),
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
