import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TTextTheme {
  static const Color _lightColor = Colors.black87;
  static const Color _darkColor = Color.fromARGB(221, 218, 216, 216);

  static final _lightTheme = GoogleFonts.pontanoSansTextTheme().copyWith(
    displayLarge: GoogleFonts.pontanoSans().copyWith(
      fontSize: 96.0,
      fontWeight: FontWeight.w300,
      letterSpacing: -1.5,
      color: _lightColor,
    ),
    displayMedium: GoogleFonts.pontanoSans().copyWith(
      fontSize: 60.0,
      fontWeight: FontWeight.w300,
      letterSpacing: -0.5,
      color: _lightColor,
    ),
    displaySmall: GoogleFonts.pontanoSans().copyWith(
      fontSize: 48.0,
      fontWeight: FontWeight.w400,
      color: _lightColor,
    ),
    headlineLarge: GoogleFonts.pontanoSans().copyWith(
      fontSize: 40.0,
      fontWeight: FontWeight.w500,
      color: _lightColor,
    ),
    headlineMedium: GoogleFonts.pontanoSans().copyWith(
      fontSize: 34.0,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.25,
      color: _lightColor,
    ),
    headlineSmall: GoogleFonts.pontanoSans().copyWith(
      fontSize: 24.0,
      fontWeight: FontWeight.w400,
      color: _lightColor,
    ),
    titleLarge: GoogleFonts.pontanoSans().copyWith(
      fontSize: 20.0,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.15,
      color: _lightColor,
    ),
    titleMedium: GoogleFonts.pontanoSans().copyWith(
      fontSize: 16.0,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.15,
      color: _lightColor,
    ),
    titleSmall: GoogleFonts.pontanoSans().copyWith(
      fontSize: 14.0,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.1,
      color: _lightColor,
    ),
    bodyLarge: GoogleFonts.pontanoSans().copyWith(
      fontSize: 16.0,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.5,
      color: _lightColor,
    ),
    bodyMedium: GoogleFonts.pontanoSans().copyWith(
      fontSize: 14.0,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.25,
      color: _lightColor,
    ),
    labelLarge: GoogleFonts.pontanoSans().copyWith(
      fontSize: 14.0,
      fontWeight: FontWeight.w500,
      letterSpacing: 1.25,
      color: _lightColor,
    ),
    bodySmall: GoogleFonts.pontanoSans().copyWith(
      fontSize: 12.0,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.4,
      color: _lightColor,
    ),
    labelSmall: GoogleFonts.pontanoSans().copyWith(
      fontSize: 10.0,
      fontWeight: FontWeight.w400,
      letterSpacing: 1.5,
      color: _lightColor,
    ),
  );

  static final _darkTheme = GoogleFonts.pontanoSansTextTheme().copyWith(
    displayLarge: GoogleFonts.pontanoSans().copyWith(
      fontSize: 96.0,
      fontWeight: FontWeight.w300,
      letterSpacing: -1.5,
      color: _lightColor,
    ),
    displayMedium: GoogleFonts.pontanoSans().copyWith(
      fontSize: 60.0,
      fontWeight: FontWeight.w300,
      letterSpacing: -0.5,
      color: _darkColor,
    ),
    displaySmall: GoogleFonts.pontanoSans().copyWith(
      fontSize: 48.0,
      fontWeight: FontWeight.w400,
      color: _darkColor,
    ),
    headlineLarge: GoogleFonts.pontanoSans().copyWith(
      fontSize: 40.0,
      fontWeight: FontWeight.w500,
      color: _darkColor,
    ),
    headlineMedium: GoogleFonts.pontanoSans().copyWith(
      fontSize: 34.0,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.25,
      color: _darkColor,
    ),
    headlineSmall: GoogleFonts.pontanoSans().copyWith(
      fontSize: 24.0,
      fontWeight: FontWeight.w400,
      color: _darkColor,
    ),
    titleLarge: GoogleFonts.pontanoSans().copyWith(
      fontSize: 20.0,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.15,
      color: _darkColor,
    ),
    titleMedium: GoogleFonts.pontanoSans().copyWith(
      fontSize: 16.0,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.15,
      color: _darkColor,
    ),
    titleSmall: GoogleFonts.pontanoSans().copyWith(
      fontSize: 14.0,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.1,
      color: _darkColor,
    ),
    bodyLarge: GoogleFonts.pontanoSans().copyWith(
      fontSize: 16.0,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.5,
      color: _darkColor,
    ),
    bodyMedium: GoogleFonts.pontanoSans().copyWith(
      fontSize: 14.0,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.25,
      color: _darkColor,
    ),
    labelLarge: GoogleFonts.pontanoSans().copyWith(
      fontSize: 14.0,
      fontWeight: FontWeight.w500,
      letterSpacing: 1.25,
      color: _darkColor,
    ),
    bodySmall: GoogleFonts.pontanoSans().copyWith(
      fontSize: 12.0,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.4,
      color: _darkColor,
    ),
    labelSmall: GoogleFonts.pontanoSans().copyWith(
      fontSize: 10.0,
      fontWeight: FontWeight.w400,
      letterSpacing: 1.5,
      color: _darkColor,
    ),
  );

  static TextTheme lightTextTheme = _lightTheme;
  static TextTheme darkTextTheme = _darkTheme;
}
