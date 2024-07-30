import 'package:anga/controllers/cinema.dart';
import 'package:anga/views/themes/themes.dart';
import 'package:anga/views/widgets/buttons/simple_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FilmCategories extends StatelessWidget {
  final double width;
  FilmCategories({super.key, required this.width});
  final CinemaController cinemaController = Get.put(CinemaController());
  @override
  Widget build(BuildContext context) {
    final List<String> buttonTexts = [
      'All Films',
      '2D',
      '3D',
      'Sky',
      'Diamond',
      'CBD',
    ];

    return SizedBox(
        width: width * .75,
        child: Obx(
          () => Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: buttonTexts.map((text) {
              final bool isFiltered = cinemaController.scheduleFilter
                  .map((filter) => filter.trim().toLowerCase())
                  .contains(text.trim().toLowerCase());
              final Color bgColor = isFiltered
                  ? secondaryColor()
                  : const Color.fromARGB(255, 47, 47, 47);
              final Color textColor =
                  isFiltered ? lightColor() : lightColor().withOpacity(.5);

              return CustomElevatedButton(
                text: text,
                width: 140.0,
                onPressed: () {
                  cinemaController.updateScheduleFilter(text);
                },
                bgColor: bgColor,
                color: bgColor,
                borderRadius: 15.0,
                height: 40.0,
                style: TextStyle(
                  color: textColor,
                  fontSize: 18.0,
                  letterSpacing: 1.3,
                  fontWeight: FontWeight.w700,
                ),
              );
            }).toList(),
          ),
        ));
  }
}
