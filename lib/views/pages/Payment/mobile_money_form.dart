import 'package:anga/controllers/cinema.dart';
import 'package:anga/controllers/navigation.dart';
import 'package:anga/views/functions/resolution.dart';
import 'package:anga/views/pages/Components/AppBar/wide_screen.dart';
import 'package:anga/views/pages/Show/booking_stages.dart';
import 'package:anga/views/pages/Components/Footer/footer.dart';
import 'package:anga/views/themes/themes.dart';
import 'package:anga/views/widgets/buttons/simple_button.dart';
import 'package:anga/views/widgets/inputs/text_field.dart';
import 'package:anga/views/widgets/text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MobileMoneyForm extends StatefulWidget {
  const MobileMoneyForm({
    super.key,
  });

  @override
  State<MobileMoneyForm> createState() => _MobileMoneyFormState();
}

class _MobileMoneyFormState extends State<MobileMoneyForm> {
  final ScrollController filmScrollController = ScrollController();
  final NavigationController navigationController =
      Get.put(NavigationController());

  final CinemaController cinemaController = Get.put(CinemaController());

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
              controller: filmScrollController,
              radius: const Radius.circular(5.0),
              thickness: width > 500 ? 7.0 : 3.0,
              child: SingleChildScrollView(
                controller: filmScrollController,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const BookingStages(stage: 'payment'),
                    const SizedBox(
                      height: 15.0,
                    ),
                    SizedBox(
                      width: 600.0,
                      height: 180.0,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CustomText(
                                text: 'Enter mobile number',
                                color: primaryForeGround(),
                                fontSize: 25.0,
                                fontWeight: FontWeight.w600,
                              ),
                              const SizedBox(
                                width: 300.0,
                                height: 40.0,
                                child: CustomTextField(
                                  fillColor: true,
                                  hint: '',
                                  bRadius: 10.0,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CustomText(
                                text: 'Enter amount',
                                color: primaryForeGround(),
                                fontSize: 25.0,
                                fontWeight: FontWeight.w600,
                              ),
                              const SizedBox(
                                width: 300.0,
                                height: 40.0,
                                child: CustomTextField(
                                  fillColor: true,
                                  hint: '',
                                  bRadius: 10.0,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CustomText(
                                text: 'Enter PIN',
                                color: primaryForeGround(),
                                fontSize: 25.0,
                                fontWeight: FontWeight.w600,
                              ),
                              const SizedBox(
                                width: 300.0,
                                height: 40.0,
                                child: CustomTextField(
                                  fillColor: true,
                                  hint: '',
                                  bRadius: 10.0,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 30.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomElevatedButton(
                            onPressed: () {},
                            text: 'CANCEL',
                            width: 120.0,
                            bgColor: primaryForeGround(),
                            color: primaryForeGround(),
                            style: TextStyle(color: primaryBackGround()),
                          ),
                          CustomElevatedButton(
                            onPressed: () {
                              Get.toNamed('/success');
                            },
                            text: 'PROCEED',
                            width: 120.0,
                            bgColor: secondaryColor(),
                            color: secondaryColor(),
                            style: TextStyle(color: lightColor()),
                          ),
                        ],
                      ),
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
