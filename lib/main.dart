import 'package:anga/controllers/routes.dart';
import 'package:anga/views/pages/Home/home.dart';
import 'package:anga/views/themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:get/get.dart';

void main() {
  setUrlStrategy(PathUrlStrategy());
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
      getPages: AppRoutes.routes,
      home: Home(),
    );
  }
}
