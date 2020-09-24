import 'package:devtalks/src/presentation/animations/show_up.dart';
import 'package:devtalks/src/presentation/themes/themes.dart';
import 'package:flutter/material.dart';

class ContactScreen extends StatelessWidget {
  final List<String> _icons = [
    "assets/images/web_icon.png",
    "assets/images/instagram_icon.png",
    "assets/images/twitter_icon.png",
    "assets/images/linkedin_icon.png",
    "assets/images/facebook_icon.png",
    "assets/images/github_icon.png",
    "assets/images/medium_icon.png",
    "assets/images/youtube_icon.png",
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 32),
        Container(
          margin: EdgeInsets.symmetric(vertical: 16, horizontal: 32),
          child: Text(
            "Connect with us",
            style: TextStyle(
              color: palePink,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(height: 16),
        ShowUp(
          delay: Duration(milliseconds: 200),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: 32),
                child: Container(
                  margin: EdgeInsets.all(8),
                  width: double.infinity,
                  child: GridView.count(
                    shrinkWrap: true,
                    crossAxisCount: 4,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    physics: BouncingScrollPhysics(),
                    children: List.generate(
                      8,
                      (index) {
                        return Container(
                          margin: EdgeInsets.all(8),
                          child: ClipOval(
                            child: Container(
                              color: Colors.white,
                              padding: EdgeInsets.all(16),
                              child: Image.asset(_icons[index]),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
