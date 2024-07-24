import 'package:anga/controllers/cinema.dart';
import 'package:anga/views/pages/ComingSoons/components/grid_item.dart';
import 'package:anga/views/themes/themes.dart';
import 'package:anga/views/widgets/buttons/simple_button.dart';
import 'package:anga/views/widgets/text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ComingSoonGrid extends StatelessWidget {
  final double width;
  ComingSoonGrid({super.key, required this.width});

  final CinemaController cinemaController = Get.put(CinemaController());

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding:
              EdgeInsets.only(bottom: 20.0, top: width > 800.0 ? 130.0 : 20.0),
          child: SizedBox(
            width: width * .8,
            child: Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 10.0),
                child: CustomText(
                  text: "Films Coming Soon To Anga Cinemas",
                  color: primaryColor(),
                  fontSize: width * .036,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          width: width > 800 ? width * .8 : width * .9,
          child: Column(
            children: [
              ComingSoonItem(),
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
