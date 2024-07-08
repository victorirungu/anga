import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ScrollControllerManager extends GetxController {
  ScrollController? homeScrollController;
  ScrollController? contactsScrollController;

  void initScrollControllers() {
    homeScrollController = ScrollController();
    contactsScrollController = ScrollController();
  }

  @override
  void dispose() {
    super.dispose();
    homeScrollController?.dispose();
    contactsScrollController?.dispose();
  }
}
