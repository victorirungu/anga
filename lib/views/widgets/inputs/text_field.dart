import 'package:anga/views/themes/themes.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String hint;
  final int maxLines;
  final bool fillColor;

  const CustomTextField(
      {super.key,
      required this.hint,
      this.fillColor = false,
      this.maxLines = 1});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: maxLines,
      decoration: InputDecoration(
        filled: true,
        fillColor: fillColor ? primaryColor() : primaryForeGround(),
        floatingLabelStyle:
            TextStyle(color: themeColorTransparent(), fontSize: 1.0),
        labelText: hint,
        labelStyle: TextStyle(color: primaryBackGround(), fontSize: 20.0),
        hintText: hint,
        hintStyle: TextStyle(
            color: primaryBackGround().withOpacity(.6), fontSize: 20.0),
        border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(15.0)),
      ),
    );
  }
}
