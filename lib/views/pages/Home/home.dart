import 'package:anga/controllers/navigation.dart';
import 'package:anga/views/functions/resolution.dart';
import 'package:anga/views/pages/Components/AppBar/wide_screen.dart';
import 'package:anga/views/pages/Components/AppBar/small_screen.dart';
import 'package:anga/views/pages/Components/Globals/globals.dart';
import 'package:anga/views/pages/Home/components/cinema/cinema.dart';
import 'package:anga/views/pages/Home/components/coming_soon/coming_soon.dart';
import 'package:anga/views/pages/Home/components/events/events.dart';
import 'package:anga/views/pages/Components/Footer/footer.dart';
import 'package:anga/views/pages/Home/components/home_slider/home_slider.dart';
import 'package:anga/views/pages/Home/components/logo.dart';
import 'package:anga/views/pages/Home/components/search/search.dart';
import 'package:anga/views/themes/themes.dart';
import 'package:anga/views/widgets/buttons/dropdown_button.dart';
import 'package:anga/views/widgets/text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animated_button/flutter_animated_button.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatelessWidget {
  Home({
    super.key,
  });
  final ScrollController homeScrollController = ScrollController();
  final NavigationController navigationController =
      Get.put(NavigationController());


  @override
  Widget build(BuildContext context) {
    Map resolution = getResolution(context);
    double width = resolution['width'];
    double height = resolution['height'];
    navigationController.activePage.value = "Home";
    navigationController.activeIndex.value = 0;

    return Scaffold(
      backgroundColor: primaryBackGround(),
      body: Stack(children: [
        SizedBox(
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
              trackColor:
                  WidgetStateProperty.all(primaryColor().withOpacity(.2)),
            ),
            child: Scrollbar(
              controller: homeScrollController,
              radius: const Radius.circular(5.0),
              thickness: width > 500 ? 7.0 : 3.0,
              child: SingleChildScrollView(
                controller: homeScrollController,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    //Header
                    Stack(
                      children: [
                        SizedBox(
                            height: 600.0,
                            width: width,
                            child: const HomeSlider()),
                        //overlay
                        Positioned(
                          top: 380.0,
                          left: (width / 2) -
                              ((width * .5 > 280 ? 280 : width * .5) / 2),
                          child: Column(
                            children: [
                              AnimatedButton(
                                onPress: () {},
                                height: width < 700 ? 50.0 : 55.0,
                                width: width * .5 > 280 ? 280 : width * .5,
                                text: 'BOOK NOW',
                                isReverse: true,
                                animatedOn: AnimatedOn.onHover,
                                selectedTextColor: Colors.white,
                                transitionType: TransitionType.LEFT_TO_RIGHT,
                                textStyle: GoogleFonts.roboto(
                                    fontSize: 24,
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
                          top: 20.0,
                          child:
                              width < 800.0 ? const Logo() : const SizedBox(),
                        ),
                        Positioned(
                            bottom: 30.0,
                            child: SizedBox(
                              width: width,
                              child: width > 600.0
                                  ? Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              right: 15.0),
                                          child: CustomText(
                                            text: "See What's on at ",
                                            color: primaryColor(),
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
                                                padding:
                                                    const EdgeInsets.all(0.0),
                                                fixedSize: const Size.fromWidth(
                                                    20.0), // No shadow
                                                side: BorderSide(
                                                    color:
                                                        primaryForeGround()), // Black border color
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          6), // Border radius
                                                ),
                                              ),
                                              child: CustomText(
                                                text: "GO",
                                                color: primaryForeGround(),
                                              )),
                                        )
                                      ],
                                    )
                                  : Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              right: 15.0),
                                          child: CustomText(
                                            text: "See What's on at ",
                                            color: primaryColor(),
                                            fontSize: 20.0,
                                            fontWeight: FontWeight.w600,
                                            letterSpacing: 1.2,
                                          ),
                                        ),
                                        const SizedBox(height: 20.0),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            CustomDropdown(
                                              defaultTitle: 'Choose your venue',
                                              options: const [
                                                'Anga Diamond',
                                                'Anga Sky',
                                                'Anga CBD'
                                              ],
                                              width: width / 2.1,
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: ElevatedButton(
                                                  onPressed: () {},
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                    backgroundColor: Colors
                                                        .transparent, // Transparent background
                                                    shadowColor:
                                                        Colors.transparent,
                                                    padding:
                                                        const EdgeInsets.all(
                                                            0.0),
                                                    fixedSize:
                                                        const Size.fromWidth(
                                                            20.0), // No shadow
                                                    side: BorderSide(
                                                        color:
                                                            primaryForeGround()), // Black border color
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              6), // Border radius
                                                    ),
                                                  ),
                                                  child: CustomText(
                                                    text: "GO",
                                                    color: primaryForeGround(),
                                                  )),
                                            ),
                                          ],
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

                    Cinema(key: cinemaKey, width: width),
                    Events(key: eventsKey, width: width),
                    ComingSoon(key: comingSoonKey, width: width),
                    Footer(width: width),
                  ],
                ),
              ),
            ),
          ),
        ),
        Positioned(
          top: 0,
          left: 0,
          child: width > 800
              ? CustomAppBar(
                  scrollController: homeScrollController,
                )
              : const SizedBox(),
        ),
      ]),
      bottomNavigationBar: width < 800 ? MobileNavigation() : const SizedBox(),
    );
  }
}
