import 'package:flutter/material.dart';
import 'package:movie_app_flutter/library.dart';

class ScreenTvShow extends StatefulWidget {
  const ScreenTvShow({super.key});

  @override
  State<ScreenTvShow> createState() => _ScreenTvShowState();
}

class _ScreenTvShowState extends State<ScreenTvShow> {
  late Future<TvShowOnTheAir> tvShowOnTheAir;
  TvShowApi tvShowApi = TvShowApi();

  @override
  void initState() {
    super.initState();
    tvShowOnTheAir = tvShowApi.getOnTheAirTVShow();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: EdgeInsets.only(left: 16.0, top: 8.0),
            child: Text(
              'On The Air',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        FutureBuilder<TvShowOnTheAir>(
          future: tvShowOnTheAir,
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(child: Text(snapshot.error.toString()));
            }
            if (snapshot.hasData) {
              List<TvResult> tvShowList = snapshot.data!.results!;
              return Flexible(
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: tvShowList.length,
                  itemBuilder: (context, index) {
                    TvResult tvShow = tvShowList[index];
                    return CardNowShowingTv(
                      tvShow: tvShow,
                      clickable: true,
                    );
                  },
                ),
              );
            }
            return const AnimateNowShowingTvList();
            //return const Center(child: CircularProgressIndicator());
          },
        ),
        const Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: EdgeInsets.only(left: 16.0),
            child: Text(
              'More',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 24.0),
          child: Row(
            children: [
              MoreOptionsCard(
                tag: 'Popular TV Shows',
                onTapCard: () {
                  Navigator.pushNamed(context, AppRoutes.screenTvShowPopular);
                },
              ),
              MoreOptionsCard(
                tag: 'Trending TV Shows',
                onTapCard: () {
                  Navigator.pushNamed(context, AppRoutes.screenTvShowTrending);
                },
              ),
            ],
          ),
        ),
        // Disable Top-Rated TV Show feature - api request takes a while
        // Padding(
        //   padding: const EdgeInsets.all(8.0),
        //   child: Row(
        //     children: [
        //       MoreOptionsCard(
        //         tag: 'Top Rated TV Shows',
        //         onTapCard: () {
        //           Navigator.pushNamed(context, AppRoutes.screenTvShowTopRated);
        //         },
        //       ),
        //     ],
        //   ),
        // ),
      ],
    );
  }
}
