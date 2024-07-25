import 'package:anga/views/themes/themes.dart';
import 'package:anga/views/widgets/buttons/simple_button.dart';
import 'package:anga/views/widgets/text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BookingCart extends StatelessWidget {
  const BookingCart({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
            padding: const EdgeInsets.only(left: 20.0, top: 10.0),
            child: Align(
              alignment: Alignment.topLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
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
    );
  }
}
