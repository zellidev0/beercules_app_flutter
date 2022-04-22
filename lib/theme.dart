import 'package:flutter/material.dart';

class BeerculesColors {
  static const Color primary = Color.fromARGB(255, 33, 150, 243);//#2196f3
  static const Color primaryButton = Color.fromARGB(255, 33, 168, 243); //#f3e721
  static const Color accent = Color.fromARGB(255,255,211, 66); //

// static const ColorScheme colorscheme = ColorScheme(
//   primary: BeerculesColors.primary,
//   secondary: BeerculesColors.secondary,
//   surface: BeerculesColors.surface,
//   background: BeerculesColors.backgroundBlack,
//   error: BeerculesColors.error,
//   onPrimary: BeerculesColors.onPrimary,
//   onSecondary: BeerculesColors.onSecondary,
//   onSurface: BeerculesColors.onSurface,
//   onBackground: BeerculesColors.onBackground,
//   onError: BeerculesColors.onError,
//   brightness: Brightness.light,
// );
}

class TextStyles {
  static const String _fontFamilyInter = 'Inter';

  static const TextStyle header1 = TextStyle(
    fontSize: 44,
    fontFamily: _fontFamilyInter,
    color: Colors.white,
    fontWeight: FontWeight.w400,
  );
  static const TextStyle header2 = TextStyle(
    fontSize: 28,
    color: Colors.yellow,
    fontWeight: FontWeight.w500,
    fontFamily: _fontFamilyInter,
  );
  static const TextStyle header3 = TextStyle(
    fontSize: 20,
    color: Colors.yellow,
    fontWeight: FontWeight.w500,
    fontFamily: _fontFamilyInter,
  );
  static const TextStyle header4 = TextStyle(
    fontSize: 24,
    color: Colors.white,
    fontWeight: FontWeight.w700,
    fontFamily: _fontFamilyInter,
  );
  static const TextStyle subtitle1 = TextStyle(
    fontSize: 20,
    color: Colors.white,
    fontWeight: FontWeight.w500,
    fontFamily: _fontFamilyInter,
  );
  static const TextStyle subtitle2 = TextStyle(
    fontSize: 18,
    color: Colors.white,
    fontWeight: FontWeight.w400,
    fontFamily: _fontFamilyInter,
  );
  static const TextStyle body1 = TextStyle(
    fontSize: 16,
    color: Colors.white,
    fontWeight: FontWeight.w400,
    fontFamily: _fontFamilyInter,
  );
  static const TextStyle body2 = TextStyle(
    fontSize: 16,
    color: Colors.white,
    fontWeight: FontWeight.w600,
    fontFamily: _fontFamilyInter,
  );
  static const TextStyle body4 = TextStyle(
    fontSize: 12,
    color: Colors.white,
    fontWeight: FontWeight.w400,
    fontFamily: _fontFamilyInter,
  );
  static const TextStyle body5 = TextStyle(
    fontSize: 12,
    color: Colors.white,
    fontWeight: FontWeight.w400,
    fontFamily: _fontFamilyInter,
    fontStyle: FontStyle.italic,
  );
  static const TextStyle body6 = TextStyle(
    fontSize: 12,
    color: Colors.white,
    fontWeight: FontWeight.w700,
    fontFamily: _fontFamilyInter,
  );
  static const TextStyle desktop1 = TextStyle(
    fontSize: 14,
    color: Colors.white,
    fontWeight: FontWeight.w600,
    fontFamily: _fontFamilyInter,
  );
  static const TextStyle desktop2 = TextStyle(
    fontSize: 14,
    color: Colors.white,
    fontWeight: FontWeight.w400,
    fontFamily: _fontFamilyInter,
  );
  static const TextStyle desktop3 = TextStyle(
    fontSize: 14,
    color: Colors.white,
    fontWeight: FontWeight.w400,
    fontFamily: _fontFamilyInter,
    fontStyle: FontStyle.italic,
  );
}
