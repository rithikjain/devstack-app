import 'package:devtalks/src/presentation/themes/themes.dart';
import 'package:devtalks/src/presentation/widgets/speaker_card.dart';
import 'package:flutter/material.dart';

class SpeakersScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              Icon(Icons.navigate_before, color: palePink, size: 64),
              Expanded(
                child: SpeakerCard(),
              ),
              Icon(Icons.navigate_next, color: palePink, size: 64),
            ],
          ),
        ],
      ),
    );
  }
}
