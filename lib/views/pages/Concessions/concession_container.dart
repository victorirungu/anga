import 'package:anga/controllers/concessions.dart';
import 'package:anga/views/pages/Concessions/concession_quantity_stepper.dart';
import 'package:anga/views/themes/themes.dart';
import 'package:anga/views/widgets/buttons/simple_button.dart';
import 'package:anga/views/widgets/text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ConsessionContainer extends StatelessWidget {
  ConsessionContainer({super.key});
  final ConcessionsController consessionController =
      Get.put(ConcessionsController());
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double gridWidth = constraints.maxWidth;
        double aspectRatio = 270 / 280;

        int crossAxisCount = (gridWidth / 270).floor();

        crossAxisCount = (crossAxisCount == 1) ? 2 : crossAxisCount;
        aspectRatio = (crossAxisCount == 2) ? 270 / 280 : aspectRatio;

        double containerWidth = (gridWidth / crossAxisCount) - 10;
        double containerHeight = containerWidth / aspectRatio;

        double padding = 22.0;
        return Obx(() => SizedBox(
              height:
                  ((consessionController.setConcessions.length / crossAxisCount)
                              .ceil() *
                          containerHeight) +
                      (padding *
                          (consessionController.setConcessions.length /
                                  crossAxisCount)
                              .ceil()),
              child: Padding(
                padding: const EdgeInsets.all(0.0),
                child: GridView.builder(
                  physics: const ScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: crossAxisCount,
                    childAspectRatio: aspectRatio,
                  ),
                  itemCount: consessionController.setConcessions.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Container(
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.all(Radius.circular(20.0))),
                        width: 270.0,
                        height: 280.0,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image(
                              image: AssetImage(
                                  '${consessionController.setConcessions[index]['image']}'),
                            ),
                            CustomText(
                              text:
                                  '${consessionController.setConcessions[index]['name']} - Ksh. ${consessionController.setConcessions[index]['price']} ',
                              color: secondaryColor(),
                              fontSize: 12.0,
                              fontWeight: FontWeight.bold,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                QuantityStepper(
                                    consession: const {}, cart: {}.obs),
                                CustomElevatedButton(
                                  text: 'Select',
                                  width: 60.0,
                                  height: 20.0,
                                  color: primaryColor(),
                                  onPressed: () {},
                                  bgColor: primaryColor(),
                                  style: TextStyle(
                                      color: colorBlack(), fontSize: 12.0),
                                ),
                                CustomElevatedButton(
                                  text: 'Remove',
                                  width: 60.0,
                                  height: 20.0,
                                  color: primaryColor(),
                                  onPressed: () {},
                                  bgColor: primaryColor(),
                                  style: TextStyle(
                                      color: colorBlack(), fontSize: 12.0),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ));
      },
    );
  }
}
