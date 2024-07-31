import 'package:anga/views/themes/themes.dart';
import 'package:anga/views/widgets/buttons/dropdown_button.dart';
import 'package:anga/views/widgets/buttons/simple_button.dart';
import 'package:anga/views/widgets/inputs/time_input.dart';
import 'package:anga/views/widgets/text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Search extends StatelessWidget {
  final double width;
  const Search({super.key, required this.width});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
          child: CustomText(
            text: "Find a Film",
            color: primaryForeGround(),
            fontSize: width * .030,
            fontWeight: FontWeight.w800,
          ),
        ),
        LayoutBuilder(
          builder: (context, constraints) {
            double containerWidth = constraints.maxWidth * .8;
            double itemWidth = constraints.maxWidth * .175 < 190
                ? 190
                : constraints.maxWidth * .175;

            // Different stages of responsiveness
            if (constraints.maxWidth > 1050) {
              // Full layout for large screens
              return buildRowLayout(containerWidth, itemWidth);
            } else if (constraints.maxWidth > 760) {
              // Intermediate layout: Move button to new line
              return buildIntermediateLayout(containerWidth, itemWidth);
            } else {
              // Mobile layout: Convert row into column
              return buildColumnLayout(containerWidth, itemWidth * 1.35);
            }
          },
        ),
      ],
    );
  }

  Widget buildRowLayout(double containerWidth, double itemWidth) {
    return Container(
      width: containerWidth,
      height: 140.0,
      decoration: BoxDecoration(
        color: lightColor().withOpacity(.15),
        borderRadius: BorderRadius.circular(25.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          CustomDropdown(
            defaultTitle: 'Cinema',
            options: const ['Anga Diamond', 'Anga Sky', 'Anga CBD'],
            width: itemWidth,
            backgroundColor: secondaryColor(),
            borderRadius: BorderRadius.circular(30.0),
            isUnderlined: false,
            underline: const SizedBox(),
            icon: Icons.location_on,
          ),
          SizedBox(
            width: itemWidth,
            child: const CustomDateTimePicker(),
          ),
          CustomDropdown(
            defaultTitle: 'Experience',
            options: const ['Anga Diamond', 'Anga Sky', 'Anga CBD'],
            width: itemWidth,
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
            width: 215.0,
            icon: Icons.search,
            style: GoogleFonts.roboto(
              color: darkColor(),
              fontSize: 18.0,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildIntermediateLayout(double containerWidth, double itemWidth) {
    return Container(
      width: containerWidth,
      height: 200.0,
      decoration: BoxDecoration(
        color: lightColor().withOpacity(.15),
        borderRadius: BorderRadius.circular(25.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CustomDropdown(
                defaultTitle: 'Cinema',
                options: const ['Anga Diamond', 'Anga Sky', 'Anga CBD'],
                width: itemWidth,
                backgroundColor: secondaryColor(),
                borderRadius: BorderRadius.circular(30.0),
                isUnderlined: false,
                underline: const SizedBox(),
                icon: Icons.location_on,
              ),
              SizedBox(
                width: itemWidth,
                child: const CustomDateTimePicker(),
              ),
              CustomDropdown(
                defaultTitle: 'Experience',
                options: const ['Anga Diamond', 'Anga Sky', 'Anga CBD'],
                width: itemWidth,
                backgroundColor: secondaryColor(),
                borderRadius: BorderRadius.circular(30.0),
                isUnderlined: false,
                underline: const SizedBox(),
                icon: Icons.visibility,
              ),
            ],
          ),
          const SizedBox(height: 20),
          CustomElevatedButton(
            text: 'Check Availability',
            fontWeight: FontWeight.w700,
            onPressed: () {},
            color: darkColor(),
            bgColor: primaryColor(),
            borderRadius: 20.0,
            height: 40.0,
            width: 215.0,
            icon: Icons.search,
            style: GoogleFonts.roboto(
              color: darkColor(),
              fontSize: 20.0,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildColumnLayout(double containerWidth, double itemWidth) {
    return Container(
      width: containerWidth,
      height: 280.0,
      decoration: BoxDecoration(
        color: lightColor().withOpacity(.15),
        borderRadius: BorderRadius.circular(25.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CustomDropdown(
              defaultTitle: 'Cinema',
              options: const ['Anga Diamond', 'Anga Sky', 'Anga CBD'],
              width: itemWidth,
              backgroundColor: secondaryColor(),
              borderRadius: BorderRadius.circular(30.0),
              isUnderlined: false,
              underline: const SizedBox(),
              icon: Icons.location_on,
            ),
            SizedBox(
              width: itemWidth,
              child: const CustomDateTimePicker(),
            ),
            CustomDropdown(
              defaultTitle: 'Experience',
              options: const ['Anga Diamond', 'Anga Sky', 'Anga CBD'],
              width: itemWidth,
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
              width: 215.0,
              icon: Icons.search,
              style: GoogleFonts.roboto(
                color: darkColor(),
                fontSize: 20.0,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
