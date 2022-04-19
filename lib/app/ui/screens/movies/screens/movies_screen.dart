import 'package:movie_app_flutter/movie_app_lib.dart';
import 'package:flutter/material.dart';

class MoviesScreen extends StatefulWidget {
  const MoviesScreen({Key? key}) : super(key: key);

  @override
  State<MoviesScreen> createState() => _MoviesScreenState();
}

class _MoviesScreenState extends State<MoviesScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.black,
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: const [
            Padding(
              padding: EdgeInsets.only(top: 8.0, left: 16),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Coming Soon',
                  style: AppStyles.movieListHeader,
                ),
              ),
            ),
            SizedBox(height: 8.0),
            SizedBox(
              height: 220,
              child: UpcomingMoviesList(),
            ),
            Padding(
              padding: EdgeInsets.only(top: 8.0, left: 16),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Trending Now',
                  style: AppStyles.movieListHeader,
                ),
              ),
            ),
            SizedBox(height: 8.0),
            SizedBox(
              height: 230,
              child: TrendingMoviesList(),
            ),
          ],
        ),
      ),
    );
  }
}
