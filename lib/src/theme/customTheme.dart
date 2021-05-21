//this class is for custom themeing
import 'package:flutter/material.dart';

class CustomTheme {
  static ThemeData get darkTheme {
    return ThemeData.dark().copyWith();
  }

  static ThemeData get lightTheme {
    return ThemeData.light().copyWith(
      scaffoldBackgroundColor: Colors.white,
      accentColor: Color(0xFF44D9E6),
      primaryColor: Color(0xFF44D9E6),
    );
  }
}
