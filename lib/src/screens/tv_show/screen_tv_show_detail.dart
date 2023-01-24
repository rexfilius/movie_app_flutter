import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_app_flutter/library.dart';

class ScreenTvShowDetail extends StatelessWidget {
  const ScreenTvShowDetail({super.key});

  @override
  Widget build(BuildContext context) {
    final tvShow = ModalRoute.of(context)!.settings.arguments as TvShowResult;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            floating: true,
            expandedHeight: 0.9 * screenWidth,
            backgroundColor: AppColors.black,
            flexibleSpace: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: CachedNetworkImageProvider(
                    "$tvBaseUrlImage${tvShow.posterPath}",
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Padding(
                  padding: const EdgeInsets.only(
                    left: 16.0,
                    top: 16.0,
                    right: 16.0,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Text(
                          "${tvShow.name}",
                          style: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () async {
                          final aBoolean = await showSaveDialog(context);
                          if (aBoolean) {
                            EntityTvShow entityTvShow =
                                await tvShow.convertToDatabaseModel();
                            HiveDatabase().addShowToDatabase(entityTvShow);
                          }
                        },
                        icon: const Icon(Icons.bookmark_border_sharp),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 16.0,
                    top: 16.0,
                    bottom: 16.0,
                  ),
                  child: Row(
                    children: <Widget>[
                      Icon(
                        Icons.star,
                        color: Colors.amber.shade600,
                      ),
                      Text("${tvShow.voteAverage} TMDB"),
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 16.0),
                  child: Text(
                    'Description',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    "${tvShow.overview}",
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16.0, top: 8.0),
                  child: Row(
                    children: [
                      const Text(
                        'First Aired: ',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "${tvShow.firstAirDate}",
                        style: const TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
