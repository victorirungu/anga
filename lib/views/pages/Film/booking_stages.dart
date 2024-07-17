import 'package:anga/views/functions/resolution.dart';
import 'package:anga/views/themes/themes.dart';
import 'package:anga/views/widgets/text.dart';
import 'package:flutter/material.dart';

class BookingStages extends StatelessWidget {
  const BookingStages({super.key});

  @override
  Widget build(BuildContext context) {
    Map resolution = getResolution(context);
    double width = resolution['width'];
    return SizedBox(
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
                      color: primaryColor(),
                    )),
              ),
              CustomText(
                text: 'CHOOSE SEAT',
                color: primaryColor(),
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
                      color: primaryForeGround(),
                    )),
              ),
              CustomText(
                text: 'PAYMENT',
                color: primaryForeGround(),
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
                      color: primaryForeGround(),
                    )),
              ),
              CustomText(
                text: 'TICKET',
                color: primaryForeGround(),
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
    );
  }
}
