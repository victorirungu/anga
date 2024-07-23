import 'package:anga/views/pages/Schedule/components/flim_schedule_widget.dart';
import 'package:anga/views/themes/themes.dart';
import 'package:anga/views/widgets/cards/cards.dart';
import 'package:anga/views/widgets/text.dart';
import 'package:animated_rating_stars/animated_rating_stars.dart';
import 'package:flutter/material.dart';

class FilmSchedules extends StatelessWidget {
  final Map args;
  final double width;
  const FilmSchedules({super.key, required this.args, required this.width});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 12.0),
          child: SizedBox(
            width: width * .8,
            child: Row(
              children: [
                Column(
                  children: [
                    InteractiveCard(
                        item: args,
                        borderColor: primaryForeGround(),
                        height: 420.0,
                        bRadius: 20.0,
                        width: 270.0,
                        usage: 'film_overview',
                        onPressed: () {}),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CustomText(
                        text: 'Diamond | 2D',
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
                                    text: 'TWISTERS | 18+',
                                    color: lightColor(),
                                    fontSize: 25.0,
                                    fontWeight: FontWeight.w700,
                                  ),
                                  CustomText(
                                    text: '125mins | Action',
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
                            child: const FilmScheduleWidget()),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 10.0,
        ),
        Container(
          width: MediaQuery.of(context).size.width * .8,
          color: lightColor(),
          height: .5,
        )
      ],
    );
  }
}
