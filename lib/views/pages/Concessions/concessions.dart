import 'package:anga/controllers/concessions.dart';
import 'package:anga/controllers/navigation.dart';
import 'package:anga/views/pages/Components/booking_cart.dart';
import 'package:anga/views/pages/Concessions/concession_options.dart';
import 'package:anga/views/pages/Concessions/concession_container.dart';
import 'package:anga/views/functions/resolution.dart';
import 'package:anga/views/pages/Components/Footer/footer.dart';
import 'package:anga/views/themes/themes.dart';
import 'package:anga/views/widgets/text.dart';
import 'package:flutter/material.dart';
import 'package:anga/views/pages/Components/AppBar/wide_screen.dart';
import 'package:anga/views/pages/Components/AppBar/small_screen.dart';
import 'package:get/get.dart';

GlobalKey<NavigatorState> mainNavigatorKey = GlobalKey<NavigatorState>();

class Concessions extends StatefulWidget {
  const Concessions({
    super.key,
  });

  @override
  State<Concessions> createState() => _ConcessionsState();
}

class _ConcessionsState extends State<Concessions> {
  bool _isExpanded = true;

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
                child: Stack(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(height: width > 800.0 ? 130.0 : 45.0),
                        CustomText(
                          text: 'CHOOSE CONCESSIONS',
                          color: primaryColor(),
                          fontSize: 36.0,
                          fontWeight: FontWeight.w800,
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: width * .04, right: width * .04),
                          child: Align(
                            alignment: width > 1030.0
                                ? (_isExpanded
                                    ? Alignment.topLeft
                                    : Alignment.topCenter)
                                : Alignment.topCenter,
                            child: SizedBox(
                              width: width > 1030.0
                                  ? (_isExpanded ? width * .65 : width * .85)
                                  : width * .9,
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      ConcessionOptions(
                                          width: width,
                                          items:
                                              concessionsController.categories),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 40.0,
                                  ),
                                  ConsessionContainer(),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Footer(width: width),
                      ],
                    ),
                    Positioned(
                      right: width > 800
                          ? (width * .04) + 10.0
                          : (width * .04) + 0.0,
                      top: width > 800 ? 210.0 : 0.0,
                      child: Container(
                        constraints: const BoxConstraints(
                          minWidth: 50.0, // Minimum width
                          maxWidth: 270.0, // Maximum width
                          minHeight: 20.0, // Minimum height when collapsed
                          maxHeight: 450.0, // Maximum height when expanded
                        ),
                        child: SingleChildScrollView(
                          child: ExpansionPanelList(
                            elevation: 0.0,
                            expandedHeaderPadding: const EdgeInsets.all(0.0),
                            expandIconColor: secondaryColor(),
                            dividerColor: primaryColor(),
                            expansionCallback: (int index, bool isExpanded) {
                              setState(() {
                                _isExpanded = !_isExpanded;
                              });
                            },
                            children: [
                              ExpansionPanel(
                                canTapOnHeader: false,
                                backgroundColor:
                                    primaryBackGround().withOpacity(1),
                                headerBuilder:
                                    (BuildContext context, bool isExpanded) {
                                  return Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      CustomText(
                                          text: 'My Cart',
                                          color: primaryForeGround(),
                                          selectableText: false,
                                          fontSize: 15.0),
                                      Icon(
                                        Icons.shopping_bag,
                                        color: primaryColor(),
                                        size: 25.0,
                                      ),
                                    ],
                                  );
                                },
                                body: const BookingCart(),
                                isExpanded: _isExpanded,
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
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
