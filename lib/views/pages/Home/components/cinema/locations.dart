import 'package:anga/controllers/cinema.dart';
import 'package:anga/views/themes/themes.dart';
import 'package:anga/views/widgets/buttons/simple_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Locations extends StatelessWidget {
  final double width;
  final List items;

  Locations({super.key, required this.width, required this.items});

  final CinemaController cinemaController = Get.find<CinemaController>();

  @override
  Widget build(BuildContext context) {
    var btnWidth = width * .22 > 155.0
        ? 155.0
        : (width * .22 < 120.0 ? 120.0 : width * .22);

    return Obx(() => SizedBox(
          width: width * .85,
          child:
              width * .85 > ((items.length * btnWidth) + (items.length * 24.0))
                  ? locationBtnWidget()
                  : SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: locationBtnWidget(),
                    ),
        ));
  }

  Row locationBtnWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: items.map((item) {
        return Padding(
          padding: const EdgeInsets.all(2.0),
          child: CustomElevatedButton(
            bgColor: int.parse(item['id']) ==
                    cinemaController.selectedLocationId.value
                ? themeColorGrey()
                : primaryColor(),
            color: colorBlack(),
            text: item['name'],
            width: width * .22 > 165.0
                ? 165.0
                : (width * .22 < 120.0 ? 120.0 : width * .22),
            height: 38.0,
            borderRadius: 20.0,
            onPressed: () {
              cinemaController.updateLocation(int.parse(item['id']));
            },
            style: TextStyle(
                overflow: TextOverflow.ellipsis,
                color: darkColor(),
                fontSize: width > 700 ? 16.0 : 12.0,
                fontWeight: FontWeight.w900),
          ),
        );
      }).toList(),
    );
  }
}
