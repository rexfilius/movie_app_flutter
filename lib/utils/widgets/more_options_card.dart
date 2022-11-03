import 'package:flutter/material.dart';

class MoreOptionsCard extends StatelessWidget {
  const MoreOptionsCard({required this.tag, super.key});

  final String tag;

  @override
  Widget build(BuildContext context) {
    return Card(
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
    );
  }
}
