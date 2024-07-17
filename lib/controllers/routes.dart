import 'package:anga/views/pages/Authentication/auth.dart';
import 'package:anga/views/pages/ComingSoons/coming_soon.dart';
import 'package:anga/views/pages/Contacts/contacts.dart';
import 'package:anga/views/pages/Film/film.dart';
import 'package:anga/views/pages/Home/home.dart';
import 'package:get/get.dart';

class AppRoutes {
  static final routes = [
    GetPage(
      name: '/',
      page: () => Home(),
    ),
    GetPage(
      name: '/home',
      page: () => Home(),
    ),
    GetPage(
      name: '/coming-soon',
      page: () => ComingSoonComplete(),
    ),
    GetPage(
      name: '/contacts',
      page: () => Contacts(),
    ),
    GetPage(
      name: '/auth',
      page: () => Authentication(),
    ),
    GetPage(name: '/film', page: () => Film()),
  ];
}
