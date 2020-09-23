import 'package:carousel_slider/carousel_slider.dart';
import 'package:devtalks/src/presentation/themes/themes.dart';
import 'package:devtalks/src/presentation/widgets/speaker_card.dart';
import 'package:flutter/material.dart';

class SpeakersScreen extends StatelessWidget {
  final CarouselController _carouselController = CarouselController();

  Widget buildSpeakersUI(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        CarouselSlider(
          carouselController: _carouselController,
          items: [
            SpeakerCard(),
            SpeakerCard(),
            SpeakerCard(),
            SpeakerCard(),
          ],
          options: CarouselOptions(
            autoPlay: false,
            initialPage: 0,
            height: MediaQuery.of(context).size.height * 3 / 6,
            viewportFraction: 0.8,
            enlargeCenterPage: true,
            enlargeStrategy: CenterPageEnlargeStrategy.scale,
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 8),
          alignment: Alignment.centerLeft,
          child: Material(
            shape: CircleBorder(),
            elevation: 16,
            color: lightBlue,
            child: InkWell(
              borderRadius: BorderRadius.circular(50),
              splashColor: darkBlue,
              child: SizedBox(
                width: 48,
                height: 48,
                child: Icon(
                  Icons.navigate_before,
                  color: palePink,
                  size: 48,
                ),
              ),
              onTap: () {
                _carouselController.previousPage();
              },
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 8),
          alignment: Alignment.centerRight,
          child: Material(
            shape: CircleBorder(),
            elevation: 16,
            color: lightBlue,
            child: InkWell(
              borderRadius: BorderRadius.circular(50),
              splashColor: darkBlue,
              child: SizedBox(
                width: 48,
                height: 48,
                child: Icon(
                  Icons.navigate_next,
                  color: palePink,
                  size: 48,
                ),
              ),
              onTap: () {
                _carouselController.nextPage();
              },
            ),
          ),
        ),
      ],
    );
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
            "Speakers",
            style: TextStyle(
              color: palePink,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Expanded(
          child: buildSpeakersUI(context),
        ),
        SizedBox(height: 32),
      ],
    );
  }
}
