import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData appTheme = ThemeData(
  useMaterial3: true,
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
    displayLarge: GoogleFonts.aBeeZee(
      fontSize: 20.sp,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
    displayMedium: GoogleFonts.cairo(
      fontSize: 18.sp,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
    displaySmall: GoogleFonts.cairo(
      fontSize: 16.sp,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
    headlineLarge: GoogleFonts.cairo(
      fontSize: 14.sp,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
    headlineMedium: GoogleFonts.cairo(
      fontSize: 12.sp,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
    headlineSmall: GoogleFonts.aBeeZee(
      fontSize: 10.sp,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
  ),
);
