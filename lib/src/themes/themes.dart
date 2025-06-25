import 'package:flutter/material.dart';
import 'package:weather_app/src/themes/text_theme.dart';

class TAppTheme {
  TAppTheme._();

  static ThemeData lightTheme = ThemeData(
    colorScheme: ColorScheme.fromSwatch().copyWith(
      primary: Colors.black38,
      secondary: Color.fromARGB(255, 245, 245, 245),
    ),
    brightness: Brightness.light,
    textTheme: TTextTheme.lightTextTheme,
    appBarTheme: AppBarTheme(),
    scaffoldBackgroundColor: Color.fromARGB(255, 245, 245, 245),
    /* listTileTheme: ListTileThemeData(
      titleTextStyle: TTextTheme.lightTextTheme.headlineLarge,
      subtitleTextStyle: TTextTheme.lightTextTheme.headlineSmall,
    ), */
  );

  static ThemeData darkTheme = ThemeData(
    colorScheme: ColorScheme.fromSwatch().copyWith(
      primary: Colors.white70,
      secondary: Color.fromARGB(255, 20, 20, 20),
      brightness: Brightness.dark,
    ),
    textTheme: TTextTheme.darkTextTheme,
    scaffoldBackgroundColor: Color.fromARGB(255, 5, 5, 5),
  );
}
