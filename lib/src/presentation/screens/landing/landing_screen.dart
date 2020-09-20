import 'package:devtalks/src/presentation/screens/auth/auth_screen.dart';
import 'package:devtalks/src/presentation/screens/main/base_screen.dart';
import 'package:devtalks/src/presentation/widgets/bg_gradient.dart';
import 'package:devtalks/src/utils/shared_prefs.dart';
import 'package:flutter/material.dart';

class LandingScreen extends StatefulWidget {
  static const routename = "/landing";

  @override
  _LandingScreenState createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  @override
  void initState() {
    super.initState();
    _checkStatus();
  }

  _checkStatus() async {
    bool isLoggedIn = await SharedPrefs.getLoggedInStatus();
    if (isLoggedIn == false || isLoggedIn == null) {
      Future.delayed(Duration(seconds: 2), () {
        Navigator.of(context).popAndPushNamed(AuthScreen.routename);
      });
    } else {
      Future.delayed(Duration(seconds: 2), () {
        Navigator.of(context).popAndPushNamed(BaseScreen.routename);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          BgGradient(),
          Container(
            width: double.infinity,
            height: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Hero(
                  tag: "logo",
                  child: Material(
                    color: Colors.transparent,
                    child: Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.symmetric(horizontal: 32),
                      width: 200,
                      child: Image.asset("assets/images/logowithtext.png"),
                    ),
                  ),
                ),
                SizedBox(height: 25),
                Text(
                  "by",
                  style: TextStyle(color: Colors.white),
                ),
                SizedBox(height: 25),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RichText(
                      text: TextSpan(
                          text: "DSC ",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                          children: [
                            TextSpan(
                              text: "VIT",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                          ]),
                    ),
                  ],
                ),
                SizedBox(height: 80),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
