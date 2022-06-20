import 'package:clock_ui/contants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// Our light/Primary Theme
ThemeData themeData(BuildContext context) => ThemeData(
      appBarTheme: appBarTheme,
      primaryColor: kPrimaryColor,
      scaffoldBackgroundColor: Colors.white,
      colorScheme: const ColorScheme.light(
        secondary: kSecondaryLightColor,
        // on light theme surface = Colors.white by default
      ),
      backgroundColor: Colors.white,
      iconTheme: const IconThemeData(color: kBodyTextColorLight),
      primaryIconTheme: const IconThemeData(
        color: kPrimaryIconLightColor,
      ),
      textTheme: GoogleFonts.latoTextTheme().copyWith(
        bodyText1: const TextStyle(color: kBodyTextColorLight),
        bodyText2: const TextStyle(color: kBodyTextColorLight),
        headline4: const TextStyle(color: kTitleTextLightColor, fontSize: 32),
        headline1: const TextStyle(color: kTitleTextLightColor, fontSize: 80),
      ),
    );

// Dark Them
ThemeData darkThemeData(BuildContext context) => ThemeData.dark().copyWith(
      primaryColor: kPrimaryColor,
      scaffoldBackgroundColor: const Color(0xFF0D0C0E),
      appBarTheme: appBarTheme,
      colorScheme: const ColorScheme.light(
        secondary: kSecondaryDarkColor,
        surface: kSurfaceDarkColor,
      ),
      backgroundColor: kBackgroundDarkColor,
      iconTheme: const IconThemeData(color: kBodyTextColorDark),
      primaryIconTheme: const IconThemeData(color: kPrimaryIconDarkColor),
      textTheme: GoogleFonts.latoTextTheme().copyWith(
        bodyText1: const TextStyle(color: kBodyTextColorDark),
        bodyText2: const TextStyle(color: kBodyTextColorDark),
        headline4: const TextStyle(color: kTitleTextDarkColor, fontSize: 32),
        headline1: const TextStyle(color: kTitleTextDarkColor, fontSize: 80),
      ),
    );

AppBarTheme appBarTheme =
    const AppBarTheme(color: Colors.transparent, elevation: 0);
