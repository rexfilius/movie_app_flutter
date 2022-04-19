import 'package:flutter/material.dart';
import 'package:movie_app_flutter/movie_app_lib.dart';

class DeleteMovie extends StatelessWidget {
  const DeleteMovie({
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
          HiveDatabase().removeFromFavorites(movie);
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text('${result.title} removed from favorites'),
          ));
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                '${result.title} already removed from favorites',
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
}
