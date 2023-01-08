import 'package:movie_app_flutter/library.dart';
import 'package:flutter/material.dart';

class ScreenTvShowTopRated extends StatefulWidget {
  const ScreenTvShowTopRated({super.key});

  @override
  State<ScreenTvShowTopRated> createState() => _ScreenTvShowTopRatedState();
}

class _ScreenTvShowTopRatedState extends State<ScreenTvShowTopRated> {
  late Future<TvShowTopRated> tvShowTopRated;
  TvShowApi tvShowApi = TvShowApi();

  @override
  void initState() {
    super.initState();
    tvShowTopRated = tvShowApi.getTopRatedTVShow();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Top rated TV Shows'),
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder<TvShowTopRated>(
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
                return const Center(child: CircularProgressIndicator());
              },
            ),
          ),
        ],
      ),
    );
  }
}
