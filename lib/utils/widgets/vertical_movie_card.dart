import 'package:flutter/material.dart';

class VerticalMovieCard extends StatelessWidget {
  const VerticalMovieCard({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      margin: const EdgeInsets.all(8.0),
      width: 0.5 * screenWidth,
      height: 0.9 * screenWidth,
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 39, 39, 39),
      ),
      child: Column(
        children: [
          const Card(),
          const Flexible(
            child: Text(''),
          ),
          Row(),
        ],
      ),
    );
  }
}
