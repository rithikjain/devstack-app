import 'package:flutter/material.dart';

const lightBlue = Color(0xFF5454F3);
const darkBlue = Color(0xFF2B0CAB);
const palePink = Color(0xFFFEA1BE);
const lightGrey = Color(0xFFF3F3F3);

final InputDecorationTheme inputTheme = InputDecorationTheme(
  border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(8),
    borderSide: BorderSide.none,
  ),
  fillColor: lightGrey,
  filled: true,
  hintStyle: TextStyle(
    color: Colors.grey,
    fontFamily: 'Metropolis',
  ),
);

final pageTransition = PageTransitionsTheme(
  builders: {
    TargetPlatform.android: ZoomPageTransitionsBuilder(),
  },
);

// cicular border radius with value 12
final borderRadius12 = BorderRadius.circular(12);

final ThemeData lightTheme = ThemeData(
  fontFamily: 'Metropolis',
  accentColor: palePink,
  primaryColor: lightBlue,
  primaryColorDark: darkBlue,
  cardColor: lightGrey,
  applyElevationOverlayColor: true,
  brightness: Brightness.light,
  pageTransitionsTheme: pageTransition,
  inputDecorationTheme: inputTheme,
);
