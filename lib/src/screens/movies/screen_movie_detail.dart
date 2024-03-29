import 'package:flutter/material.dart';
import 'package:movie_app_flutter/library.dart';

class ScreenMovieDetail extends StatelessWidget {
  const ScreenMovieDetail({super.key});

  @override
  Widget build(BuildContext context) {
    final movie = ModalRoute.of(context)!.settings.arguments as Result;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Movie',
          overflow: TextOverflow.ellipsis,
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(
          parent: AlwaysScrollableScrollPhysics(),
        ),
        child: Padding(
          padding: const EdgeInsets.only(
            left: 16.0,
            right: 16.0,
            top: 8.0,
            bottom: 8.0,
          ),
          child: Column(
            children: [
              Material(
                elevation: 18.0,
                child: FadeInImage.assetNetwork(
                  width: 0.85 * screenWidth,
                  height: 1.4 * screenWidth,
                  placeholder: 'assets/loading_image.gif',
                  image: "$movieBaseUrlImage${movie.posterPath}",
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 16.0,
                  left: 8.0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Text(
                        "${movie.title}",
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
                          EntityMovie entityMovie =
                              await movie.convertToDatabaseModel();
                          HiveDatabase().addMovieToDatabase(entityMovie);
                          // if (!context.mounted) return;
                          // ScaffoldMessenger.of(context).showSnackBar(
                          //   const SnackBar(
                          //     padding: EdgeInsets.all(8.0),
                          //     backgroundColor: Colors.black54,
                          //     content: Text('Item has been bookmarked'),
                          //   ),
                          // );
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
                    Text("${movie.voteAverage} TMDB"),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 16.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Description',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  "${movie.overview}",
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
                      'Release Date: ',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "${movie.releaseDate}",
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
