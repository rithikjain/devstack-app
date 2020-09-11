import 'package:devtalks/src/presentation/screens/auth/auth_screen.dart';
import 'package:devtalks/src/presentation/screens/landing/landing_screen.dart';
import 'package:devtalks/src/presentation/screens/main/base_screen.dart';
import 'package:devtalks/src/presentation/themes/themes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
        AuthScreen.routename: (context) => AuthScreen(),
        BaseScreen.routename: (context) => BaseScreen(),
      },
    );
  }
}
