import 'dart:convert';

import 'package:anga/controllers/cinema.dart';
import 'package:anga/views/pages/Home/components/cinema/grid.dart';
import 'package:anga/views/pages/Home/components/cinema/locations.dart';
import 'package:anga/views/themes/themes.dart';
import 'package:anga/views/widgets/buttons/simple_button.dart';
import 'package:anga/views/widgets/text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Cinema extends StatelessWidget {
  final double width;
  Cinema({super.key, required this.width});

  final CinemaController cinemaController = Get.put(CinemaController());

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 30.0, bottom: 10.0),
          child: SizedBox(
            width: width * .80 > 900 ? width * .80 : width * .80,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  color: primaryForeGround(),
                  width: width * .22,
                  height: .4,
                ),
                CustomText(
                  text: "Showing This Week",
                  color: primaryForeGround(),
                  fontSize: width * .037,
                  fontWeight: FontWeight.w800,
                ),
                Expanded(
                  child: Container(
                    color: primaryForeGround(),
                    height: .4,
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(
            width: width * .8,
            child: Locations(width: width, items: cinemaController.locations)),
        SizedBox(
          width: width * .8,
          child: Padding(
            padding: const EdgeInsets.only(left: 20.0, top: 20.0),
            child: Align(
              alignment: Alignment.topLeft,
              child: Obx(() => CustomText(
                    text:
                        'Showing In ${cinemaController.selectedLocationCinema['location']} Today',
                    color: primaryForeGround(),
                    fontSize: width * .021 < 14.0 ? 14.0 : width * .021,
                    letterSpacing: 1.0,
                    fontWeight: FontWeight.w600,
                  )),
            ),
          ),
        ),
        SizedBox(
          width: width * .8,
          child: Column(
            children: [
              Obx(() => CinemaGrid(
                  items: jsonDecode(
                      cinemaController.selectedLocationCinema['cinemas']))),
              Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: const EdgeInsets.only(right: 8.0),
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

  // Row cinemaPoints() {
  //   return Row(
  //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //     children: [
  //       const SizedBox(),
  //       Padding(
  //         padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 15.0),
  //         child: Row(
  //           mainAxisAlignment: MainAxisAlignment.center,
  //           children: [
  //             Padding(
  //               padding: const EdgeInsets.all(8.0),
  //               child: CustomElevatedButton(
  //                 bgColor: themeColorGrey(),
  //                 color: colorBlack(),
  //                 text: "ANGA DIAMOND",
  //                 width: width * .22 > 155.0
  //                     ? 155.0
  //                     : (width * .22 < 120.0 ? 120.0 : width * .22),
  //                 height: 35.0,
  //                 borderRadius: 20.0,
  //                 onPressed: () {},
  //                 style: TextStyle(
  //                     overflow: TextOverflow.ellipsis,
  //                     color: darkColor(),
  //                     fontSize: width > 700 ? 16.0 : 12.0,
  //                     fontWeight: FontWeight.w900),
  //               ),
  //             ),
  //             Padding(
  //               padding: const EdgeInsets.all(8.0),
  //               child: CustomElevatedButton(
  //                 bgColor: primaryColor(),
  //                 color: colorBlack(),
  //                 text: "ANGA SKY",
  //                 width: width * .22 > 155.0 ? 155.0 : width * .22,
  //                 height: 35.0,
  //                 borderRadius: 20.0,
  //                 onPressed: () {},
  //                 style: TextStyle(
  //                     color: darkColor(),
  //                     fontSize: width > 700 ? 16.0 : 13.0,
  //                     fontWeight: FontWeight.w900),
  //               ),
  //             ),
  //             Padding(
  //               padding: const EdgeInsets.all(8.0),
  //               child: CustomElevatedButton(
  //                 bgColor: primaryColor(),
  //                 color: colorBlack(),
  //                 text: "ANGA CBD",
  //                 width: width * .22 > 155.0 ? 155.0 : width * .22,
  //                 height: 35.0,
  //                 borderRadius: 20.0,
  //                 onPressed: () {},
  //                 style: TextStyle(
  //                     color: darkColor(),
  //                     fontSize: width > 700 ? 16.0 : 13.0,
  //                     fontWeight: FontWeight.w900),
  //               ),
  //             ),
  //           ],
  //         ),
  //       ),
  //       const SizedBox(),
  //     ],
  //   );
  }

