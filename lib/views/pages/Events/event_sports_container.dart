import 'package:anga/views/themes/themes.dart';
import 'package:anga/views/widgets/text.dart';
import 'package:animated_rating_stars/animated_rating_stars.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animated_button/flutter_animated_button.dart';

class EventSportsContainer extends StatelessWidget {
  EventSportsContainer({super.key});
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

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double gridWidth = constraints.maxWidth;
        double aspectRatio = 300 / 540;

        int crossAxisCount = (gridWidth / 300).floor();

        crossAxisCount = (crossAxisCount == 1) ? 2 : crossAxisCount;
        aspectRatio = (crossAxisCount == 2) ? 300 / 540 : aspectRatio;

        double containerWidth = (gridWidth / crossAxisCount) - 10;
        double containerHeight = containerWidth / aspectRatio;
        var rows = (items.length / crossAxisCount).ceil();

        double padding = 30.0;
        return SizedBox(
          height: (rows * containerHeight) + (padding * rows),
          child: Padding(
            padding: const EdgeInsets.all(0.0),
            child: GridView.builder(
              physics: const ScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: crossAxisCount,
                childAspectRatio: aspectRatio,
              ),
              itemCount: items.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Container(
                    color: secondaryColor(),
                    width: containerWidth,
                    height: containerHeight,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 0.0, vertical: 20.0),
                          child: Container(
                            height: containerHeight * 0.55,
                            width: containerWidth * 0.8,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.white, // Border color
                                width: 4.0, // Border width
                              ),
                            ),
                            child: Image.asset(
                              items[index]['image']!,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        CustomText(
                          text: items[index]['name']!,
                          fontSize: 20.0,
                          fontWeight: FontWeight.w700,
                          color: primaryColor(),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 8.0),
                          child: Row(
                            children: [
                              Icon(
                                Icons.calendar_month,
                                color: primaryForeGround(),
                                size: 21.0,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: CustomText(
                                  text: items[index]['releases']!,
                                  color: primaryForeGround(),
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 8.0),
                          child: Row(
                            children: [
                              Icon(
                                Icons.watch_later,
                                color: primaryForeGround(),
                                size: 21.0,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: CustomText(
                                  text: items[index]['time']!,
                                  color: primaryForeGround(),
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 8.0),
                          child: Row(
                            children: [
                              Icon(
                                Icons.location_on,
                                color: primaryForeGround(),
                                size: 21.0,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: CustomText(
                                  text: items[index]['location']!,
                                  color: primaryForeGround(),
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              AnimatedRatingStars(
                                initialRating: 4.5,
                                onChanged: (rating) {
                                  // Handle rating change
                                },
                                displayRatingValue:
                                    true, // Display the rating value
                                interactiveTooltips:
                                    true, // Allow toggling half-star state
                                customFilledIcon: Icons.star,
                                customHalfFilledIcon: Icons.star_half,
                                customEmptyIcon: Icons.star_border,
                                starSize: 15.0,
                                animationDuration:
                                    const Duration(milliseconds: 500),
                                animationCurve: Curves.easeInOut,
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(
                                    8.0, 12.0, 0.0, 4.0),
                                child: AnimatedButton(
                                  onPress: () {},
                                  height: 30,
                                  width: 100,
                                  text: 'Book',
                                  isReverse: true,
                                  animatedOn: AnimatedOn.onHover,
                                  selectedTextColor: darkColor(),
                                  transitionType: TransitionType.LEFT_TO_RIGHT,
                                  textStyle: TextStyle(
                                      color: secondaryColor(),
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w800),
                                  backgroundColor: primaryColor(),
                                  borderColor: themeColorTransparent(),
                                  borderWidth: 1.0,
                                  borderRadius: 20.0,
                                  selectedBackgroundColor: primaryColor(),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
