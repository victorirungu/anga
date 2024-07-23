import 'package:anga/views/themes/themes.dart';
import 'package:anga/views/widgets/buttons/simple_button.dart';
import 'package:flutter/material.dart';

class FilmCategories extends StatelessWidget {
  final double width;
  const FilmCategories({super.key, required this.width});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width * .75,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          CustomElevatedButton(
            text: 'All Films ',
            width: 140.0,
            onPressed: () {},
            bgColor: const Color.fromARGB(255, 47, 47, 47),
            color: const Color.fromARGB(255, 47, 47, 47),
            borderRadius: 15.0,
            height: 40.0,
            style: TextStyle(
                color: lightColor().withOpacity(.5),
                fontSize: 18.0,
                letterSpacing: 1.3,
                fontWeight: FontWeight.w700),
          ),
          CustomElevatedButton(
            text: '2D ',
            width: 140.0,
            onPressed: () {},
            bgColor: secondaryColor(),
            color: secondaryColor(),
            borderRadius: 15.0,
            height: 40.0,
            style: TextStyle(
                color: lightColor(),
                fontSize: 18.0,
                letterSpacing: 1.3,
                fontWeight: FontWeight.w700),
          ),
          CustomElevatedButton(
            text: '3D ',
            width: 140.0,
            onPressed: () {},
            bgColor: const Color.fromARGB(255, 47, 47, 47),
            color: const Color.fromARGB(255, 47, 47, 47),
            borderRadius: 15.0,
            height: 40.0,
            style: TextStyle(
                color: lightColor().withOpacity(.5),
                fontSize: 18.0,
                letterSpacing: 1.3,
                fontWeight: FontWeight.w700),
          ),
          CustomElevatedButton(
            text: 'Panari/Sky',
            width: 140.0,
            onPressed: () {},
            bgColor: const Color.fromARGB(255, 47, 47, 47),
            color: const Color.fromARGB(255, 47, 47, 47),
            borderRadius: 15.0,
            height: 40.0,
            style: TextStyle(
                color: lightColor().withOpacity(.5),
                fontSize: 18.0,
                letterSpacing: 1.3,
                fontWeight: FontWeight.w700),
          ),
          CustomElevatedButton(
            text: 'Diamond ',
            width: 140.0,
            onPressed: () {},
            bgColor: secondaryColor(),
            color: secondaryColor(),
            borderRadius: 15.0,
            height: 40.0,
            style: TextStyle(
                color: lightColor(),
                fontSize: 18.0,
                letterSpacing: 1.3,
                fontWeight: FontWeight.w700),
          ),
          CustomElevatedButton(
            text: 'CBD ',
            width: 140.0,
            onPressed: () {},
            bgColor: const Color.fromARGB(255, 47, 47, 47),
            color: const Color.fromARGB(255, 47, 47, 47),
            borderRadius: 15.0,
            height: 40.0,
            style: TextStyle(
                color: lightColor().withOpacity(.5),
                fontSize: 18.0,
                letterSpacing: 1.3,
                fontWeight: FontWeight.w700),
          ),
        ],
      ),
    );
  }
}
