import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:anga/models/user.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  final UserModel _usermodel;

  UserController({
    String userid = '',
    String username = '',
    String phone = '',
    String password = '',
    String accessToken = '',
    String platform = '',
    List tickets = const [],
  }) : _usermodel = UserModel(
            username: username,
            phone: phone,
            password: password,
            userid: userid,
            accessToken: accessToken,
            platform: platform,
            tickets: tickets);

  var accessToken = "".obs;

  authenticateUser() async {
    try {
      Map res = await _usermodel.authenticateUser(kIsWeb);
      if (res['success']) {
        accessToken.value = res['data']['token'];
         Map cinemas = await _usermodel.fetchCinemas(accessToken.value);
      }
      return res;
    } catch (e) {
      return {'success': false, 'message': 'An error occurred: $e'};
    }
  }
}
