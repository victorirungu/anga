import 'package:anga/controllers/navigation.dart';
import 'package:anga/views/themes/themes.dart';
import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MobileNavigation extends StatelessWidget {
MobileNavigation({super.key});
final NavigationController navigationController = Get.put(NavigationController());
  @override
  Widget build(BuildContext context) {
    return Container(
      color: themeColorTransparent().withOpacity(.0),
      height: 68.0,
      child: FloatingNavbar(
        borderRadius: 20.0,
        backgroundColor: themeColorTransparent(),
        padding: const EdgeInsets.all(0.0),
        margin: const EdgeInsets.all(0.0),
        selectedBackgroundColor: primaryColor(),
        iconSize: 20.0,
        onTap: (int val) {
          // Update to navigate with GetX
          switch (val) {
            case 0:
              Get.toNamed('/home');
              break;
            case 1:
              // Add corresponding route
              break;
            case 2:
              // Add corresponding route
              break;
            case 3:
              // Add corresponding route
              break;
            case 4:
              Get.toNamed('/contacts');
              break;
            default:
              Get.toNamed('/home');
          }
        },
        currentIndex: navigationController.activeIndex.value,
        items: [
          FloatingNavbarItem(icon: Icons.home, title: 'Home'),
          FloatingNavbarItem(icon: Icons.search, title: 'Search'),
          FloatingNavbarItem(icon: Icons.event, title: 'Events'),
          FloatingNavbarItem(icon: Icons.person, title: 'My Profile'),
          FloatingNavbarItem(icon: Icons.phone, title: 'Contact'),
        ],
      ),
    );
  }
}
