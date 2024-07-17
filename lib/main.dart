import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:anga/views/themes/themes.dart';
import 'package:anga/controllers/routes.dart';
import 'package:uni_links/uni_links.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:async';

void main() {
  setUrlStrategy(PathUrlStrategy());
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  late StreamSubscription _sub;
  bool checkLink = false;
  String route = '';
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);

    if (kIsWeb) {
      handleWebLinks();
    } else {
      initUniLinks();
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
    _sub.cancel();
  }

  Future<void> initUniLinks() async {
    // ignore: deprecated_member_use
    _sub = getLinksStream().listen(
      (String? link) {
        if (link != null) {
          handleLink(link);
        }
      },
      onError: (err) {},
    );

    // Handle the initial link
    String? initialLink = await getInitialLink();
    if (initialLink != null) {
      handleLink(initialLink);
    }
  }

  void handleLink(String link) {
    Uri uri = Uri.parse(link);

    route = (uri.pathSegments.isNotEmpty ? uri.pathSegments.last : '');
    if (route != '') {
      checkLink = true;
    }
  }

  void handleWebLinks() {
    final Uri uri = Uri.base;
    route = (uri.pathSegments.isNotEmpty ? uri.pathSegments.last : '');
    if (route != '') {
      checkLink = true;
    }
  }

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
      initialRoute: checkLink ? '/$route' : '/',
    );
  }
}
