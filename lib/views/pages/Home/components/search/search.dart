import 'package:anga/views/themes/themes.dart';
import 'package:anga/views/widgets/buttons/dropdown_button.dart';
import 'package:anga/views/widgets/buttons/simple_button.dart';
import 'package:anga/views/widgets/inputs/time_input.dart';
import 'package:anga/views/widgets/text.dart';
import 'package:flutter/material.dart';

class Search extends StatelessWidget {
  final double width;
  const Search({super.key, required this.width});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: CustomText(
            text: "Find a Film",
            color: primaryForeGround(),
            fontSize: 50.0,
            fontWeight: FontWeight.w800,
          ),
        ),
        Container(
          width: width * .8,
          height: 140.0,
          decoration: BoxDecoration(
              color: lightColor().withOpacity(.15),
              borderRadius: BorderRadius.circular(25.0)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CustomDropdown(
                defaultTitle: 'Cinema',
                options: const ['Anga Diamond', 'Anga Sky', 'Anga CBD'],
                width: 200.0,
                backgroundColor: secondaryColor(),
                borderRadius: BorderRadius.circular(30.0),
                isUnderlined: false,
                underline: const SizedBox(),
                icon: Icons.location_on,
              ),
              const SizedBox(width: 200.0, child: CustomDateTimePicker()),
              CustomDropdown(
                defaultTitle: 'Experience',
                options: const ['Anga Diamond', 'Anga Sky', 'Anga CBD'],
                width: 200.0,
                backgroundColor: secondaryColor(),
                borderRadius: BorderRadius.circular(30.0),
                isUnderlined: false,
                underline: const SizedBox(),
                icon: Icons.visibility,
              ),
              CustomElevatedButton(
                text: 'Check Availability',
                fontWeight: FontWeight.w700,
                onPressed: () {},
                color: darkColor(),
                bgColor: primaryColor(),
                borderRadius: 20.0,
                height: 40.0,
                width: 200.0,
              )
            ],
          ),
        )
      ],
    );
  }
}
