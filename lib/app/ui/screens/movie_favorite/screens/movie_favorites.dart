import 'package:flutter/material.dart';
import 'package:movie_app_flutter/movie_app_lib.dart';

class MovieFavoritesScreen extends StatefulWidget {
  const MovieFavoritesScreen({Key? key}) : super(key: key);

  @override
  State<MovieFavoritesScreen> createState() => _MovieFavoritesScreenState();
}

class _MovieFavoritesScreenState extends State<MovieFavoritesScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text('Likes'),
        const SizedBox(height: 8.0),
        Expanded(
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
            itemCount: likes.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(likes[index]),
              );
            },
          ),
        ),
      ],
    );
  }
}

final List<String> likes = [
  'Olympus has fallen',
  'Olympus has fallen',
  'Olympus has fallen',
  'Olympus has fallen',
  'Olympus has fallen',
  'Olympus has fallen',
  'Olympus has fallen',
  'Olympus has fallen',
  'Olympus has fallen',
  'Olympus has fallen',
  'Olympus has fallen',
  'Olympus has fallen',
  'Olympus has fallen',
  'Olympus has fallen',
  'Olympus has fallen',
  'Olympus has fallen',
  'Olympus has fallen',
  'Olympus has fallen',
];
