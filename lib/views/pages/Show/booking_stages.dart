import 'package:anga/views/functions/resolution.dart';
import 'package:anga/views/themes/themes.dart';
import 'package:anga/views/widgets/text.dart';
import 'package:flutter/material.dart';

class BookingStages extends StatelessWidget {
  final String stage;
  const BookingStages({super.key, required this.stage});

  @override
  Widget build(BuildContext context) {
    Map resolution = getResolution(context);
    double width = resolution['width'];

    return Column(
      children: [
        SizedBox(
          height: width > 800.0 ? 100.0 : 20.0,
        ),
        CustomText(
          text: 'BOOKING',
          color: secondaryColor(),
          fontSize: 60.0,
          fontWeight: FontWeight.w900,
        ),
        const SizedBox(
          height: 20.0,
        ),
        const CustomText(
          text: 'ANGA DIAMOND CINEMA - DREAM HALL',
          color: Color.fromARGB(255, 167, 185, 188),
          fontSize: 24.0,
          fontWeight: FontWeight.w900,
        ),
        const SizedBox(
          height: 30.0,
        ),
        SizedBox(
          width: width > 800.0 ? width * .6 : width * .8,
          child: Column(
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Row(children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                        height: width * .03 > 40.0
                            ? 40.0
                            : width * .03 < 25.0
                                ? 25.0
                                : width * .03,
                        width: width * .03 > 40.0
                            ? 40.0
                            : width * .03 < 25.0
                                ? 25.0
                                : width * .03,
                        child: Card(
                          color: stage == 'seat'
                              ? primaryColor()
                              : primaryForeGround(),
                        )),
                  ),
                  CustomText(
                    text: 'CHOOSE SEAT',
                    color:
                        stage == 'seat' ? primaryColor() : primaryForeGround(),
                    fontWeight: FontWeight.w800,
                    fontSize: width * .015 > 18.0
                        ? 18.0
                        : width * .015 < 14.0
                            ? 14.0
                            : width * .015,
                  ),
                ]),
                Row(children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                        height: width * .03 > 40.0
                            ? 40.0
                            : width * .03 < 25.0
                                ? 25.0
                                : width * .03,
                        width: width * .03 > 40.0
                            ? 40.0
                            : width * .03 < 25.0
                                ? 25.0
                                : width * .03,
                        child: Card(
                          color: stage == 'payment'
                              ? primaryColor()
                              : primaryForeGround(),
                        )),
                  ),
                  CustomText(
                    text: 'PAYMENT',
                    color: stage == 'payment'
                        ? primaryColor()
                        : primaryForeGround(),
                    fontWeight: FontWeight.w800,
                    fontSize: width * .015 > 18.0
                        ? 18.0
                        : width * .015 < 14.0
                            ? 14.0
                            : width * .015,
                  ),
                ]),
                Row(children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                        height: width * .03 > 40.0
                            ? 40.0
                            : width * .03 < 25.0
                                ? 25.0
                                : width * .03,
                        width: width * .03 > 40.0
                            ? 40.0
                            : width * .03 < 25.0
                                ? 25.0
                                : width * .03,
                        child: Card(
                          color: stage == 'ticket'
                              ? primaryColor()
                              : primaryForeGround(),
                        )),
                  ),
                  CustomText(
                    text: 'TICKET',
                    color: stage == 'ticket'
                        ? primaryColor()
                        : primaryForeGround(),
                    fontWeight: FontWeight.w800,
                    fontSize: width * .015 > 18.0
                        ? 18.0
                        : width * .015 < 14.0
                            ? 14.0
                            : width * .015,
                  ),
                ]),
              ]),
              Container(
                width: width > 800.0 ? width * .7 : width * .8,
                height: 1.0,
                color: primaryForeGround(),
              )
            ],
          ),
        ),
        const SizedBox(
          height: 80.0,
        ),
      ],
    );
  }
}
