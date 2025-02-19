import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData appTheme = ThemeData.dark().copyWith(
  scaffoldBackgroundColor: const Color(0xff081028),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: Color.fromARGB(255, 231, 208, 6),
  ),
  checkboxTheme: CheckboxThemeData(
    fillColor: WidgetStateProperty.all(const Color.fromARGB(255, 231, 208, 6)),
    checkColor: WidgetStateProperty.all(Colors.white),
    side: BorderSide.none,
    visualDensity: const VisualDensity(
      horizontal: -4,
      vertical: -4,
    ),
    materialTapTargetSize: MaterialTapTargetSize.padded,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(4),
    ),
    overlayColor: WidgetStateProperty.all(
      Colors.transparent,
    ),
  ),
  colorScheme: ColorScheme.fromSeed(
    seedColor: const Color.fromARGB(255, 231, 208, 6),
    primary: const Color.fromARGB(255, 231, 208, 6),
    surface: const Color(0xff081028),
    secondary: const Color.fromRGBO(186, 162, 7, 1),
    onPrimary: Colors.white, // Text/icon color on primary
    surfaceContainer: const Color(0xff0b1739),
  ),
  textTheme: TextTheme(
    displayLarge: GoogleFonts.aBeeZee(),
    displayMedium: GoogleFonts.cairo(),
    displaySmall: GoogleFonts.cairo(),
    headlineLarge: GoogleFonts.cairo(),
    headlineMedium: GoogleFonts.cairo(),
    headlineSmall: GoogleFonts.aBeeZee(),
  ),
);
