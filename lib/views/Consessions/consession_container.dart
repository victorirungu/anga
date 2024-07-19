import 'package:anga/views/Consessions/consession_quantity_stepper.dart';
import 'package:anga/views/themes/themes.dart';
import 'package:anga/views/widgets/buttons/simple_button.dart';
import 'package:anga/views/widgets/text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ConsessionContainer extends StatelessWidget {
  ConsessionContainer({super.key});
  final List<Map<String, String>> items = [
    {
      'id': '1',
      'name': 'Kraven',
      'image': 'images/homepage1.jpg',
      'releases': 'Mon 29th Jul 2024',
      'time': '05:00 PM',
      'location': 'Anga Diamond'
    },
    {
      'id': '2',
      'name': 'Furiosa',
      'image': 'images/homepage2.jpg',
      'releases': 'Mon 29th Jul 2024',
      'time': '05:00 PM',
      'location': 'Anga Diamond'
    },
    {
      'id': '3',
      'name': 'Bad Boys',
      'image': 'images/homepage4.jpg',
      'releases': 'Mon 29th Jul 2024',
      'time': '05:00 PM',
      'location': 'Anga Diamond'
    },
    {
      'id': '4',
      'name': 'Inside Out 2',
      'image': 'images/homepage55.jpg',
      'releases': 'Mon 29th Jul 2024',
      'time': '12:00 PM',
      'location': 'Anga Diamond'
    },
    {
      'id': '5',
      'name': 'Despicable me 4',
      'image': 'images/homepage66.jpeg',
      'releases': 'Mon 29th Jul 2024',
      'time': '07:00 PM',
      'location': 'Anga Diamond'
    },
  ];

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
        var rows = (items.length / crossAxisCount).ceil();

        double padding = 22.0;
        return SizedBox(
          height: (rows * containerHeight) + (padding * rows),
          child: Padding(
            padding: const EdgeInsets.all(0.0),
            child: GridView.builder(
              physics: const ScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: crossAxisCount,
                childAspectRatio: aspectRatio,
              ),
              itemCount: items.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Container(
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(20.0))),
                    width: 270.0,
                    height: 280.0,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Image(
                          image: AssetImage('images/popcorn.png'),
                        ),
                        CustomText(
                          text: 'Salted Medium Popcorn - Ksh. 250 ',
                          color: secondaryColor(),
                          fontSize: 12.0,
                          fontWeight: FontWeight.bold,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            QuantityStepper(consession: const {}, cart: {}.obs),
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
        );
      },
    );
  }
}
