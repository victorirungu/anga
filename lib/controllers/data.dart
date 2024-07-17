import 'package:get/get.dart';


enum SelectedTab { home, search, myTickets, profile }

class DataController extends GetxController {
//identity data
  var userid = "".obs;
  var accessToken = "".obs;
  var username = "".obs;

  var signIn = true.obs;

  //themes
  var dark = false.obs;

  //online status
  var online = true.obs;





}
