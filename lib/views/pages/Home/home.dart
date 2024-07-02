import 'package:anga/views/pages/Home/cinema.dart';
import 'package:anga/views/pages/Home/components/home_slider/home_slider.dart';
import 'package:anga/views/pages/appBar.dart';
import 'package:anga/views/themes/themes.dart';
import 'package:anga/views/widgets/buttons/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animated_button/flutter_animated_button.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
body: SizedBox(
  height: MediaQuery.of(context).size.height,
  child: SingleChildScrollView(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Stack(
          children: [SizedBox(
            height: 550.0,
            width: MediaQuery.of(context).size.width,
            child: const HomeSlider()),
            
         const CustomAppBar()
            
            ,Positioned(
              bottom: 130.0,
              left: 80.0,
              child:  AnimatedButton(
              onPress: (){},
                  height: 50,
                  width: 200,
                  text: 'BOOK NOW',
                  
                  isReverse: true,animatedOn: AnimatedOn.onHover,
                  selectedTextColor: darkColor(),
                  transitionType: TransitionType.LEFT_TO_RIGHT,
                  textStyle:TextStyle(color: lightColor()),
                  backgroundColor: secondaryColor(),
                  borderColor: themeColorTransparent(),
                  borderRadius: 50,
                  selectedBackgroundColor: primaryColor(),
                ),)
            
            ],
        ),
    
    
       const Padding(
          padding:  EdgeInsets.fromLTRB(30.0,12.0,12.0,0.0),
          child: Align( alignment: Alignment.centerLeft,
            child: Row(
              children: [
                Text("Now",style: TextStyle(fontSize: 21.0,fontWeight: FontWeight.w800),),
                 Text(" Showing",style: TextStyle(fontSize: 21.0,fontFamily: '',fontWeight: FontWeight.w300),),
              ],
            )),
        ),
    
        Padding(
          padding: const EdgeInsets.symmetric(horizontal:  25.0,vertical: 8.0),
          child: Row(
            
            children: [
           

CustomElevatedButton(text: "All",width: 60.0,onPressed: (){},color: primaryColor()),
CustomElevatedButton(text: "Anga Diamond",width: 120.0,onPressed: (){},),
CustomElevatedButton(text: "Anga Sky",width: 80.0,onPressed: (){},),
CustomElevatedButton(text: "Anga CBD",width: 80.0,onPressed: (){},),
            ],
          ),
        ),
      
const Cinema(),









      ],
    
    
    
    
    ),
  ),
),
















    );
  }
}