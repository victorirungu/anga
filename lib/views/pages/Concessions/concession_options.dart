import 'package:anga/controllers/concessions.dart';
import 'package:anga/views/themes/themes.dart';
import 'package:anga/views/widgets/buttons/simple_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ConcessionOptions extends StatelessWidget {
  final double width;
  final List items;

  ConcessionOptions({super.key, required this.width, required this.items});

  final ConcessionsController concessionsController =
      Get.find<ConcessionsController>();

  @override
  Widget build(BuildContext context) {
    var btnWidth = width * .22 > 155.0
        ? 155.0
        : (width * .22 < 120.0 ? 120.0 : width * .22);

    return Obx(() => SizedBox(
          width: width * .6,
          child:
              width * .6 > ((items.length * btnWidth) + (items.length * 24.0))
                  ? concessionOptionsBtnWidget()
                  : SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: concessionOptionsBtnWidget(),
                    ),
        ));
  }

  Row concessionOptionsBtnWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: items.map((item) {
        return Padding(
          padding: const EdgeInsets.all(4.0),
          child: CustomElevatedButton(
            onPressed: () {
              concessionsController.updateCategoryId(int.parse(item['id']));
            },
            text: item['name'],
            width: 120.0,
            borderRadius: 10.0,
            bgColor: int.parse(item['id']) ==
                    concessionsController.selectedConcessionId.value
                ? lightColor()
                : secondaryColor(),
            style: TextStyle(
                color: int.parse(item['id']) ==
                        concessionsController.selectedConcessionId.value
                    ? darkColor()
                    : lightColor(),
                fontSize: 20.0),
          ),
        );
      }).toList(),
    );
  }
}
