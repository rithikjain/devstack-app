import 'package:devtalks/src/presentation/themes/themes.dart';
import 'package:devtalks/src/presentation/widgets/timeline_card.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Column(
        children: [
          SizedBox(height: 32),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Timeline:  ",
                  style: TextStyle(
                    color: palePink,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "6th October",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    decoration: TextDecoration.underline,
                    decorationThickness: 4,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) => TimelineCard(),
              itemCount: 5,
            ),
          ),
        ],
      ),
    );
  }
}
