import 'package:devtalks/src/presentation/animations/show_up.dart';
import 'package:devtalks/src/presentation/screens/main/base_screen.dart';
import 'package:devtalks/src/presentation/themes/text_styles.dart';
import 'package:devtalks/src/presentation/themes/themes.dart';
import 'package:devtalks/src/presentation/widgets/bg_gradient.dart';
import 'package:devtalks/src/utils/shared_prefs.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthScreen extends StatefulWidget {
  static const routename = "/auth";

  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> with WidgetsBindingObserver {
  bool _isGLoading = false;
  bool _isELoading = false;
  String _link;
  String _email;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  void _showErrorSnackBar(BuildContext context, String message) {
    final snackBar = SnackBar(
      content: Text(
        message,
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.red,
    );
    Scaffold.of(context).showSnackBar(snackBar);
  }

  void _showSucessSnackBar(BuildContext context, String message) {
    final snackBar = SnackBar(
      content: Text(
        message,
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.green,
    );
    Scaffold.of(context).showSnackBar(snackBar);
  }

  Future<void> _signInWithGoogle(BuildContext context) async {
    try {
      setState(() {
        _isGLoading = true;
      });
      final GoogleSignInAccount googleSignInAccount =
          await _googleSignIn.signIn();
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );

      final UserCredential authResult =
          await _auth.signInWithCredential(credential);
      final User user = authResult.user;

      if (user != null) {
        final User currentUser = _auth.currentUser;
        print(currentUser.email);
        SharedPrefs.setLoggedInStatus(true);
        Navigator.pushNamedAndRemoveUntil(
          context,
          BaseScreen.routename,
          (route) => false,
        );
        setState(() {
          _isGLoading = false;
        });
      }
    } catch (err) {
      setState(() {
        _isGLoading = false;
      });
      _showErrorSnackBar(context, "Something went wrong!");
    }
  }

  void _showDialog(BuildContext mainContext) {
    showDialog(
      context: mainContext,
      builder: (context) => StatefulBuilder(
        builder: (context, setState) => Dialog(
          child: Container(
            margin: EdgeInsets.all(24),
            child: SingleChildScrollView(
              child: Material(
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 24),
                      Container(
                        child: Text(
                          "Let's get you in!",
                          style: BlueText.copyWith(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(height: 32),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 4),
                        child: TextFormField(
                          controller: _emailController,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            hintText: "Email",
                          ),
                          validator: (value) {
                            Pattern pattern =
                                r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                            RegExp regex = new RegExp(pattern);
                            if (!regex.hasMatch(value)) {
                              return "Please enter a valid email";
                            }
                            return null;
                          },
                        ),
                      ),
                      SizedBox(height: 48),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          OutlineButton(
                            child: Text(
                              "Cancel",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                            highlightedBorderColor: Colors.red,
                            textColor: Colors.red,
                            borderSide: BorderSide(
                              color: Colors.red,
                              width: 1.5,
                            ),
                          ),
                          SizedBox(width: 16),
                          OutlineButton(
                            child: (!_isELoading)
                                ? Text(
                                    "Submit",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  )
                                : Container(
                                    height: 20,
                                    width: 20,
                                    child: CircularProgressIndicator(
                                      valueColor: AlwaysStoppedAnimation<Color>(
                                          Colors.green),
                                    ),
                                  ),
                            onPressed: (!_isELoading)
                                ? () async {
                                    if (_formKey.currentState.validate()) {
                                      setState(() {
                                        _isELoading = true;
                                      });
                                      bool sent =
                                          await _sendSignInWithEmailLink();
                                      setState(() {
                                        _isELoading = false;
                                      });
                                      if (sent) {
                                        Navigator.of(context).pop();
                                        _showEmailSentDialog();
                                        print("sent");
                                      } else {
                                        Navigator.of(context).pop();
                                        _showErrorSnackBar(
                                          mainContext,
                                          "Something went wrong!",
                                        );
                                        print("error");
                                      }
                                    }
                                  }
                                : () {},
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                            textColor: Colors.green,
                            highlightedBorderColor: Colors.green,
                            borderSide: BorderSide(
                              color: Colors.green,
                              width: 1.5,
                            ),
                          ),
                          SizedBox(width: 2),
                        ],
                      ),
                      SizedBox(height: 24),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<bool> _sendSignInWithEmailLink() async {
    final FirebaseAuth user = FirebaseAuth.instance;
    setState(() {
      _email = _emailController.text.trim();
    });
    try {
      await user.sendSignInLinkToEmail(
        email: _emailController.text.trim(),
        actionCodeSettings: ActionCodeSettings(
          url: "https://devtalks.page.link/check",
          dynamicLinkDomain: "devtalks.page.link",
          android: {
            "packageName": "com.dscvit.devtalks",
          },
          handleCodeInApp: true,
        ),
      );
      print(_emailController.text.trim() + "<< sent");
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      _retrieveDynamicLink();
    }
  }

  Future<void> _retrieveDynamicLink() async {
    // final PendingDynamicLinkData data =
    //     await FirebaseDynamicLinks.instance.getInitialLink();

    // final Uri deepLink = data?.link;
    // print(deepLink.toString());

    // if (deepLink.toString() != null) {
    //   _link = deepLink.toString();
    //   _signInWithEmailAndLink();
    // }

    FirebaseDynamicLinks.instance.onLink(
        onSuccess: (PendingDynamicLinkData dynamicLink) async {
      final Uri deepLink = dynamicLink?.link;

      print(deepLink.toString());

      if (deepLink != null) {
        _link = deepLink.toString();
        _signInWithEmailAndLink();
      }
    }, onError: (OnLinkErrorException e) async {
      print('onLinkError');
      print(e.message);
      _showGenDialog(
        "Something went wrong, Maybe the link expired. Try again!",
      );
    });

    return "";
  }

  Future<void> _signInWithEmailAndLink() async {
    final FirebaseAuth user = FirebaseAuth.instance;
    bool validLink = user.isSignInWithEmailLink(_link);
    if (validLink) {
      try {
        await user.signInWithEmailLink(
          email: _email,
          emailLink: _link,
        );
        SharedPrefs.setLoggedInStatus(true);
        Navigator.pushNamedAndRemoveUntil(
          context,
          BaseScreen.routename,
          (route) => false,
        );
        print("logged in");
      } catch (e) {
        print(e);
        _showGenDialog(
          "Something went wrong, Maybe the link expired. Try again!",
        );
      }
    }
  }

  void _showEmailSentDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Email Sent!"),
        content:
            Text("Please check your email for a link to sign into the app."),
        actions: [
          FlatButton(
            child: Text("Okay"),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }

  void _showGenDialog(String error) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Error"),
          content: Text("Please Try Again, Error code: " + error),
          actions: [
            FlatButton(
              child: Text("Close"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Builder(
        builder: (context) => Stack(
          children: [
            BgGradient(),
            Container(
              width: double.infinity,
              height: double.infinity,
              child: SafeArea(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 40),
                    Container(
                      width: 120,
                      child: Image.asset("assets/images/devtalks.png"),
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ShowUp(
                            delay: Duration(milliseconds: 200),
                            child: Container(
                              alignment: Alignment.center,
                              margin: EdgeInsets.symmetric(horizontal: 32),
                              width: 200,
                              child: Image.asset(
                                "assets/images/devtalks_logo.png",
                              ),
                            ),
                          ),
                          SizedBox(
                              height: MediaQuery.of(context).size.height / 6),
                          ShowUp(
                            delay: Duration(milliseconds: 300),
                            child: Container(
                              height: 50,
                              width: MediaQuery.of(context).size.width * 0.6,
                              child: RaisedButton(
                                onPressed: () async {
                                  if (!_isGLoading) {
                                    await _signInWithGoogle(context);
                                  }
                                },
                                color: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: (!_isGLoading)
                                    ? Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          Text('Login with Google'),
                                          SizedBox(
                                            width: 20,
                                          ),
                                          Image.asset(
                                            "assets/images/g_logo.png",
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
                          ),
                          SizedBox(height: 24),
                          ShowUp(
                            delay: Duration(milliseconds: 300),
                            child: Container(
                              height: 50,
                              width: MediaQuery.of(context).size.width * 0.6,
                              child: RaisedButton(
                                onPressed: () async {
                                  _showDialog(context);
                                },
                                color: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text('Login with Email'),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Icon(
                                      Icons.email,
                                      color: darkBlue,
                                      size: 28,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 75),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
