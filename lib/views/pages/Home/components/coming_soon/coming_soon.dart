import 'package:anga/views/widgets/buttons/simple_button.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:anga/views/widgets/cards/cards.dart';
import 'package:anga/views/themes/themes.dart';
import 'package:anga/views/widgets/text.dart';
import 'package:flutter/material.dart';

class ComingSoon extends StatelessWidget {
  final double width;
  final List<Map<String, String>> items = [
    {
      'id': '1',
      'name': 'Kraven',
      'image': 'images/homepage1.jpg',
      'releases': 'Mon 29th Jul 2024',
      'time': '05:00 PM',
      'location': 'Anga Diamond'
    },
    {
      'id': '2',
      'name': 'Furiosa',
      'image': 'images/homepage2.jpg',
      'releases': 'Mon 29th Jul 2024',
      'time': '05:00 PM',
      'location': 'Anga Diamond'
    },
    {
      'id': '3',
      'name': 'Bad Boys',
      'image': 'images/homepage4.jpg',
      'releases': 'Mon 29th Jul 2024',
      'time': '05:00 PM',
      'location': 'Anga Diamond'
    },
    {
      'id': '4',
      'name': 'Inside Out 2',
      'image': 'images/homepage55.jpg',
      'releases': 'Mon 29th Jul 2024',
      'time': '12:00 PM',
      'location': 'Anga Diamond'
    },
    {
      'id': '5',
      'name': 'Despicable me 4',
      'image': 'images/homepage66.jpeg',
      'releases': 'Mon 29th Jul 2024',
      'time': '07:00 PM',
      'location': 'Anga Diamond'
    },
  ];
  final CarouselController _carouselController = CarouselController();
  ComingSoon({super.key, required this.width});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 20.0, top: 20.0),
          child: SizedBox(
            width: width * .8,
            child: Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 10.0),
                child: CustomText(
                  text: "Films Coming Soon To Anga Cinemas",
                  color: primaryForeGround(),
                  fontSize: width * .036,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          width: width * .8,
          child: Column(
            children: [
              CarouselSlider(
                items: _buildCarouselItems(),
                options: CarouselOptions(
                  height: 480,
                  aspectRatio: 3.0,
                  viewportFraction: 0.33,
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
      ],
    );
  }

  List<Widget> _buildCarouselItems() {
    return List.generate(items.length, (index) {
      return InteractiveCard(
        item: items[index],
        borderColor: primaryColor(),
        usage: 'ComingSoon',
        height: 350.0,
        width: 275.0,
      );
    });
  }
}
