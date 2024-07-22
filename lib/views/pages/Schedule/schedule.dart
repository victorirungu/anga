import 'package:anga/controllers/navigation.dart';
import 'package:anga/views/functions/resolution.dart';
import 'package:anga/views/pages/Components/Footer/footer.dart';
import 'package:anga/views/themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:anga/views/pages/Components/AppBar/wide_screen.dart';
import 'package:anga/views/pages/Components/AppBar/small_screen.dart';
import 'package:get/get.dart';

class Schedule extends StatelessWidget {
  Schedule({
    super.key,
  });
  final ScrollController scrollController = ScrollController();
  final NavigationController navigationController =
      Get.put(NavigationController());

  @override
  Widget build(BuildContext context) {
    final Map args = Get.arguments;

    print(args);
    Map resolution = getResolution(context);
    double width = resolution['width'];
    double height = resolution['height'];
    navigationController.activePage.value = "Schedule";
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
                    //Header
                    // ContactForm(width: width),
                    // const Padding(
                    //   padding: EdgeInsets.only(top: 50.0, bottom: 50.0),
                    //   child: ContactInfo(),
                    // ),
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
