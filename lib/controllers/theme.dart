import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeController extends GetxController {
  var dark = true.obs;

  toggleThemeMode() async {
    dark.value = !dark.value;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('dark', dark.value);
  }

}