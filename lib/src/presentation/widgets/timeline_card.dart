import 'package:devtalks/src/presentation/themes/themes.dart';
import 'package:flutter/material.dart';

class TimelineCard extends StatelessWidget {
  final String talkName;
  final String timings;

  TimelineCard({this.talkName, this.timings});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 32, vertical: 8),
      height: 80,
      child: ListTile(
        leading: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.mic,
              color: darkBlue,
              size: 32,
            ),
          ],
        ),
        title: Text(
          "Introduction",
          style: TextStyle(
            color: darkBlue,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        subtitle: Text(
          "9:00AM - 10:00AM",
          style: TextStyle(
            color: darkBlue,
            fontSize: 14,
          ),
        ),
      ),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(16),
      ),
    );
  }
}
