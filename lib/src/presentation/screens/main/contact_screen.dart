import 'package:devtalks/src/presentation/animations/show_up.dart';
import 'package:devtalks/src/presentation/themes/themes.dart';
import 'package:devtalks/src/utils/contact_info.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactScreen extends StatelessWidget {
  final List<ContactInfo> _contactInfo = [
    ContactInfo(
      "assets/images/web_icon.png",
      "https://dscvit.com/",
    ),
    ContactInfo(
      "assets/images/instagram_icon.png",
      "https://www.instagram.com/dscvitvellore/",
    ),
    ContactInfo(
      "assets/images/twitter_icon.png",
      "https://twitter.com/dscvit",
    ),
    ContactInfo(
      "assets/images/linkedin_icon.png",
      "https://www.linkedin.com/company/dscvit/",
    ),
    ContactInfo(
      "assets/images/facebook_icon.png",
      "https://www.facebook.com/dscvitvellore",
    ),
    ContactInfo(
      "assets/images/github_icon.png",
      "https://github.com/GDGVIT",
    ),
    ContactInfo(
      "assets/images/medium_icon.png",
      "https://medium.com/gdg-vit",
    ),
    ContactInfo(
      "assets/images/youtube_icon.png",
      "https://www.youtube.com/channel/UCvT-ZJF7fXHJi9kDeCPR-zg",
    ),
  ];

  void _makeErrorSnackbar(BuildContext context) {
    final snackBar = SnackBar(
      content: Text(
        'Something went wrong!',
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
                  margin: EdgeInsets.all(0),
                  width: double.infinity,
                  child: GridView.count(
                    shrinkWrap: true,
                    crossAxisCount: 4,
                    crossAxisSpacing: 32,
                    mainAxisSpacing: 16,
                    physics: BouncingScrollPhysics(),
                    children: List.generate(
                      8,
                      (index) {
                        return Container(
                          margin: EdgeInsets.all(8),
                          child: ClipOval(
                            child: InkWell(
                              child: Container(
                                color: Colors.white,
                                padding: EdgeInsets.all(12),
                                child: Image.asset(_contactInfo[index].asset),
                              ),
                              onTap: () async {
                                if (await canLaunch(_contactInfo[index].url)) {
                                  await launch(_contactInfo[index].url);
                                } else {
                                  _makeErrorSnackbar(context);
                                }
                              },
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
