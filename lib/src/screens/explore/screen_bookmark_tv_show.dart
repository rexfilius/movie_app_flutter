import 'package:flutter/material.dart';
import 'package:movie_app_flutter/library.dart';
import 'package:hive_flutter/hive_flutter.dart';

class ScreenBookmarkTvShow extends StatefulWidget {
  const ScreenBookmarkTvShow({super.key});

  @override
  State<ScreenBookmarkTvShow> createState() => _ScreenBookmarkTvShowState();
}

class _ScreenBookmarkTvShowState extends State<ScreenBookmarkTvShow> {
  final bookmarkedShows = HiveDatabase().getTvShowListFromDatabase();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bookmarked TV Shows'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ValueListenableBuilder(
              valueListenable: HiveDatabase().getTvShowBox().listenable(),
              builder: (context, box, widget) {
                return ListView.builder(
                  itemCount: bookmarkedShows.length,
                  itemBuilder: (context, index) {
                    return CardTvShowEntitySummary(
                      tvShow: bookmarkedShows[index],
                      clickable: false,
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
