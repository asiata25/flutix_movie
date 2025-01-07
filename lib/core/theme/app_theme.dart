import 'package:flutix_movie/core/theme/app_pallete.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static _borderStyle([Color color = AppPallete.grey300, double width = 1]) =>
      OutlineInputBorder(
          borderSide: BorderSide(color: color, width: width),
          borderRadius: const BorderRadius.all(Radius.circular(100)));

  static final defaultTheme = ThemeData.dark().copyWith(
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      scaffoldBackgroundColor: AppPallete.backgroundColor,
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
              foregroundColor: WidgetStateProperty.resolveWith((states) {
                if (states.contains(WidgetState.disabled)) {
                  return AppPallete.grey300;
                }
                return Colors.black;
              }),
              textStyle: const WidgetStatePropertyAll(
                  TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
              padding: const WidgetStatePropertyAll(
                  EdgeInsets.symmetric(vertical: 14)),
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              shape: const WidgetStatePropertyAll(RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)))),
              shadowColor: const WidgetStatePropertyAll(Colors.transparent),
              backgroundColor: WidgetStateProperty.resolveWith((states) {
                if (states.contains(WidgetState.disabled)) {
                  return AppPallete.grey200;
                }
                return AppPallete.mainColor;
              }))),
      inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.white,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          enabledBorder: _borderStyle(),
          focusedBorder: _borderStyle(AppPallete.mainColor, 3),
          hintStyle: const TextStyle(color: AppPallete.grey300)),
      textTheme: const TextTheme(
          bodyMedium: TextStyle(fontFamily: "Open Sans"),
          bodyLarge: TextStyle(
            fontFamily: "Open Sans",
            fontSize: 20,
          ),
          titleLarge:
              TextStyle(fontFamily: "Raleway", fontWeight: FontWeight.w500)));
}
