import 'package:carousel_slider/carousel_slider.dart';
import 'package:devtalks/src/presentation/themes/themes.dart';
import 'package:devtalks/src/presentation/widgets/speaker_card.dart';
import 'package:flutter/material.dart';

class SpeakersScreen extends StatefulWidget {
  @override
  _SpeakersScreenState createState() => _SpeakersScreenState();
}

class _SpeakersScreenState extends State<SpeakersScreen>
    with SingleTickerProviderStateMixin {
  final CarouselController _carouselController = CarouselController();
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 2);
  }

  Widget buildSpeakersUI(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
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
    );
  }

  Widget buildSponsorsUI(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
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
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 16, vertical: 32),
            child: Row(
              children: [
                Expanded(
                  child: TabBar(
                    controller: _tabController,
                    tabs: [
                      Tab(text: 'Speakers'),
                      Tab(text: 'Sponsors'),
                    ],
                    indicatorSize: TabBarIndicatorSize.label,
                    indicatorWeight: 4,
                    labelColor: palePink,
                    unselectedLabelColor: Colors.white54,
                    labelStyle: TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 8),
          Expanded(
            child: Container(
              alignment: Alignment.topCenter,
              child: TabBarView(
                controller: _tabController,
                physics: NeverScrollableScrollPhysics(),
                children: [buildSpeakersUI(context), buildSponsorsUI(context)],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
