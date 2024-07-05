import 'package:anga/views/pages/Contacts/contacts.dart';
import 'package:anga/views/pages/Home/home.dart';
import 'package:anga/views/pages/app_bar.dart';
import 'package:anga/views/themes/themes.dart';
import 'package:flutter/material.dart';

GlobalKey<NavigatorState> mainNavigatorKey = GlobalKey<NavigatorState>();

class CustomNavigator extends StatelessWidget {
  const CustomNavigator({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryBackGround(),
      body: Stack(
        children: [
          Positioned.fill(
            child: Navigator(
              key: mainNavigatorKey,
              onGenerateRoute: (RouteSettings settings) {
                switch (settings.name) {
                  case '/home':
                    return MaterialPageRoute(builder: (_) => Home());
                  case '/contacts':
                    return MaterialPageRoute(builder: (_) => Contacts());
                  default:
                    return MaterialPageRoute(
                        builder: (_) => Home()); // Fallback route
                }
              },
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            child: CustomAppBar(mainNavigatorKey: mainNavigatorKey),
          ),
        ],
      ),
    );
  }
}
