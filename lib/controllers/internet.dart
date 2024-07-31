import 'dart:async';
import 'dart:io';

import 'package:connectivity/connectivity.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ConnectivityController extends GetxController {
  var connectivityStatus = ''.obs;
  RxBool internetConnection = false.obs;

  @override
  Future<void> onInit() async {
    super.onInit();
    subscribeToConnectivityChanges(); // Subscribe to connectivity changes
  }

  void subscribeToConnectivityChanges() {
    Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) async {
      await setConnectivityStatus(result);
    });
  }

  Future<void> setConnectivityStatus(
      ConnectivityResult connectivityResult) async {
    internetConnection.value = await checkInternetConnectivity();
    switch (connectivityResult) {
      case ConnectivityResult.none:
        connectivityStatus.value = '0';
        break;
      case ConnectivityResult.wifi:
        if (internetConnection.value) {
          connectivityStatus.value = 'Connected to Wi-Fi';
        } else {
          connectivityStatus.value = 'Wi-Fi connected, no active internet';
        }

        break;
      case ConnectivityResult.mobile:
        if (internetConnection.value) {
          connectivityStatus.value = 'Connected to mobile network';
        } else {
          connectivityStatus.value =
              'Mobile network connected, no active internet';
        }

        break;
      default:
        connectivityStatus.value = 'Unknown';

        break;
    }
  }


  Future<bool> checkInternetConnectivity() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    
    if (connectivityResult == ConnectivityResult.none) {
      return false;
    } else {
      try {
        final response = await http
            .head(Uri.parse('https://www.fixafrica.co.ke'))
            .timeout(const Duration(seconds: 10));
        if (response.statusCode == 200) {
          return true;
        } else {
          return false;
        }
      } on SocketException catch (_) {
       
        // Handle no network
        return false;
      } on TimeoutException catch (_) {
         
        // Handle timeout
        return false;
      } catch (e) {
        return false;
      }
    }
  }
}
