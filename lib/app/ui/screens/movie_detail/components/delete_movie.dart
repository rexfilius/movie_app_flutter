import 'package:flutter/material.dart';
import 'package:movie_app_flutter/movie_app_lib.dart';

class DeleteMovie extends StatefulWidget {
  const DeleteMovie({
    required this.result,
    Key? key,
  }) : super(key: key);

  final Result result;

  @override
  State<DeleteMovie> createState() => _DeleteMovieState();
}

class _DeleteMovieState extends State<DeleteMovie> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Movie>(
      future: convertJsonResultToMovie(widget.result),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return IconButton(
            onPressed: () {
              if (HiveDatabase().isMovieInDatabase(snapshot.data!)) {
                HiveDatabase().removeFromFavorites(snapshot.data!);
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content:
                      Text('${widget.result.title} removed from favorites'),
                ));
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      '${widget.result.title} already removed from favorites',
                    ),
                  ),
                );
              }
            },
            icon: const Icon(
              Icons.delete,
              color: AppColors.white,
            ),
          );
        }
        return const Icon(Icons.http);
      },
    );
  }
}
