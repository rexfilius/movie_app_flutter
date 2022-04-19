import 'package:flutter/material.dart';
import 'package:movie_app_flutter/movie_app_lib.dart';

class SaveMovie extends StatelessWidget {
  const SaveMovie({
    required this.result,
    Key? key,
  }) : super(key: key);

  final Result result;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () async {
        final movie = await result.convertToDatabaseModel();
        if (HiveDatabase().isMovieInDatabase(movie)) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text('${result.title} already added'),
          ));
        } else {
          HiveDatabase().addToFavorites(movie);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('${result.title} added to favorites'),
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
}
