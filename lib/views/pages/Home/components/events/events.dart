import 'package:anga/views/widgets/buttons/simple_button.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:anga/views/widgets/cards/cards.dart';
import 'package:anga/views/themes/themes.dart';
import 'package:anga/views/widgets/text.dart';
import 'package:flutter/material.dart';

class Events extends StatelessWidget {
  final double width;
  final List<Map<String, String>> items = [
    {
      'id': '1',
      'name': 'Kraven',
      'image': 'images/homepage1.jpg',
      'date': 'Mon 29th Jul 2024',
      'time': '05:00 PM',
      'location': 'Anga Diamond'
    },
    {
      'id': '2',
      'name': 'Furiosa',
      'image': 'images/homepage2.jpg',
      'date': 'Mon 29th Jul 2024',
      'time': '05:00 PM',
      'location': 'Anga Diamond'
    },
    {
      'id': '3',
      'name': 'Bad Boys',
      'image': 'images/homepage4.jpg',
      'date': 'Mon 29th Jul 2024',
      'time': '05:00 PM',
      'location': 'Anga Diamond'
    },
    {
      'id': '4',
      'name': 'Inside Out 2',
      'image': 'images/homepage55.jpg',
      'date': 'Mon 29th Jul 2024',
      'time': '12:00 PM',
      'location': 'Anga Diamond'
    },
    {
      'id': '5',
      'name': 'Despicable me 4',
      'image': 'images/homepage66.jpeg',
      'date': 'Mon 29th Jul 2024',
      'time': '07:00 PM',
      'location': 'Anga Diamond'
    },
  ];
  final CarouselController _carouselController = CarouselController();
  Events({super.key, required this.width});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
          child: SizedBox(
            width: width * .8,
            child: Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 10.0),
                child: CustomText(
                  text: "Events",
                  color: primaryForeGround(),
                  fontSize: width * .038,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(
                top: 100.0,
                left: width * .020,
              ),
              child: IconButton(
                  iconSize: width * .035,
                  onPressed: () => _carouselController.previousPage(),
                  icon: Padding(
                    padding: const EdgeInsets.only(left: 15.0),
                    child: Icon(
                      Icons.arrow_back_ios,
                      color: themeColorGrey().withOpacity(.65),
                    ),
                  )),
            ),
            SizedBox(
              width: width > 700 ? width * .8 : width * .78,
              child: Column(
                children: [
                  CarouselSlider(
                    items: _buildCarouselItems(),
                    options: CarouselOptions(
                      height: 555.0,
                      aspectRatio: (width / 350.0).truncateToDouble(),
                      viewportFraction:
                          1 / ((width / 350.0).truncateToDouble()),
                      enableInfiniteScroll: true,
                      autoPlay: true,
                      autoPlayInterval: const Duration(seconds: 5),
                    ),
                    carouselController: _carouselController,
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CustomElevatedButton(
                        text: 'View All',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0,
                          color: colorBlack(),
                        ),
                        width: 120.0,
                        height: 35.0,
                        onPressed: () {},
                        bgColor: themeColorGrey().withOpacity(.65),
                        borderRadius: 20.0,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Container(
                      color: themeColorGrey(),
                      height: .8,
                      width: width * .8,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: 100.0,
                right: width * .020,
              ),
              child: IconButton(
                  iconSize: width * .035,
                  onPressed: () => _carouselController.nextPage(),
                  icon: Icon(
                    Icons.arrow_forward_ios,
                    color: themeColorGrey(),
                  )),
            ),
          ],
        ),
      ],
    );
  }

  List<Widget> _buildCarouselItems() {
    return List.generate(items.length, (index) {
      double prefWidth = (index * 15) + 250.0;
      return InteractiveCard(
        item: items[index],
        borderColor: lightColor(),
        usage: 'Events',
        height: 290.0,
        width: prefWidth > 280.0 ? 280.0 : prefWidth,
      );
    });
  }
}
