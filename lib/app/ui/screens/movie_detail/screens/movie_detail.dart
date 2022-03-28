import 'package:movie_app_flutter/movie_app_lib.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class MovieDetailScreen extends StatelessWidget {
  const MovieDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final resultArgs = ModalRoute.of(context)!.settings.arguments as Result;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: AppColors.black,
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            floating: true,
            expandedHeight: 0.9 * screenWidth,
            backgroundColor: AppColors.black,
            flexibleSpace: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: CachedNetworkImageProvider(
                      baseUrlImage + "${resultArgs.posterPath}",
                    ),
                    fit: BoxFit.cover),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              decoration: const BoxDecoration(color: AppColors.black),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 16.0, top: 16.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          resultArgs.adult != null && resultArgs.adult == true
                              ? const Text('18+',
                                  style: AppStyles.movieTitleText2)
                              : const Text('13+',
                                  style: AppStyles.movieTitleText2),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Icon(
                                Icons.star,
                                color: AppColors.goldYellow,
                              ),
                              Text(
                                '${resultArgs.voteAverage}',
                                style: AppStyles.movieTitleText2,
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: FutureBuilder<Movie>(
                      future: convertJsonResultToMovie(resultArgs),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return IconButton(
                            onPressed: () {
                              if (HiveDatabase()
                                  .isMovieInDatabase(snapshot.data!)) {
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(SnackBar(
                                  content:
                                      Text('${resultArgs.title} already added'),
                                ));
                              } else {
                                HiveDatabase().addToFavorites(snapshot.data!);
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      '${resultArgs.title} added to favorites',
                                    ),
                                  ),
                                );
                              }
                            },
                            icon: const Icon(
                              Icons.save,
                              color: AppColors.white,
                            ),
                          );
                        }
                        return const Icon(Icons.http);
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        resultArgs.title ?? "Null",
                        style: AppStyles.movieListHeader,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      resultArgs.overview ?? "Null",
                      style: AppStyles.movieTitleText,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
