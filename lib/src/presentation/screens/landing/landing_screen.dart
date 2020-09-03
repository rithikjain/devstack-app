import 'package:devtalks/src/presentation/widgets/bg_gradient.dart';
import 'package:flutter/material.dart';

class LandingScreen extends StatelessWidget {
  static const routename = "/landing";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          BgGradient(),
        ],
      ),
    );
  }
}
