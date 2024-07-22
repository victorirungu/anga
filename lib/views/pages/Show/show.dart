import 'package:anga/controllers/cinema.dart';
import 'package:anga/controllers/navigation.dart';
import 'package:anga/views/functions/resolution.dart';
import 'package:anga/views/pages/Components/AppBar/wide_screen.dart';
import 'package:anga/views/pages/Show/booking_stages.dart';
import 'package:anga/views/pages/Components/Footer/footer.dart';
import 'package:anga/views/pages/Show/seating_chart.dart';
import 'package:anga/views/themes/themes.dart';
import 'package:anga/views/widgets/buttons/simple_button.dart';
import 'package:anga/views/widgets/cards/cards.dart';
import 'package:anga/views/widgets/text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Film extends StatelessWidget {
  Film({
    super.key,
  });
  final ScrollController filmScrollController = ScrollController();
  final CinemaController cinemaController = Get.put(CinemaController());
  final NavigationController navigationController =
      Get.put(NavigationController());

  @override
  Widget build(BuildContext context) {
    Map resolution = getResolution(context);
    double width = resolution['width'];
    double height = resolution['height'];
    final Map args = Get.arguments;
    navigationController.activePage.value = "";
    navigationController.activeIndex.value = 4;

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
              controller: filmScrollController,
              radius: const Radius.circular(5.0),
              thickness: width > 500 ? 7.0 : 3.0,
              child: SingleChildScrollView(
                controller: filmScrollController,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const BookingStages(
                      stage: 'seat',
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                            width: width * .20,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomText(
                                  text: args['item']['name'],
                                  fontSize: 36.0,
                                  color: primaryForeGround(),
                                  fontWeight: FontWeight.w800,
                                ),
                                InteractiveCard(
                                    item: args['item'],
                                    borderColor: primaryForeGround(),
                                    height: 480.0,
                                    bRadius: 20.0,
                                    width: 300.0,
                                    usage: 'film_overview',
                                    onPressed: () {}),
                                CustomText(
                                  text: 'Mon, 8th June,',
                                  color: primaryForeGround(),
                                  fontSize: 22,
                                  fontWeight: FontWeight.w200,
                                ),
                                CustomText(
                                  text: 'Session starts at 6:30pm',
                                  color: primaryForeGround(),
                                  fontSize: 22,
                                  fontWeight: FontWeight.w200,
                                ),
                                const SizedBox(
                                  height: 30.0,
                                ),
                                CustomText(
                                  text: 'You have selected 2 seats:',
                                  color: primaryForeGround(),
                                  fontSize: 22,
                                  fontWeight: FontWeight.w200,
                                ),
                                CustomText(
                                  text: 'Row 6, Column F and G',
                                  fontSize: 22,
                                  fontWeight: FontWeight.w200,
                                  color: secondaryColor(),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 15.0, bottom: 15.0),
                                  child: Container(
                                    width: 300.0,
                                    height: 1.50,
                                    color: primaryForeGround(),
                                  ),
                                ),
                                Row(
                                  children: [
                                    CustomText(
                                      text: 'Total: ',
                                      color: primaryForeGround(),
                                      fontSize: 22,
                                      fontWeight: FontWeight.w200,
                                    ),
                                    CustomText(
                                      text: 'Kshs.800/=',
                                      color: primaryColor(),
                                      fontSize: 22,
                                      fontWeight: FontWeight.w200,
                                    )
                                  ],
                                )
                              ],
                            )),
                        Padding(
                          padding: const EdgeInsets.only(top: 150.0),
                          child: Column(
                            children: [
                              SizedBox(
                                  width: width * .2,
                                  child: Column(
                                    children: [
                                      CustomElevatedButton(
                                        text: '10:30am',
                                        onPressed: () {},
                                        color: colorBlack(),
                                        width: 120.0,
                                        bgColor: primaryColor(),
                                        height: 40.0,
                                        style: TextStyle(
                                            color: colorBlack(),
                                            fontSize: 22.0,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      CustomElevatedButton(
                                        text: '12:30pm',
                                        onPressed: () {},
                                        color: colorBlack(),
                                        width: 120.0,
                                        bgColor: primaryColor(),
                                        height: 40.0,
                                        style: TextStyle(
                                            color: colorBlack(),
                                            fontSize: 22.0,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      CustomElevatedButton(
                                        text: '06:30pm',
                                        onPressed: () {},
                                        color: colorBlack(),
                                        width: 120.0,
                                        bgColor: secondaryColor(),
                                        height: 40.0,
                                        style: TextStyle(
                                            color: colorBlack(),
                                            fontSize: 22.0,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      CustomElevatedButton(
                                        text: '10:00pm',
                                        onPressed: () {},
                                        color: colorBlack(),
                                        width: 120.0,
                                        bgColor: primaryColor(),
                                        height: 40.0,
                                        style: TextStyle(
                                            color: colorBlack(),
                                            fontSize: 22.0,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  )),
                            ],
                          ),
                        ),
                        const SizedBox(height: 20.0),
                        SizedBox(
                          width: width * .43,
                          child: Column(
                            children: [
                              SeatingChart(
                                jsonData: cinemaController.seatsData,
                              ),
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Row(children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: SizedBox(
                                          width: 30.0,
                                          height: 30.0,
                                          child: Card(
                                            color: secondaryColor(),
                                          )),
                                    ),
                                    CustomText(
                                        text: 'Reserved seats',
                                        color: primaryForeGround(),
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.w600)
                                  ]),
                                  Row(children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: SizedBox(
                                          width: 30.0,
                                          height: 30.0,
                                          child: Card(
                                            color: themeColorGrey(),
                                          )),
                                    ),
                                    CustomText(
                                        text: 'Available seats',
                                        color: primaryForeGround(),
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.w600)
                                  ]),
                                  Row(children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: SizedBox(
                                          width: 30.0,
                                          height: 30.0,
                                          child: Card(
                                            color: primaryColor(),
                                          )),
                                    ),
                                    CustomText(
                                        text: 'Your seats',
                                        color: primaryForeGround(),
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.w600)
                                  ]),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 50.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const SizedBox(),
                              Row(
                                children: [
                                  CustomElevatedButton(
                                    onPressed: () {
                                      Get.toNamed('/concessions');
                                    },
                                    text: 'CHOOSE CONCESSIONS',
                                    width: 250.0,
                                    bgColor: primaryForeGround(),
                                    color: primaryForeGround(),
                                    style:
                                        TextStyle(color: primaryBackGround()),
                                  ),
                                  CustomElevatedButton(
                                    onPressed: () {
                                      Get.toNamed('/payment-method');
                                    },
                                    text: 'PROCEED TO PAYMENT',
                                    width: 250.0,
                                    bgColor: secondaryColor(),
                                    color: secondaryColor(),
                                    style: TextStyle(color: lightColor()),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
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
                  scrollController: filmScrollController,
                )
              : const SizedBox(),
        ),
      ]),
    );
  }
}
