import 'package:devtalks/src/presentation/themes/text_styles.dart';
import 'package:flutter/material.dart';

class SpeakerCard extends StatelessWidget {
  final String speakerName;
  final String speakerPosition;
  final String speakerImage;
  final String speakerDescription;

  SpeakerCard({
    this.speakerName,
    this.speakerPosition,
    this.speakerImage,
    this.speakerDescription,
  });

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
                  child: Image.asset(speakerImage),
                ),
              ),
              SizedBox(height: 8),
              Text(
                speakerName,
                style: BlackHeadingText,
              ),
              SizedBox(height: 4),
              Text(
                speakerPosition,
                style: BlueText.copyWith(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 32),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 32),
                child: Text(
                  speakerDescription,
                  style: TextStyle(fontSize: 16),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 24),
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
