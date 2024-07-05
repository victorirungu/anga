import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  final Color color;
  final String fontFamily;
  final double fontSize;
  final FontWeight fontWeight;
  final FontStyle fontStyle;
  final double letterSpacing;
  const CustomText(
      {super.key,
      required this.text,
      this.letterSpacing = 1.0,
      this.color = Colors.black,
      this.fontFamily = '',
      this.fontSize = 16.0,
      this.fontWeight = FontWeight.w300,
      this.fontStyle = FontStyle.normal});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          color: color,
          fontFamily: fontFamily,
          fontSize: fontSize,
          fontWeight: fontWeight,
          fontStyle: fontStyle,
          letterSpacing: letterSpacing),
    );
  }
}
