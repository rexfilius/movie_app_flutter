import 'package:flutter/material.dart';
import 'package:movie_app_flutter/movie_app_lib.dart';

class SaveMovie extends StatefulWidget {
  const SaveMovie({
    required this.result,
    Key? key,
  }) : super(key: key);

  final Result result;

  @override
  State<SaveMovie> createState() => _SaveMovieState();
}

class _SaveMovieState extends State<SaveMovie> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Movie>(
      future: convertJsonResultToMovie(widget.result),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return IconButton(
            onPressed: () {
              if (HiveDatabase().isMovieInDatabase(snapshot.data!)) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text('${widget.result.title} already added'),
                ));
              } else {
                HiveDatabase().addToFavorites(snapshot.data!);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      '${widget.result.title} added to favorites',
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
    );
  }
}
