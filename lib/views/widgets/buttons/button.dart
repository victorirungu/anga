import 'package:anga/views/themes/themes.dart';
import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
final String text;
final double width;
final Function onPressed;
 Color color = darkColor();


   CustomElevatedButton({super.key, required this.text, required this.width, required this.onPressed, this.color = Colors.black});
  @override
  Widget build(BuildContext context) {
    return   Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(onPressed: (){},style: TextButton.styleFrom(
                                      backgroundColor: lightColor(),
                                      fixedSize: Size(width, 30.0),
                                      padding: const EdgeInsets.all(5.0),
                                    
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(5.0),
                                        side: BorderSide(
                    color: color, 
                    width: 1.0, 
                  ),
      
                                      ),
                                    ), child: Text(text),),
    );
  }
}