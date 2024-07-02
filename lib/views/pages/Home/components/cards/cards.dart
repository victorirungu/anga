import 'package:anga/views/themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animated_button/flutter_animated_button.dart';
import 'package:google_fonts/google_fonts.dart';


class InteractiveCard extends StatelessWidget {
  final String name;
  final String image;
  const InteractiveCard({super.key, required this.name, required this.image});

  @override
  Widget build(BuildContext context) {
    return 
     Column(
       children: [
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
                side: const BorderSide(color: Colors.transparent, width: 0),
              ),
              elevation: 10,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Column(
                  children: [
                    Image.asset(image, 
                      width: 300,
                      height: 400,
                      fit: BoxFit.cover,
                    ),
     
          Padding(
                 padding: const EdgeInsets.fromLTRB(12.0,4.0,0.0,4.0),
                 child: Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     Text(
                       name,
                       style: GoogleFonts.roboto(
                         fontSize: 15,
                         fontWeight: FontWeight.bold,
                       ),
                     ),
                   ],
                 ),
               ),
               Padding(padding: const EdgeInsets.fromLTRB(12.0,4.0,0.0,4.0),
                 child: AnimatedButton(
                              onPress: (){},
                   height: 30,
                   width: 120,
                   text: 'Book now',
                   isReverse: true,animatedOn: AnimatedOn.onHover,
                   selectedTextColor: darkColor(),
                   transitionType: TransitionType.LEFT_TO_RIGHT,
                   textStyle:TextStyle(color: darkColor()),
                   backgroundColor: lightColor(),
                   borderColor: primaryColor(),
                   borderWidth: 1.0,
                   borderRadius: 8,
                   selectedBackgroundColor: primaryColor(),
                 ),
               ),
                   
                  ],
                ),
              ),
            
            
          ),
        ),
       
       ],
     
         );
  }
}