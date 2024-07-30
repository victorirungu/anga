import 'package:anga/controllers/cinema.dart';
import 'package:anga/views/pages/Schedule/components/flim_schedule_widget.dart';
import 'package:anga/views/themes/themes.dart';
import 'package:anga/views/widgets/cards/cards.dart';
import 'package:anga/views/widgets/text.dart';
import 'package:animated_rating_stars/animated_rating_stars.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FilmSchedules extends StatelessWidget {
  final List items;
  final double width;
  FilmSchedules({super.key, required this.items, required this.width});
  final CinemaController cinemaController = Get.put(CinemaController());
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      List filteredItems = cinemaController.getFilteredItems();
      return Column(
        children: filteredItems
            .map((item) => FilmScheduleItem(item: item, width: width))
            .toList(),
      );
    });
  }
}

class FilmScheduleItem extends StatelessWidget {
  final dynamic item;
  final double width;
  const FilmScheduleItem({super.key, required this.item, required this.width});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12.0),
      child: SizedBox(
        width: width * .82,
        child: Column(
          children: [
            Row(
              children: [
                Column(
                  children: [
                    InteractiveCard(
                        item: item,
                        borderColor: primaryForeGround(),
                        height: 420.0,
                        bRadius: 20.0,
                        width: 270.0,
                        usage: 'film_overview',
                        onPressed: () {
                          Get.toNamed(
                            '/show',
                            arguments: {
                              'item': item,
                            },
                          );
                        }),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CustomText(
                        text: '${item['location']} |${item['experience']}',
                        color: lightColor(),
                        fontSize: 30.0,
                        fontWeight: FontWeight.w400,
                      ),
                    )
                  ],
                ),
                SizedBox(
                  width: width * .6,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 42.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomText(
                                    text: '${item['name']} | 18+',
                                    color: lightColor(),
                                    fontSize: 25.0,
                                    fontWeight: FontWeight.w700,
                                  ),
                                  CustomText(
                                    text:
                                        '${item['duration']} | ${item['category']}',
                                    color: lightColor().withOpacity(.65),
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w200,
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 40.0),
                              child: AnimatedRatingStars(
                                initialRating: 4.5,
                                onChanged: (rating) {
                                  // setState(() {
                                  //   _rating = rating;
                                  // });
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
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                            width: width * .6,
                            height: 250.0,
                            child: FilmScheduleWidget(item: item)),
                      ),
                    ],
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: width * .8,
                height: .50,
                color: lightColor().withOpacity(.8),
              ),
            )
          ],
        ),
      ),
    );
  }
}
