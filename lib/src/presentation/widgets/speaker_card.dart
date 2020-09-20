import 'package:devtalks/src/presentation/themes/text_styles.dart';
import 'package:devtalks/src/presentation/themes/themes.dart';
import 'package:flutter/material.dart';

class SpeakerCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: ClipRRect(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 16),
                height: 100,
                child: ClipOval(
                  child: Image.asset("assets/images/Profile4.png"),
                ),
              ),
              SizedBox(height: 8),
              Text(
                "Rithik Jain",
                style: BlackHeadingText,
              ),
              SizedBox(height: 8),
              Text(
                "Developer",
                style: BlueText,
              ),
              SizedBox(height: 12),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 32),
                child: Text(
                  "An enthusiastic web developer, who started her career at the age of 16. Now working at Philips, India.",
                  style: TextStyle(fontSize: 16),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.location_on, color: lightBlue),
                  SizedBox(width: 4),
                  Text("Technology Tower", style: BlueText),
                ],
              ),
              SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.alternate_email, color: lightBlue),
                  SizedBox(width: 4),
                  Text("email@gmail.com", style: BlueText),
                ],
              ),
            ],
          ),
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
    );
  }
}
