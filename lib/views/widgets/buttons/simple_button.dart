import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
final String text;
final double width;
final Function onPressed;
final Color color;
final Color bgColor;
final double borderRadius;
final FontWeight fontWeight;
final double height;


  const CustomElevatedButton({super.key, required this.text, required this.width, required this.onPressed, this.color = Colors.black, this.bgColor=Colors.white,this.borderRadius = 5.0, this.fontWeight=FontWeight.w400,this.height = 30.0 });
  @override
  Widget build(BuildContext context) {
    return   Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(onPressed: (){},style: TextButton.styleFrom(
                                      backgroundColor: bgColor,
                                      fixedSize: Size(width, height),
                                      padding: const EdgeInsets.all(5.0),
                                    
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(borderRadius),
                                        side: BorderSide(
                    color: color, 
                    width: 1.0, 
                  ),
      
                                      ),
                                    ), child: Text(text),),
    );
  }
}