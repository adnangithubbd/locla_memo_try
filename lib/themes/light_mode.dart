import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData lightMode = ThemeData(
    colorScheme: ColorScheme.light(
        background: Colors.grey.shade300,
        primary: Colors.grey.shade200,
        secondary: Colors.grey.shade700,
        inversePrimary: Colors.grey.shade700),
    appBarTheme: AppBarTheme(
        color: Colors.grey.shade200,
        titleTextStyle: GoogleFonts.alatsi(
          color: Colors.black,
        )),
    textTheme: TextTheme(
      bodyLarge: GoogleFonts.aBeeZee(
          textStyle: const TextStyle(
        fontSize: 15.0,
        color: Colors.black,
        fontWeight: FontWeight.w500,
      )),
      bodyMedium: const TextStyle(
        fontSize: 16.0,
        color: Colors.black,
        fontWeight: FontWeight.w400,
      ),
      bodySmall: GoogleFonts.aladin(
          textStyle: const TextStyle(
              fontSize: 14.0, fontWeight: FontWeight.w300, color: Colors.teal)),
    ));
