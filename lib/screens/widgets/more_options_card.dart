import 'package:flutter/material.dart';

class MoreOptionsCard extends StatelessWidget {
  const MoreOptionsCard({
    required this.tag,
    required this.onTapCard,
    super.key,
  });

  final String tag;
  final void Function()? onTapCard;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTapCard,
      child: Card(
        elevation: 14.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            tag,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
      ),
    );
  }
}
