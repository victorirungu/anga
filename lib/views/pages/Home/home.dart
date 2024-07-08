import 'package:anga/views/functions/resolution.dart';
import 'package:anga/views/pages/Home/components/cinema/cinema.dart';
import 'package:anga/views/pages/Home/components/coming_soon/coming_soon.dart';
import 'package:anga/views/pages/Home/components/events/events.dart';
import 'package:anga/views/pages/Home/components/footer/footer.dart';
import 'package:anga/views/pages/Home/components/home_slider/home_slider.dart';
import 'package:anga/views/pages/Home/components/search/search.dart';
import 'package:anga/views/themes/themes.dart';
import 'package:anga/views/widgets/buttons/dropdown_button.dart';
import 'package:anga/views/widgets/text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animated_button/flutter_animated_button.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatelessWidget {
  final ScrollController scrollController;
  const Home({
    super.key,
    required this.scrollController,
  });

  @override
  Widget build(BuildContext context) {
    Map resolution = getResolution(context);
    double width = resolution['width'];
    double height = resolution['height'];
    return SizedBox(
      height: height,
      child: ScrollbarTheme(
        data: ScrollbarThemeData(
          thumbColor:
              WidgetStateProperty.all(primaryForeGround().withOpacity(.75)),
          radius: const Radius.circular(5.0),
          thickness: WidgetStateProperty.all(width > 500 ? 7.0 : 3.0),
          thumbVisibility: WidgetStateProperty.all(true),
          trackVisibility: WidgetStateProperty.all(false),
          interactive: true,
          trackColor: WidgetStateProperty.all(primaryColor().withOpacity(.2)),
        ),
        child: Scrollbar(
          controller: scrollController,
          radius: const Radius.circular(5.0),
          thickness: width > 500 ? 7.0 : 3.0,
          child: SingleChildScrollView(
            controller: scrollController,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                //Header
                Stack(
                  children: [
                    SizedBox(
                        height: 600.0, width: width, child: const HomeSlider()),
                    //overlay
                    Positioned(
                      top: 400.0,
                      left: (width / 2) - 145,
                      child: Column(
                        children: [
                          AnimatedButton(
                            onPress: () {},
                            height: width < 700 ? 50.0 : 60.0,
                            width: width * .5 > 290 ? 290 : width * .5,
                            text: 'BOOK NOW',
                            isReverse: true,
                            animatedOn: AnimatedOn.onHover,
                            selectedTextColor: Colors.white,
                            transitionType: TransitionType.LEFT_TO_RIGHT,
                            textStyle: GoogleFonts.roboto(
                                fontSize: 26,
                                fontWeight: FontWeight.w900,
                                color: colorBlack()),
                            backgroundColor: primaryColor(),
                            borderColor: themeColorTransparent(),
                            borderRadius: 50,
                            selectedBackgroundColor: secondaryColor(),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                        bottom: 30.0,
                        child: SizedBox(
                          width: width,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(right: 15.0),
                                child: CustomText(
                                  text: "See What's on at ",
                                  color: Color.fromARGB(255, 108, 189, 255),
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: 1.2,
                                ),
                              ),
                              CustomDropdown(
                                defaultTitle: 'Choose your venue',
                                options: const [
                                  'Anga Diamond',
                                  'Anga Sky',
                                  'Anga CBD'
                                ],
                                width: width / 2.5,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ElevatedButton(
                                    onPressed: () {},
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors
                                          .transparent, // Transparent background
                                      shadowColor: Colors.transparent,
                                      padding: const EdgeInsets.all(0.0),
                                      fixedSize: const Size.fromWidth(
                                          20.0), // No shadow
                                      side: BorderSide(
                                          color:
                                              primaryForeGround()), // Black border color
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(
                                            6), // Border radius
                                      ),
                                    ),
                                    child: CustomText(
                                      text: "GO",
                                      color: primaryForeGround(),
                                    )),
                              )
                            ],
                          ),
                        ))
                  ],
                ),

                //Search

                Search(
                  width: width,
                ),

                Cinema(width: width),
                Events(width: width),
                ComingSoon(width: width),
                Footer(width: width),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
