import 'package:anga/controllers/cinema.dart';
import 'package:anga/controllers/navigation.dart';
import 'package:anga/views/functions/resolution.dart';
import 'package:anga/views/pages/Components/AppBar/wide_screen.dart';
import 'package:anga/views/pages/Show/booking_stages.dart';
import 'package:anga/views/pages/Components/Footer/footer.dart';
import 'package:anga/views/themes/themes.dart';
import 'package:anga/views/widgets/buttons/simple_button.dart';
import 'package:anga/views/widgets/text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChoosePaymentMethod extends StatefulWidget {
  const ChoosePaymentMethod({
    super.key,
  });

  @override
  State<ChoosePaymentMethod> createState() => _ChoosePaymentMethodState();
}

class _ChoosePaymentMethodState extends State<ChoosePaymentMethod> {
  final ScrollController filmScrollController = ScrollController();
  final NavigationController navigationController =
      Get.put(NavigationController());

  final CinemaController cinemaController = Get.put(CinemaController());

  String _selectedPaymentMethod = 'Mpesa';

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
                    CustomText(
                      text: 'Choose payment method',
                      fontSize: 32.0,
                      fontWeight: FontWeight.bold,
                      color: primaryForeGround().withOpacity(.5),
                    ),
                    const SizedBox(
                      height: 15.0,
                    ),
                    SizedBox(
                      height: 360.0,
                      width: 350.0,
                      child: ListView(
                        controller: filmScrollController,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: RadioListTile<String>(
                              tileColor: const Color.fromARGB(255, 50, 50, 50),
                              title: CustomText(
                                text: 'Jambopay',
                                color: primaryForeGround(),
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                              ),
                              contentPadding: const EdgeInsets.fromLTRB(
                                  30.0, 2.0, 30.0, 2.0),
                              activeColor: secondaryColor(),
                              controlAffinity: ListTileControlAffinity.trailing,
                              fillColor:
                                  WidgetStateProperty.all(secondaryColor()),
                              value: 'Jambopay',
                              groupValue: _selectedPaymentMethod,
                              onChanged: (String? value) {
                                setState(() {
                                  _selectedPaymentMethod = value!;
                                });
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: RadioListTile<String>(
                              tileColor: const Color.fromARGB(255, 50, 50, 50),
                              title: CustomText(
                                text: 'Mpesa',
                                color: primaryForeGround(),
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                              ),
                              contentPadding: const EdgeInsets.fromLTRB(
                                  30.0, 2.0, 30.0, 2.0),
                              activeColor: secondaryColor(),
                              controlAffinity: ListTileControlAffinity.trailing,
                              fillColor:
                                  WidgetStateProperty.all(secondaryColor()),
                              value: 'Mpesa',
                              groupValue: _selectedPaymentMethod,
                              onChanged: (String? value) {
                                setState(() {
                                  _selectedPaymentMethod = value!;
                                });
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: RadioListTile<String>(
                              tileColor: const Color.fromARGB(255, 50, 50, 50),
                              title: CustomText(
                                text: 'Google Pay',
                                color: primaryForeGround(),
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                              ),
                              contentPadding: const EdgeInsets.fromLTRB(
                                  30.0, 2.0, 30.0, 2.0),
                              activeColor: secondaryColor(),
                              controlAffinity: ListTileControlAffinity.trailing,
                              fillColor:
                                  WidgetStateProperty.all(secondaryColor()),
                              value: 'Google Pay',
                              groupValue: _selectedPaymentMethod,
                              onChanged: (String? value) {
                                setState(() {
                                  _selectedPaymentMethod = value!;
                                });
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: RadioListTile<String>(
                              tileColor: const Color.fromARGB(255, 50, 50, 50),
                              title: CustomText(
                                text: 'Airtel Money',
                                color: primaryForeGround(),
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                              ),
                              contentPadding: const EdgeInsets.fromLTRB(
                                  30.0, 2.0, 30.0, 2.0),
                              activeColor: secondaryColor(),
                              controlAffinity: ListTileControlAffinity.trailing,
                              fillColor:
                                  WidgetStateProperty.all(secondaryColor()),
                              value: 'Airtel Money',
                              groupValue: _selectedPaymentMethod,
                              onChanged: (String? value) {
                                setState(() {
                                  _selectedPaymentMethod = value!;
                                });
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: RadioListTile<String>(
                              tileColor: const Color.fromARGB(255, 50, 50, 50),
                              title: CustomText(
                                text: 'Visa',
                                color: primaryForeGround(),
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                              ),
                              contentPadding: const EdgeInsets.fromLTRB(
                                  30.0, 2.0, 30.0, 2.0),
                              activeColor: secondaryColor(),
                              controlAffinity: ListTileControlAffinity.trailing,
                              fillColor:
                                  WidgetStateProperty.all(secondaryColor()),
                              value: 'Visa',
                              groupValue: _selectedPaymentMethod,
                              onChanged: (String? value) {
                                setState(() {
                                  _selectedPaymentMethod = value!;
                                });
                              },
                            ),
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
                              Get.toNamed('/mobile-money');
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
