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
        const SizedBox(
          height: 100.0,
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
          fontSize: 25.0,
          fontWeight: FontWeight.w900,
        ),
        const SizedBox(
          height: 30.0,
        ),
        SizedBox(
          width: width * .6,
          child: Column(
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Row(children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                        height: 40.0,
                        width: 40.0,
                        child: Card(
                          color:stage == 'seat' ? primaryColor() : primaryForeGround(),
                        )),
                  ),
                  CustomText(
                    text: 'CHOOSE SEAT',
                     color:stage == 'seat' ? primaryColor() : primaryForeGround(),
                    fontWeight: FontWeight.w800,
                    fontSize: 18.0,
                  ),
                ]),
                Row(children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                        height: 40.0,
                        width: 40.0,
                        child: Card(
                          color:stage == 'payment' ? primaryColor() : primaryForeGround(),
                        )),
                  ),
                  CustomText(
                    text: 'PAYMENT',
                     color:stage == 'payment' ? primaryColor() : primaryForeGround(),
                    fontWeight: FontWeight.w800,
                    fontSize: 18.0,
                  ),
                ]),
                Row(children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                        height: 40.0,
                        width: 40.0,
                        child: Card(
                           color:stage == 'ticket' ? primaryColor() : primaryForeGround(),
                        )),
                  ),
                  CustomText(
                    text: 'TICKET',
                     color:stage == 'ticket' ? primaryColor() : primaryForeGround(),
                    fontWeight: FontWeight.w800,
                    fontSize: 18.0,
                  ),
                ]),
              ]),
              Container(
                width: width * .7,
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
