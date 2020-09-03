import 'package:devtalks/src/presentation/screens/landing/landing_screen.dart';
import 'package:devtalks/src/presentation/themes/themes.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'DevStack',
      theme: lightTheme,
      home: LandingScreen(),
      routes: {
        LandingScreen.routename: (context) => LandingScreen(),
      },
    );
  }
}
