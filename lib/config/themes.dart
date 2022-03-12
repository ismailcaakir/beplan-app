import 'package:beplan/config/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class ThemeConfig {
  static ThemeData lightTheme = ThemeData.light().copyWith(
    appBarTheme: AppBarTheme(
      color: Colors.white,
      centerTitle: false,
      shadowColor: Colors.transparent,
      iconTheme: const IconThemeData().copyWith(
        color: Colors.black,
      ),
      titleTextStyle: GoogleFonts.poppins(
        fontSize: 24,
        color: Colors.black,
        fontWeight: FontWeight.w800,
      ),
      actionsIconTheme: const IconThemeData().copyWith(
        color: Colors.black,
      ),
    ),
    textTheme: GoogleFonts.poppinsTextTheme().copyWith(
      headline5: GoogleFonts.poppinsTextTheme()
          .headline5
          ?.copyWith(fontWeight: FontWeight.w800),
    ),
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
    floatingActionButtonTheme: const FloatingActionButtonThemeData().copyWith(
      backgroundColor: Colors.blue[800],
    ),
    scaffoldBackgroundColor: Colors.white,
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        backgroundColor: AppColors.blue,
        textStyle: TextStyle(
          color: AppColors.white,
          fontWeight: FontWeight.w800,
          decorationStyle: TextDecorationStyle.dashed,
          fontSize: 20,
        ),
        primary: AppColors.white,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        textStyle: TextStyle(
          color: AppColors.white,
          fontWeight: FontWeight.w800,
          decorationStyle: TextDecorationStyle.dashed,
          fontSize: 20,
        ),
        primary: AppColors.blue,
        padding: EdgeInsets.all(20),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(66),
          side: BorderSide(
            color: AppColors.transparent,
            width: 0.6,
          ),
        ),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.textFieldGrey,
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.textFieldGrey, width: 5.0),
        borderRadius: const BorderRadius.all(
          Radius.circular(7),
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.textFieldGrey, width: 5.0),
        borderRadius: const BorderRadius.all(
          Radius.circular(7),
        ),
      ),
    ),
    buttonTheme: const ButtonThemeData(),
  );
}
