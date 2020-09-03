import 'package:devtalks/src/presentation/themes/themes.dart';
import 'package:devtalks/src/presentation/widgets/bg_gradient.dart';
import 'package:flutter/material.dart';

class BaseScreen extends StatefulWidget {
  static const routename = "/base";

  @override
  _BaseScreenState createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {
  int _currIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BgGradient(),
      extendBody: true,
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        child: BottomNavigationBar(
          currentIndex: _currIndex,
          type: BottomNavigationBarType.fixed,
          backgroundColor: lightBlue,
          selectedItemColor: palePink,
          unselectedItemColor: Colors.white,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text("Home"),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.mic),
              title: Text("Speakers"),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.code),
              title: Text("QR Code"),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.help),
              title: Text("Questions"),
            ),
          ],
          onTap: (value) {
            setState(() {
              _currIndex = value;
            });
          },
        ),
      ),
    );
  }
}
