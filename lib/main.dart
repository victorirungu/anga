import 'package:anga/views/pages/navigator.dart';
import 'package:anga/views/themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Anga Cinemas',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: secondaryColor()),
        useMaterial3: true,
      ),
      home: const CustomNavigator(),
    );
  }
}
