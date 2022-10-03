import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobilesoft_flutter_test/constants.dart';

ThemeData lightThemeData(BuildContext context) {
  return ThemeData.light().copyWith(
    primaryColor: PrimaryColor,
    scaffoldBackgroundColor: ContentColorLightTheme,
    iconTheme: IconThemeData(color: Colors.black),
    textTheme: TextTheme(
      headline1: GoogleFonts.getFont("Atkinson Hyperlegible",
          textStyle:
              TextStyle(fontSize: 24, color: TextLightThemePrimaryColor)),
      bodyText1: GoogleFonts.getFont("Atkinson Hyperlegible",
          textStyle: TextStyle(color: PrimaryColor)),
    ),
    colorScheme: ColorScheme.light(
      primary: PrimaryColor,
      secondary: SecondaryColor,
      error: ErrorColor,
    ),
    buttonTheme: ButtonThemeData(
        colorScheme: ColorScheme.light().copyWith(
      primary: PrimaryColor,
      secondary: SecondaryColor,
      error: ErrorColor,
    )),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: ContentColorLightTheme,
      selectedItemColor: ContentColorLightTheme.withOpacity(0.8),
      unselectedItemColor: Colors.white,
      selectedIconTheme: IconThemeData(color: PrimaryColor),
      showUnselectedLabels: true,
    ),
  );
}
