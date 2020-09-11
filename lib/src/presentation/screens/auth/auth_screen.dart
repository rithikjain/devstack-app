import 'package:devtalks/src/presentation/animations/show_up.dart';
import 'package:devtalks/src/presentation/themes/text_styles.dart';
import 'package:devtalks/src/presentation/widgets/bg_gradient.dart';
import 'package:flutter/material.dart';

class AuthScreen extends StatefulWidget {
  static const routename = "/auth";

  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(),
        elevation: 0,
        centerTitle: true,
        title: Container(
          width: 120,
          child: Image.asset("assets/images/devstack.png"),
        ),
      ),
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
                    height: 50,
                    width: MediaQuery.of(context).size.width * 0.5,
                    child: RaisedButton(
                      onPressed: () {},
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: (!_isLoading)
                          ? Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text('Login with Google'),
                                SizedBox(
                                  width: 20,
                                ),
                                Image.network(
                                  "https://upload.wikimedia.org/wikipedia/commons/thumb/5/53/Google_%22G%22_Logo.svg/1004px-Google_%22G%22_Logo.svg.png",
                                  fit: BoxFit.contain,
                                  height: 24,
                                )
                              ],
                            )
                          : Container(
                              height: 35,
                              width: 35,
                              child: CircularProgressIndicator(),
                            ),
                    ),
                  ),
                  SizedBox(height: 100),
                  RichText(
                    text: TextSpan(
                      text: 'Click here to know about ',
                      style: WhiteText.copyWith(
                        fontSize: 17,
                        decoration: TextDecoration.underline,
                      ),
                      children: [
                        TextSpan(
                          text: 'DevTalks',
                          style: PalePinkText.copyWith(
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ],
                    ),
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
