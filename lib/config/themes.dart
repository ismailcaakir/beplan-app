import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class ThemeConfig {
  static ThemeData lightTheme = ThemeData.light().copyWith(
    appBarTheme: AppBarTheme(
      color: Colors.white,
      centerTitle: false,
      shadowColor: Colors.transparent,
      titleTextStyle: GoogleFonts.poppins(
        fontSize: 24,
        color: Colors.black,
        fontWeight: FontWeight.w800,
      ),
      actionsIconTheme: const IconThemeData().copyWith(
        color: Colors.black,
      ),
    ),
    textTheme: GoogleFonts.poppinsTextTheme().copyWith(),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData().copyWith(
      showSelectedLabels: true,
      showUnselectedLabels: true,
      selectedItemColor: Colors.blue[800],
      selectedLabelStyle: const TextStyle(
        fontSize: 14,
      ),
      unselectedLabelStyle: const TextStyle(
        fontSize: 14,
      ),
      type: BottomNavigationBarType.fixed,
      selectedIconTheme: const IconThemeData().copyWith(
        size: 25,
      ),
      unselectedIconTheme: const IconThemeData().copyWith(
        size: 25,
      ),
      enableFeedback: true,
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData().copyWith(
      backgroundColor: Colors.blue[800],
    ),
    scaffoldBackgroundColor: Colors.white,
  );
}
