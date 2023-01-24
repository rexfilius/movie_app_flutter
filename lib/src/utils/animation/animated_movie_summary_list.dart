import 'package:flutter/material.dart';
import 'package:movie_app_flutter/library.dart';

class AnimatedMovieSummaryList extends StatelessWidget {
  const AnimatedMovieSummaryList({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double widgetHeight = 0.7 * screenWidth;
    double widgetWidth = 0.95 * screenWidth;
    return ListView.builder(
      itemCount: 12,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return SizedBox(
          width: widgetWidth,
          height: widgetHeight,
          child: AnimatedShimmer(
            height: widgetHeight,
            width: widgetWidth,
          ),
        );
      },
    );
  }
}
