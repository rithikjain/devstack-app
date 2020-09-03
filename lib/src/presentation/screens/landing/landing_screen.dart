import 'package:devtalks/src/presentation/animations/show_up.dart';
import 'package:devtalks/src/presentation/screens/auth/auth_screen.dart';
import 'package:devtalks/src/presentation/themes/themes.dart';
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
          Container(
            width: double.infinity,
            height: double.infinity,
            child: ShowUp(
              delay: Duration(milliseconds: 600),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.symmetric(horizontal: 32),
                    width: 200,
                    child: Image.asset("assets/images/logowithtext.png"),
                  ),
                  SizedBox(height: 25),
                  Text(
                    "by",
                    style: TextStyle(color: Colors.white),
                  ),
                  SizedBox(height: 25),
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
                  SizedBox(height: 80),
                  MaterialButton(
                    child: Padding(
                      padding: EdgeInsets.all(18),
                      child: Text(
                        "Let's go!",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: borderRadius12,
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, AuthScreen.routename);
                    },
                    color: palePink,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
