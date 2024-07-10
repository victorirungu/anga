import 'package:anga/views/pages/Components/Footer/email_subscription.dart';
import 'package:anga/views/pages/Components/Footer/quick_book.dart';
import 'package:anga/views/pages/Components/Footer/social_media.dart';
import 'package:anga/views/themes/themes.dart';
import 'package:anga/views/widgets/text.dart';
import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  final double width;
  final String currentYear = DateTime.now().year.toString();
  Footer({super.key, required this.width});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 50.0, top: 50.0),
          child: Container(
            width: width > 900 ? width * .6 : width * .8,
            height: 220.0,
            decoration: BoxDecoration(
                color: lightColor().withOpacity(.05),
                borderRadius: BorderRadius.circular(20.0)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(15.0, 5.0, 15.0, 5.0),
                    child: CustomText(
                      text: "Subscribe to Anga Cinemas",
                      color: primaryForeGround(),
                      fontSize: width * .02 > 26.0
                          ? 26.0
                          : width * .02 < 18.0
                              ? 18.0
                              : width * .02,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 5.0),
                    child: CustomText(
                      text: "TO GET THE LATEST NEWS AND UPDATES",
                      color: primaryForeGround(),
                      fontSize: width * .021 > 29.0
                          ? 29.0
                          : width * .021 < 17.0
                              ? 17.0
                              : width * .021,
                      fontWeight: FontWeight.w800,
                      letterSpacing: 1.0,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: EmailSubscription(
                    width: width,
                  ),
                ),
              ],
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: SocialMediaIcons(),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 40.0),
          child: CustomText(
            text:
                "$currentYear Anga Cinemas. All rights reserved. Powered by Vesen Computing",
            fontSize: width * .015 > 17.0
                ? 17.0
                : width * .015 < 13.0
                    ? 13.0
                    : width * .015,
            fontWeight: FontWeight.w100,
            color: primaryForeGround(),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 50.0),
          child: width > 1100 ? QuickBook(width: width) : const SizedBox(),
        ),
      ],
    );
  }
}
