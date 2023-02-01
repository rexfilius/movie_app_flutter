import 'package:flutter/material.dart';
import 'package:movie_app_flutter/library.dart';

class LoadingText extends StatelessWidget {
  const LoadingText({
    required this.text,
    Key? key,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Text(
        text,
        style: AppStyles.movieTitleText,
      ),
    );
  }
}

class ErrorText extends StatelessWidget {
  const ErrorText({
    required this.text,
    Key? key,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Text(
        text,
        style: AppStyles.movieTitleText,
      ),
    );
  }
}
