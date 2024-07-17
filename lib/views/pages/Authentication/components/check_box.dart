import 'package:get/get.dart';

class CheckboxController extends GetxController {
  var isChecked = false.obs;

  onCheckboxChanged(newValue) {
    isChecked.value = newValue;
  }
}