import 'package:movie_app_flutter/library.dart';
import 'package:flutter/material.dart';

class ScreenTvShowPopular extends StatefulWidget {
  const ScreenTvShowPopular({super.key});

  @override
  State<ScreenTvShowPopular> createState() => _ScreenTvShowPopularState();
}

class _ScreenTvShowPopularState extends State<ScreenTvShowPopular> {
  late Future<TvShowPopular> tvShowPopular;
  TvShowApi tvShowApi = TvShowApi();

  @override
  void initState() {
    super.initState();
    tvShowPopular = tvShowApi.getPopularTVShow();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Popular TV Shows'),
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder<TvShowPopular>(
              future: tvShowPopular,
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
