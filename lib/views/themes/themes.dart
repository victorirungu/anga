import 'package:anga/controllers/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

ThemeController themeController = Get.put(ThemeController());
//primary_and_secondary_colors
Color primaryColor() => const Color.fromARGB(255, 255, 222, 4);
Color secondaryColor() => const Color.fromARGB(255, 34, 74, 255);
//ligt_and_dark_themes
Color darkColor() => const Color.fromARGB(250, 21, 21, 21);
Color lightColor() => const Color.fromARGB(255, 246, 245, 245);
//theme_dependent_colors
Color primaryBackGround() =>
    themeController.dark.value ? darkColor() : lightColor();
Color primaryForeGround() =>
    themeController.dark.value ? lightColor() : darkColor();
//response_colors
Color themeColorError() => const Color.fromARGB(255, 215, 19, 5);
Color themeColorWarning() => Colors.orange;
//others
Color themeColorGrey() => const Color.fromARGB(255, 199, 199, 199);
Color themeColorTransparent() => const Color.fromARGB(0, 255, 255, 255);
Color colorBlack() => Colors.black;
