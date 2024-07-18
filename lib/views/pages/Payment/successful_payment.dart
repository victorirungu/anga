import 'package:anga/controllers/cinema.dart';
import 'package:anga/views/functions/resolution.dart';
import 'package:anga/views/pages/Film/booking_stages.dart';
import 'package:anga/views/pages/Components/Footer/footer.dart';
import 'package:anga/views/themes/themes.dart';
import 'package:anga/views/widgets/text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SuccessfulPayment extends StatefulWidget {
  const SuccessfulPayment({
    super.key,
  });

  @override
  State<SuccessfulPayment> createState() => _SuccessfulPaymentState();
}

class _SuccessfulPaymentState extends State<SuccessfulPayment> {
  final ScrollController filmScrollController = ScrollController();

  final CinemaController cinemaController = Get.put(CinemaController());

  @override
  Widget build(BuildContext context) {
    Map resolution = getResolution(context);
    double width = resolution['width'];
    double height = resolution['height'];

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
                    const Image(image: AssetImage('images/success_pay.png')),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CustomText(
                        text: 'PAYMENT SUCCESSFUL',
                        color: primaryForeGround(),
                        fontSize: 25.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: TextButton(
                          onPressed: () {},
                          child: CustomText(
                            text: 'proceed to download ticket',
                            color: secondaryColor(),
                            fontSize: 22.0,
                            fontWeight: FontWeight.w500,
                          )),
                    ),
                    Footer(width: width),
                  ],
                ),
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
