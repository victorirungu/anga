import 'package:anga/controllers/concessions.dart';
import 'package:anga/controllers/navigation.dart';
import 'package:anga/views/pages/Concessions/concession_options.dart';
import 'package:anga/views/pages/Concessions/concession_container.dart';
import 'package:anga/views/functions/resolution.dart';
import 'package:anga/views/pages/Components/Footer/footer.dart';
import 'package:anga/views/themes/themes.dart';
import 'package:anga/views/widgets/buttons/simple_button.dart';
import 'package:anga/views/widgets/text.dart';
import 'package:flutter/material.dart';
import 'package:anga/views/pages/Components/AppBar/wide_screen.dart';
import 'package:anga/views/pages/Components/AppBar/small_screen.dart';
import 'package:get/get.dart';

GlobalKey<NavigatorState> mainNavigatorKey = GlobalKey<NavigatorState>();

class Concessions extends StatelessWidget {
  Concessions({
    super.key,
  });
  final ScrollController scrollController = ScrollController();
  final NavigationController navigationController =
      Get.put(NavigationController());
  final ConcessionsController concessionsController =
      Get.put(ConcessionsController());

  @override
  Widget build(BuildContext context) {
    Map resolution = getResolution(context);
    double width = resolution['width'];
    double height = resolution['height'];
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
              controller: scrollController,
              radius: const Radius.circular(5.0),
              thickness: width > 500 ? 7.0 : 3.0,
              child: SingleChildScrollView(
                controller: scrollController,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(height: 150.0),
                    CustomText(
                      text: 'CHOOSE CONCESSIONS',
                      color: primaryColor(),
                      fontSize: 36.0,
                      fontWeight: FontWeight.w800,
                    ),
                    const SizedBox(
                      height: 30.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                          SizedBox(
                          width: width * .75,
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  ConcessionOptions(
                                      width: width,
                                      items: concessionsController.categories),
                                ],
                              ),
                              const SizedBox(
                                height: 20.0,
                              ),
                              ConsessionContainer(),
                            ],
                          ),
                        ),
                        Container(
                          color: secondaryColor(),
                          height: 400.0,
                          width: 270.0,
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: CustomText(
                                  text: 'BOOKING SUMMARY',
                                  color: lightColor(),
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Container(
                                width: 230.0,
                                height: 1.0,
                                color: lightColor().withOpacity(.8),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 20.0, top: 10.0),
                                child: Align(
                                  alignment: Alignment.topLeft,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(4.0),
                                        child: CustomText(
                                          text: 'Name',
                                          color: lightColor(),
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(4.0),
                                        child: CustomText(
                                          text: 'Location',
                                          color: lightColor(),
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(4.0),
                                        child: CustomText(
                                          text: 'Show Price: ',
                                          color: lightColor(),
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(4.0),
                                        child: CustomText(
                                          text: 'Date | Time ',
                                          color: lightColor(),
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(4.0),
                                        child: CustomText(
                                          text: 'Tickets ',
                                          color: lightColor(),
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      Container(
                                        width: 230.0,
                                        height: .50,
                                        color: lightColor().withOpacity(.8),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(2.0),
                                        child: CustomText(
                                          text: 'Urban bites 120grms ',
                                          color: lightColor(),
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(2.0),
                                        child: CustomText(
                                          text: '2 Chosens ',
                                          color: lightColor(),
                                          fontSize: 13.0,
                                          fontWeight: FontWeight.w200,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(2.0),
                                        child: CustomText(
                                          text: 'Ksh.700 ',
                                          color: lightColor(),
                                          fontSize: 13.0,
                                          fontWeight: FontWeight.w200,
                                        ),
                                      ),
                                      Container(
                                        width: 230.0,
                                        height: .50,
                                        color: lightColor().withOpacity(.8),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(5.0),
                                        child: CustomText(
                                          text: 'Total Ksh. 2180 ',
                                          color: lightColor(),
                                          fontSize: 15.0,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      CustomElevatedButton(
                                          text: 'Proceed to Pay',
                                          width: 150.0,
                                          height: 20.0,
                                          bgColor: primaryColor(),
                                          color: primaryColor(),
                                          borderRadius: 0.0,
                                          style: TextStyle(
                                              color: lightColor(),
                                              fontSize: 14.0,
                                              fontWeight: FontWeight.bold),
                                          onPressed: () {
                                            Get.toNamed('/payment-method');
                                          })
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
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
                  scrollController: scrollController,
                )
              : const SizedBox(),
        ),
      ]),
      bottomNavigationBar: width < 800 ? MobileNavigation() : const SizedBox(),
    );
  }
}
