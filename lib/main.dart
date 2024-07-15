import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:anga/views/themes/themes.dart';
import 'package:anga/controllers/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  setUrlStrategy(PathUrlStrategy());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  String getInitialRoute() {
    if (kIsWeb) {
      final Uri uri = Uri.base;
      String route = (uri.pathSegments.isNotEmpty ? uri.pathSegments.last : '');
      if (route != '') {
        return '/$route';
      }
    }
    return '/';
  }

  @override
  Widget build(BuildContext context) {
    final initialRoute = getInitialRoute();
    return GetMaterialApp(
      title: 'Anga Cinemas',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: secondaryColor()),
        useMaterial3: true,
      ),
      getPages: AppRoutes.routes,
      initialRoute: initialRoute,
    );
  }
}
