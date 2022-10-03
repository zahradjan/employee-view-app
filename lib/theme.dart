import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobilesoft_flutter_test/constants.dart';

ThemeData lightThemeData(BuildContext context) {
  return ThemeData.light().copyWith(
    primaryColor: PrimaryColor,
    scaffoldBackgroundColor: ContentColorLightTheme,
    iconTheme: const IconThemeData(color: Colors.black),
    textTheme: TextTheme(
      bodyText1: GoogleFonts.getFont("Atkinson Hyperlegible",
          textStyle: const TextStyle(color: PrimaryColor)),
    ),
    colorScheme: const ColorScheme.light(
      primary: PrimaryColor,
      secondary: SecondaryColor,
      error: ErrorColor,
    ),
    buttonTheme: ButtonThemeData(
        colorScheme: const ColorScheme.light().copyWith(
      primary: PrimaryColor,
      secondary: SecondaryColor,
      error: ErrorColor,
    )),
  );
}
