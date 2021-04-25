import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  static const String fontName = 'SF UI Display';

  static const Color background = Color(0xFF23272E);
  static const Color card = Color(0xFF3C3E44);
  static const Color white = Color(0xFFFFFFFF);
  static const Color statusGreen = Color(0xFF00C48C);
  static const Color divider = Color(0xFF3A3D44);

  static const TextStyle appBarTitle = TextStyle( // h4 -> display1
    fontFamily: fontName,
    fontWeight: FontWeight.w600,
    fontSize: 17,
    letterSpacing: 0.2,
    color: white,
  );

  static const TextStyle characterName = TextStyle( // h4 -> display1
    fontFamily: fontName,
    fontWeight: FontWeight.w600,
    fontSize: 17,
    letterSpacing: 0.2,
    color: white,
  );

  static const TextStyle characterLabel = TextStyle( // h4 -> display1
    fontFamily: fontName,
    fontWeight: FontWeight.w600,
    fontSize: 13,
    letterSpacing: 0.2,
    color: white,
  );
}
