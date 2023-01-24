import 'package:flutter/material.dart';
import 'package:movie_app_flutter/library.dart';

class AnimateNowShowingTvList extends StatelessWidget {
  const AnimateNowShowingTvList({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double movieCardWidth = 0.65 * screenWidth;
    double movieCardHeight = 0.9 * screenWidth;
    return Flexible(
      child: ListView.builder(
        itemCount: 5,
        physics: const NeverScrollableScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Shimmer(
              color: Colors.blueGrey,
              child: Container(
                margin: const EdgeInsets.all(8.0),
                padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                width: movieCardWidth,
                height: movieCardHeight,
              ),
            ),
          );
        },
      ),
    );
  }
}
