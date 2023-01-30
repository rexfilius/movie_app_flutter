import 'package:flutter/material.dart';

class CardExplore extends StatelessWidget {
  const CardExplore({
    required this.title,
    required this.onPressed,
    super.key,
  });

  final String title;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        color: Colors.white,
        elevation: 12.0,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                ),
              ),
              IconButton(
                onPressed: onPressed,
                icon: const Icon(Icons.navigate_next_sharp),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
