import 'package:flutter/material.dart';
import 'package:movie_app_flutter/movie_app_lib.dart';
import 'package:google_fonts/google_fonts.dart';

class AppStyles {
  static TextStyle movieListHeader = GoogleFonts.raleway(
    fontWeight: FontWeight.w700,
    fontSize: 20,
    color: AppColors.white,
  );

  static TextStyle movieTitleText = GoogleFonts.raleway(
    fontWeight: FontWeight.bold,
    color: AppColors.white,
  );

  static const TextStyle movieTitleText2 = TextStyle(
    color: AppColors.white,
    fontSize: 16,
  );

  static TextStyle upcomingMovieTitleText = GoogleFonts.openSans(
    color: AppColors.white,
    fontSize: 24,
    fontWeight: FontWeight.bold,
  );
}
