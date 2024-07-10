import 'package:anga/views/themes/themes.dart';
import 'package:anga/views/widgets/buttons/simple_button.dart';
import 'package:anga/views/widgets/cards/cards.dart';
import 'package:anga/views/widgets/text.dart';
import 'package:flutter/material.dart';

class Cinema extends StatelessWidget {
  final double width;
  const Cinema({super.key, required this.width});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> items = [
      {
        'id': '1',
        'name': 'Kraven',
        'image': 'images/homepage1.jpg',
      },
      {
        'id': '2',
        'name': 'Furiosa',
        'image': 'images/homepage2.jpg',
      },
      {
        'id': '3',
        'name': 'Bad Boys',
        'image': 'images/homepage4.jpg',
      },
      {
        'id': '4',
        'name': 'Inside Out 2',
        'image': 'images/homepage55.jpg',
      },
      {
        'id': '5',
        'name': 'Despicable me 4',
        'image': 'images/homepage66.jpeg',
      },
    ];

    int crossAxisCount = 2;
    double screenWidth = width;
    double childAspectRatio = 0.45;
    if (screenWidth > 1100) {
      crossAxisCount = 4;
      childAspectRatio = 0.60;
    } else if (screenWidth > 900) {
      crossAxisCount = 3;
      childAspectRatio = 0.55;
    } else if (screenWidth > 700) {
      crossAxisCount = 3;
      childAspectRatio = 0.48;
    } else if (screenWidth > 600) {
      crossAxisCount = 2;
      childAspectRatio = 0.65;
    } else if (screenWidth > 450) {
      crossAxisCount = 2;
      childAspectRatio = 0.53;
    } else if (screenWidth > 450) {
      crossAxisCount = 2;
      childAspectRatio = 0.53;
    } else if (screenWidth > 520) {
      crossAxisCount = 2;
      childAspectRatio = 0.50;
    } else if (screenWidth > 250) {
      crossAxisCount = 1;
      childAspectRatio = 0.9;
    }
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 30.0, bottom: 10.0),
          child: SizedBox(
            width: width * .80 > 900 ? width * .80 : width * .90,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  color: primaryForeGround(),
                  width: width * .22,
                  height: .4,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 10.0),
                  child: CustomText(
                    text: "Showing This Week",
                    color: primaryForeGround(),
                    fontSize: width * .038,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                Container(
                  color: primaryForeGround(),
                  width: width * .21,
                  height: .4,
                ),
              ],
            ),
          ),
        ),
        width > 600
            ? cinemaPoints()
            : SizedBox(
                width: width * .8,
                child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal, child: cinemaPoints())),
        SizedBox(
          width: width * .8,
          child: Padding(
            padding: const EdgeInsets.only(left: 20.0, bottom: 10.0),
            child: Align(
              alignment: Alignment.topLeft,
              child: CustomText(
                text: 'Showing  In Diamond Plaza Today',
                color: primaryForeGround(),
                fontSize: width * .021 < 14.0 ? 14.0 : width * .021,
                letterSpacing: 1.0,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
        SizedBox(
          width: width * .9,
          child: Column(
            children: [
              GridView.builder(
                shrinkWrap: true,
                itemCount: items.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: childAspectRatio,
                  crossAxisCount: crossAxisCount,
                  crossAxisSpacing: 10.0,
                  mainAxisSpacing: 10.0,
                ),
                itemBuilder: (context, index) {
                  return InteractiveCard(
                    item: items[index],
                    borderColor: secondaryColor(),
                    usage: 'Cinema',
                  );
                },
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
                    bgColor: themeColorGrey(),
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

  Row cinemaPoints() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const SizedBox(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomElevatedButton(
                  bgColor: themeColorGrey(),
                  color: colorBlack(),
                  text: "ANGA DIAMOND",
                  width: width * .22 > 155.0
                      ? 155.0
                      : (width * .22 < 120.0 ? 120.0 : width * .22),
                  height: 35.0,
                  borderRadius: 20.0,
                  onPressed: () {},
                  style: TextStyle(
                      overflow: TextOverflow.ellipsis,
                      color: darkColor(),
                      fontSize: width > 700 ? 16.0 : 12.0,
                      fontWeight: FontWeight.w900),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomElevatedButton(
                  bgColor: primaryColor(),
                  color: colorBlack(),
                  text: "ANGA SKY",
                  width: width * .22 > 155.0 ? 155.0 : width * .22,
                  height: 35.0,
                  borderRadius: 20.0,
                  onPressed: () {},
                  style: TextStyle(
                      color: darkColor(),
                      fontSize: width > 700 ? 16.0 : 13.0,
                      fontWeight: FontWeight.w900),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomElevatedButton(
                  bgColor: primaryColor(),
                  color: colorBlack(),
                  text: "ANGA CBD",
                  width: width * .22 > 155.0 ? 155.0 : width * .22,
                  height: 35.0,
                  borderRadius: 20.0,
                  onPressed: () {},
                  style: TextStyle(
                      color: darkColor(),
                      fontSize: width > 700 ? 16.0 : 13.0,
                      fontWeight: FontWeight.w900),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(),
      ],
    );
  }
}
