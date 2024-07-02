import 'package:anga/views/themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:carousel_animations/carousel_animations.dart';



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
      'name': 'Furiosa',
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
    return Swiper(
        itemBuilder: (BuildContext context,int index){
         return Stack(
           children: [SizedBox(
            width: MediaQuery.of(context).size.width,
             child: Image.asset(
               items[index]['image']!,
               fit: BoxFit.cover,
             ),
           ),Positioned(child: Container(color: Colors.black.withOpacity(.2),
           
           height: 550.0, width: MediaQuery.of(context).size.width,
           child: Padding(
             padding: const EdgeInsets.fromLTRB(80.0,80.0,0.0,0.0),
             child: Align(alignment: Alignment.centerLeft, child: Row(
               children: [
                 Icon(Icons.play_circle,color: primaryColor(),size: 60.0,),
                 Text(items[index]['name']!,style:  TextStyle(color: lightColor(), fontSize: 70.0,fontWeight: FontWeight.w700,fontFamily: 'Anton'),),
               ],
             )),
           ),
           
           
           
           
           
           
           ))]
         );
        },
        itemCount: items.length,
        pagination: const SwiperPagination(builder: SwiperPagination.dots,),
        autoplay: true,
        duration: 1000,
        indicatorLayout: PageIndicatorLayout.COLOR,
        layout: SwiperLayout.DEFAULT,
        autoplayDelay: 7000,
allowImplicitScrolling: true,
curve: Curves.slowMiddle,
        fade: 1.0,


        control: SwiperControl(color: secondaryColor(),padding: const EdgeInsets.symmetric(horizontal: 15.0),size: 40.0 ),

      );
  }
}
