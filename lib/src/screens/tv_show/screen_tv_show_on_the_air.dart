import 'package:movie_app_flutter/library.dart';
import 'package:flutter/material.dart';

class ScreenTvShowOnTheAir extends StatefulWidget {
  const ScreenTvShowOnTheAir({super.key});

  @override
  State<ScreenTvShowOnTheAir> createState() => _ScreenTvShowOnTheAirState();
}

class _ScreenTvShowOnTheAirState extends State<ScreenTvShowOnTheAir> {
  late Future<TvShowOnTheAir> tvShowOnAir;
  TvShowApi tvShowApi = TvShowApi();

  @override
  void initState() {
    super.initState();
    tvShowOnAir = tvShowApi.getOnTheAirTVShow();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TV Shows On Air'),
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder<TvShowOnTheAir>(
              future: tvShowOnAir,
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Center(child: Text(snapshot.error.toString()));
                }
                if (snapshot.hasData) {
                  List<TvResult> tvShowList = snapshot.data!.results!;
                  return ListView.builder(
                    itemCount: tvShowList.length,
                    itemBuilder: (context, index) {
                      return CardTvShowSummary(
                        tvShow: tvShowList[index],
                        clickable: true,
                      );
                    },
                  );
                }
                return const AnimateTvShowSummaryList();
              },
            ),
          )
        ],
      ),
    );
  }
}
