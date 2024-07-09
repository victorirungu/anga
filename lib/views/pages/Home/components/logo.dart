import 'package:anga/views/functions/resolution.dart';
import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  const Logo({super.key});

  @override
  Widget build(BuildContext context) {
    Map resolution = getResolution(context);
    double width = resolution['width'];
    return Padding(
      padding: const EdgeInsets.only(left: 30.0),
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: () {},
          child: SizedBox(
              width: width * .065 < 55.0 ? 55.0 : width * .065,
              child: const Image(image: AssetImage("images/logo.png"))),
        ),
      ),
    );
  }
}
