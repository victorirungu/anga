import 'package:flutter/material.dart';
Color primaryColor() {
  return const Color.fromARGB(255, 235, 185, 49);
  // return Color.fromARGB(255, 211, 138, 21);
}

Color darkColor() {
  return const Color.fromARGB(235, 70, 68, 68);
}
Color lightColor() {
  return const Color.fromARGB(235, 255, 255, 255);
}

// Color themeColorBackGround() {
//   if (dataController.dark.value) {
//     return const Color.fromARGB(235, 40, 42, 46);
//   } else {
//     return const Color.fromARGB(255, 246, 245, 245);
//   }
// }

// Color themeColorForeGround() {
//   if (dataController.dark.value) {
//     return const Color.fromARGB(255, 246, 245, 245);
//   } else {
//     return const Color.fromARGB(235, 25, 24, 24);
//   }
// }

Color secondaryColor() {
  return const Color.fromARGB(255, 31, 10, 188);
}

Color themeColorWhite() {
  return const Color.fromARGB(235, 246, 245, 245);
}

Color themeColorGrey() {
  return const Color.fromARGB(255, 113, 113, 113);
}

Color themeColorTransparent() {
  return const Color.fromARGB(0, 255, 255, 255);
}


Color themeColorError() {
  return const Color.fromARGB(255, 215, 19, 5);
}

Color themeColorWarning() {
  return Colors.orange;
}