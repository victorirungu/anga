import 'package:anga/views/pages/Contacts/contacts.dart';
import 'package:anga/views/pages/Home/home.dart';
import 'package:get/get.dart';

class AppRoutes {
  static final routes = [
    GetPage(
      name: '/home',
      page: () => Home(),
    ),
    GetPage(
      name: '/contacts',
      page: () => Contacts(),
    ),
  ];
}
