import 'package:flutter/material.dart';

ThemeData myTheme() {
  return ThemeData(
    primarySwatch: materialColorFromHex(0xFFFF0000),
    primaryColor: const Color(0xFFFF0000),
  );
}

MaterialColor materialColorFromHex(int hex) {
  final Map<int, Color> swatch = {
    50: Color(hex),
    100: Color(hex),
    200: Color(hex),
    300: Color(hex),
    400: Color(hex),
    500: Color(hex),
    600: Color(hex),
    700: Color(hex),
    800: Color(hex),
    900: Color(hex),
  };
  return MaterialColor(hex, swatch);
}
