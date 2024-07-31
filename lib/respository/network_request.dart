import 'dart:convert';
import 'dart:io';
import 'package:anga/controllers/internet.dart';
import 'package:http/http.dart' as http;

ConnectivityController internet = ConnectivityController();
Future<Map> networkRequest({
  required String url,
  required Map<String, String> headers,
  required body,
}) async {
  int retryCount = 0;
  const maxRetries = 2;
  bool requestSucceeded = false;
  while (retryCount < maxRetries && !requestSucceeded) {
    if (await internet.checkInternetConnectivity()) {
      try {
        final response = await http.post(
          Uri.parse(url),
          headers: headers,
          body: body,
        );
        if (response.statusCode == 200) {
          return jsonDecode(response.body);
        } else {
          return {
            'success': false,
            'message': "Sorry! Couldn't reach servers. Try again Later"
          };
        }
      } catch (e) {
        print(e);
        retryCount++;
      }
    } else {
      retryCount++;
    }
    if (!requestSucceeded && retryCount < maxRetries) {
      await Future.delayed(const Duration(seconds: 1));
    }
  }
  if (!requestSucceeded) {
    Map resultFailed = {'success': false, 'message': 'No Internet Connection.'};
    return resultFailed;
  }
}
