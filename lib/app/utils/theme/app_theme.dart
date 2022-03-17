// ignore_for_file: deprecated_member_use
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppTheme {
  /// Cor primária do app
  static const Color primary = Color(0xFF003865);

  /// Cor secundária do app
  static const Color secondary = Color(0xFF32A6E6);

  /// Cores de estado do app
  static const Color error = Color(0xFFF44040);
  static const Color success = Color(0xFF1E9F7F);
  static const Color warning = Color(0xffFBD300);
  static const Color warningTwo = Color(0xffF78344);
  static const Color info = Color(0xFFBECDE2);

  static const Color textColor = Color(0xFF32A6E6);

  static final ThemeData light = ThemeData(
    colorScheme: ThemeData().colorScheme.copyWith(
          secondary: secondary,
          primary: primary,
        ),
    visualDensity: VisualDensity.adaptivePlatformDensity,
    textTheme: const TextTheme(
      subtitle1: TextStyle(
        fontSize: 14,
      ),
      bodyText1: TextStyle(
        fontSize: 14,
        color: primary,
        fontWeight: FontWeight.w400,
      ),
      headline6: TextStyle(
        color: primary,
        fontWeight: FontWeight.w700,
        fontSize: 18,
      ),
    ),
    primaryColor: primary,
    primaryColorLight: primary,
    accentColorBrightness: Brightness.light,
    backgroundColor: primary,
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: primary,
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      splashColor: Colors.transparent,
      foregroundColor: Colors.white,
    ),
    iconTheme: const IconThemeData(color: primary),
    cardTheme: CardTheme(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        elevation: 2),
    checkboxTheme: CheckboxThemeData(
      checkColor: MaterialStateProperty.all(primary),
    ),
    appBarTheme: const AppBarTheme(elevation: 2),
    accentColor: secondary,
    buttonColor: primary,
  );
}
