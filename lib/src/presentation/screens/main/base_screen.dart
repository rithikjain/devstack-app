import 'package:devtalks/src/presentation/screens/main/contact_screen.dart';
import 'package:devtalks/src/presentation/screens/main/home_screen.dart';
import 'package:devtalks/src/presentation/screens/main/notification_screen.dart';
import 'package:devtalks/src/presentation/screens/main/profile_page.dart';
import 'package:devtalks/src/presentation/screens/main/questions_screen.dart';
import 'package:devtalks/src/presentation/screens/main/speakers_screen.dart';
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

  List<Widget> screens = [
    HomeScreen(),
    SpeakersScreen(),
    QuestionsScreen(),
    ProfilePage(),
    ContactScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          BgGradient(),
          SafeArea(
            child: Column(
              children: [
                SizedBox(height: 40),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 32),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(child: Container()),
                      Hero(
                        tag: "logo",
                        child: Material(
                          color: Colors.transparent,
                          child: Container(
                            width: 120,
                            child: Image.asset("assets/images/devtalks.png"),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: ClipOval(
                            child: Container(
                              height: 25,
                              width: 25,
                              child: Material(
                                color: Colors.transparent,
                                child: InkWell(
                                  splashColor: palePink,
                                  onTap: () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            NotificationScreen(),
                                      ),
                                    );
                                  },
                                  child: Icon(Icons.notifications,
                                      color: palePink),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(child: screens[_currIndex]),
              ],
            ),
          ),
        ],
      ),
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
              icon: Icon(Icons.help),
              title: Text("Questions"),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              title: Text("Profile"),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.info),
              title: Text("Contact"),
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
