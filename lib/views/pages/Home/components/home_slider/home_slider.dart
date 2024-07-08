import 'package:anga/views/functions/resolution.dart';
import 'package:anga/views/pages/Home/components/home_slider/carousel_animations.dart';
import 'package:anga/views/themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeSlider extends StatelessWidget {
  const HomeSlider({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> items = [
      {
        'id': '1',
        'name': 'Kraven',
        'image': 'images/homepage1.jpg',
      },
      {
        'id': '2',
        'name': 'Furiosa: A Mad Max Saga(2024)',
        'image': 'images/homepage2.jpg',
      },
      {
        'id': '3',
        'name': 'Bad Boys',
        'image': 'images/homepage4.jpg',
      },
      {
        'id': '4',
        'name': 'Inside Out 2',
        'image': 'images/homepage55.jpg',
      },
      {
        'id': '5',
        'name': 'Despicable me 4',
        'image': 'images/homepage66.jpeg',
      },
    ];
    Map resolution = getResolution(context);
    double width = resolution['width'];
    return Swiper(
      itemBuilder: (BuildContext context, int index) {
        return Stack(children: [
          SizedBox(
            height: 600.0,
            width: width,
            child: Image.asset(
              items[index]['image']!,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
              child: Container(
            color: Colors.black.withOpacity(.55),
            height: 600.0,
            width: width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    width: width * .077,
                    height: width * .077,
                    decoration: BoxDecoration(
                      color: secondaryColor(),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.play_circle_fill_rounded,
                      color: primaryColor(),
                      size: width * .075,
                    )),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: Container(
                      constraints: BoxConstraints(maxWidth: width / 2),
                      child: Text(
                        items[index]['name']!,
                        style: GoogleFonts.abrilFatface(
                            color: lightColor(),
                            fontSize: width * .055,
                            fontWeight: FontWeight.bold),
                      )),
                ),
              ],
            ),
          ))
        ]);
      },
      itemCount: items.length,
      pagination: const SwiperPagination(
        builder: SwiperPagination.rect,
      ),
      autoplay: true,
      duration: 1000,
      indicatorLayout: PageIndicatorLayout.COLOR,
      layout: SwiperLayout.DEFAULT,
      autoplayDelay: 7000,
      allowImplicitScrolling: true,
      curve: Curves.ease,
      fade: 1.0,
      control: SwiperControl(
        containerSize: width * .09 < 60.0 ? width * .08 : 60.0,
        color: lightColor(),
        padding: const EdgeInsets.symmetric(horizontal: 40.0),
        size: width * .035,
        iconNext: Icons.arrow_forward_ios_rounded,
        iconPrevious: Icons.arrow_back_ios_rounded,
      ),
    );
  }
}
