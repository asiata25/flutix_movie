import 'package:flutix_movie/core/theme/app_pallete.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static final defaultTheme = ThemeData.dark().copyWith(
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      scaffoldBackgroundColor: AppPallete.backgroundColor);
}
