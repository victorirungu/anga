import 'package:anga/views/themes/themes.dart';
import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  final String text;
  final double width;
  final VoidCallback onPressed;
  final Color color;
  final Color bgColor;
  final double borderRadius;
  final FontWeight fontWeight;
  final IconData? icon;
  final TextStyle? style;
  final double height;

  const CustomElevatedButton({
    super.key,
    required this.text,
    required this.width,
    required this.onPressed,
    this.color = Colors.black,
    this.bgColor = Colors.white,
    this.borderRadius = 5.0,
    this.fontWeight = FontWeight.w400,
    this.icon,
    this.style,
    this.height = 30.0,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        onPressed: onPressed,

        style: TextButton.styleFrom(
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
        ),
        child: icon != null
            ? Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(
                    icon,
                    color: darkColor(),
                    size: 25.0,
                  ),
                  Text(text, style: style),
                ],
              )
            : Text(text, style: style),
      ),
    );
  }
}
