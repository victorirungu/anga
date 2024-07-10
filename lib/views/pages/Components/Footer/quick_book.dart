import 'package:anga/views/themes/themes.dart';
import 'package:anga/views/widgets/buttons/dropdown_button.dart';
import 'package:anga/views/widgets/buttons/simple_button.dart';
import 'package:anga/views/widgets/text.dart';
import 'package:flutter/material.dart';

class QuickBook extends StatelessWidget {
  final double width;
  const QuickBook({super.key, required this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: lightColor().withOpacity(.1),
      width: width,
      height: 80.0,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: width * .2,
            height: 80.0,
            color: secondaryColor(),
            child: Center(
              child: CustomText(
                text: "QUICK BOOK",
                color: primaryForeGround(),
                fontSize: 32.0,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 12.0),
                  child: CustomText(
                    text: "VENUE",
                    color: primaryForeGround(),
                    fontSize: 13.0,
                  ),
                ),
                CustomDropdown(
                  defaultTitle: "Choose A Venue",
                  options: const ['Anga Diamond', 'Anga Sky', 'Anga CBD'],
                  width: width * .147,
                  customSuffix: Icon(
                    Icons.keyboard_arrow_down,
                    size: 12.0,
                    color: primaryForeGround(),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 12.0),
                  child: CustomText(
                    text: "FILM OR EVENT",
                    color: primaryForeGround(),
                    fontSize: 13.0,
                  ),
                ),
                CustomDropdown(
                  defaultTitle: "Choose A Film or Event",
                  options: const ['Anga Diamond', 'Anga Sky', 'Anga CBD'],
                  width: width * .147,
                  customSuffix: Icon(
                    Icons.keyboard_arrow_down,
                    size: 12.0,
                    color: primaryForeGround(),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 12.0),
                  child: CustomText(
                    text: "DATE",
                    color: primaryForeGround(),
                    fontSize: 13.0,
                  ),
                ),
                CustomDropdown(
                  defaultTitle: "Choose A Date",
                  options: const ['Anga Diamond', 'Anga Sky', 'Anga CBD'],
                  width: width * .147,
                  customSuffix: Icon(
                    Icons.keyboard_arrow_down,
                    size: 12.0,
                    color: primaryForeGround(),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 12.0),
                  child: CustomText(
                    text: "TIME",
                    color: primaryForeGround(),
                    fontSize: 13.0,
                  ),
                ),
                CustomDropdown(
                  defaultTitle: "Choose Time",
                  options: const ['Anga Diamond', 'Anga Sky', 'Anga CBD'],
                  width: width * .147,
                  customSuffix: Icon(
                    Icons.keyboard_arrow_down,
                    size: 12.0,
                    color: primaryForeGround(),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 50.0),
            child: CustomElevatedButton(
                onPressed: () {},
                text: "SEARCH",
                width: width * .0735,
                bgColor: primaryColor(),
                borderRadius: 4.0,
                color: primaryColor(),
                style: TextStyle(
                    color: darkColor(),
                    fontSize: 18.0,
                    fontWeight: FontWeight.w900),
                height: 35.0),
          ),
        ],
      ),
    );
  }
}
