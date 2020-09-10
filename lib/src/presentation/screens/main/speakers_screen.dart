import 'package:carousel_slider/carousel_slider.dart';
import 'package:devtalks/src/presentation/themes/themes.dart';
import 'package:devtalks/src/presentation/widgets/speaker_card.dart';
import 'package:flutter/material.dart';

class SpeakersScreen extends StatelessWidget {
  final CarouselController _carouselController = CarouselController();

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
              GestureDetector(
                child: Icon(Icons.navigate_before, color: palePink, size: 48),
                onTap: () {
                  _carouselController.previousPage();
                },
              ),
              Expanded(
                child: CarouselSlider(
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
                    height: MediaQuery.of(context).size.height * 4 / 7,
                    viewportFraction: 1,
                    enlargeCenterPage: true,
                    enlargeStrategy: CenterPageEnlargeStrategy.scale,
                  ),
                ),
              ),
              GestureDetector(
                child: Icon(Icons.navigate_next, color: palePink, size: 48),
                onTap: () {
                  _carouselController.nextPage();
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
