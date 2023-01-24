import 'package:movie_app_flutter/library.dart';
import 'package:flutter/material.dart';

class ScreenTvShowTrending extends StatefulWidget {
  const ScreenTvShowTrending({super.key});

  @override
  State<ScreenTvShowTrending> createState() => _ScreenTvShowTrendingState();
}

class _ScreenTvShowTrendingState extends State<ScreenTvShowTrending> {
  late Future<TvShowTrending> tvShowTrending;
  TvShowApi tvShowApi = TvShowApi();

  @override
  void initState() {
    super.initState();
    tvShowTrending = tvShowApi.getTrendingTVShow();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Trending TV Shows'),
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder<TvShowTrending>(
              future: tvShowTrending,
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Center(child: Text(snapshot.error.toString()));
                }
                if (snapshot.hasData) {
                  List<TvTrendingResult> tvShowList = snapshot.data!.results!;
                  return ListView.builder(
                    itemCount: tvShowList.length,
                    itemBuilder: (context, index) {
                      return CardTvShowTrendingSummary(
                        tvShow: tvShowList[index],
                        clickable: true,
                      );
                    },
                  );
                }
                return const AnimateTvShowTrendingSummaryList();
              },
            ),
          ),
        ],
      ),
    );
  }
}
