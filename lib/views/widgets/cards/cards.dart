import 'package:anga/views/themes/themes.dart';
import 'package:anga/views/widgets/text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animated_button/flutter_animated_button.dart';
import 'package:google_fonts/google_fonts.dart';

class InteractiveCard extends StatelessWidget {
  final double width;
  final double height;
  final Map item;
  final Color borderColor;
  final String usage;
  const InteractiveCard({
    super.key,
    required this.item,
    required this.borderColor,
    required this.usage,
    this.width = 240.0,
    this.height = 325.0,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Column(children: [
        Padding(
          padding: const EdgeInsets.all(6.0),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
              side: BorderSide(color: borderColor, width: 3.0),
            ),
            elevation: 10,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: Column(
                children: [
                  Image.asset(
                    item['image']!,
                    width: width,
                    height: height,
                    fit: BoxFit.cover,
                  ),
                ],
              ),
            ),
          ),
        ),
        ...baseWidget()
      ]),
    );
  }

  baseWidget() {
    if (usage == "Cinema") {
      return [
        Text(
          item['name'],
          style: GoogleFonts.roboto(
              fontSize: 19,
              fontWeight: FontWeight.w500,
              color: primaryForeGround()),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(12.0, 4.0, 0.0, 4.0),
          child: AnimatedButton(
            onPress: () {},
            height: 35,
            width: 125,
            text: 'Book now',
            isReverse: true,
            animatedOn: AnimatedOn.onHover,
            selectedTextColor: darkColor(),
            transitionType: TransitionType.LEFT_TO_RIGHT,
            textStyle: TextStyle(
                color: lightColor(),
                fontSize: 16.0,
                fontWeight: FontWeight.w500),
            backgroundColor: secondaryColor(),
            borderColor: themeColorTransparent(),
            borderWidth: 1.0,
            borderRadius: 20.0,
            selectedBackgroundColor: primaryColor(),
          ),
        )
      ];
    } else if (usage == 'Events') {
      return [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Align(
            alignment: Alignment.topLeft,
            child: Text(
              item['name'],
              style: GoogleFonts.roboto(
                  fontSize: 23,
                  fontWeight: FontWeight.w500,
                  color: secondaryColor()),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Icon(
                Icons.calendar_month,
                color: primaryForeGround(),
                size: 22.0,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: CustomText(
                  text: item['date'],
                  color: primaryForeGround(),
                  fontSize: 17.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Icon(
                Icons.watch_later,
                color: primaryForeGround(),
                size: 22.0,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: CustomText(
                  text: item['time'],
                  color: primaryForeGround(),
                  fontSize: 17.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Icon(
                Icons.location_on,
                color: primaryForeGround(),
                size: 22.0,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: CustomText(
                  text: item['location'],
                  color: primaryForeGround(),
                  fontSize: 17.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
        Align(
          alignment: Alignment.topLeft,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(8.0, 12.0, 0.0, 4.0),
            child: AnimatedButton(
              onPress: () {},
              height: 35,
              width: 110,
              text: 'Book',
              isReverse: true,
              animatedOn: AnimatedOn.onHover,
              selectedTextColor: darkColor(),
              transitionType: TransitionType.LEFT_TO_RIGHT,
              textStyle: TextStyle(
                  color: lightColor(),
                  fontSize: 16.0,
                  fontWeight: FontWeight.w500),
              backgroundColor: secondaryColor(),
              borderColor: themeColorTransparent(),
              borderWidth: 1.0,
              borderRadius: 20.0,
              selectedBackgroundColor: primaryColor(),
            ),
          ),
        )
      ];
    } else if (usage == 'ComingSoon') {
      return [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            item['releases'],
            style: GoogleFonts.roboto(
                fontSize: 23,
                fontWeight: FontWeight.w500,
                color: primaryForeGround()),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            item['name'],
            style: GoogleFonts.roboto(
                fontSize: 23,
                fontWeight: FontWeight.w500,
                color: primaryForeGround()),
          ),
        ),
      ];
    } else {
      return const SizedBox();
    }
  }
}
