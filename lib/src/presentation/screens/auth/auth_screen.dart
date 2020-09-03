import 'package:devtalks/src/presentation/animations/show_up.dart';
import 'package:devtalks/src/presentation/themes/text_styles.dart';
import 'package:devtalks/src/presentation/themes/themes.dart';
import 'package:devtalks/src/presentation/widgets/bg_gradient.dart';
import 'package:flutter/material.dart';

class AuthScreen extends StatelessWidget {
  static const routename = "/auth";
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _useridController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

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
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(
                            horizontal: 64,
                            vertical: 16,
                          ),
                          child: TextFormField(
                            keyboardType: TextInputType.text,
                            controller: _useridController,
                            decoration: InputDecoration(
                              hintText: 'User ID',
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(
                            horizontal: 64,
                            vertical: 16,
                          ),
                          child: TextFormField(
                            keyboardType: TextInputType.text,
                            controller: _passwordController,
                            decoration: InputDecoration(
                              hintText: 'Password',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 50),
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
                    onPressed: () {},
                    color: palePink,
                  ),
                  SizedBox(height: 50),
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
