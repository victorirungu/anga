import 'dart:convert';

import 'package:anga/respository/network_request.dart';

class UserModel {
  String userid;
  String username;
  String phone;
  String password;
  String accessToken;
  String platform;
  List tickets;

  UserModel({
    required this.userid,
    required this.username,
    required this.phone,
    required this.password,
    required this.accessToken,
    required this.platform,
    required this.tickets,
  });

  authenticateUser(platform) async {
    Map res = await networkRequest(
        url: 'https://angacinemas.com/anga/v2/login.php',
        headers: {},
        body: {'staff_number': '1211', 'password': '1234'});

    return res;
  }

  fetchCinemas(accessToken) async {
    print("this is accessToken: $accessToken");
    Map res = await networkRequest(
        url: 'https://angacinemas.com/anga/v2/get_movies_3.php',
        headers: {
          // 'Authorization': 'Bearer $accessToken',
          // 'Content-Type': 'application/json'
        },
        body: {
          'date': '',
          'cinema': '',
          'shows': 'false'
        });

    Map jsonData = res;
    List<dynamic> films = jsonData['data'];
    List<Map<String, dynamic>> groupedFilms = [];

    for (var film in films) {
      Map<String, dynamic> groupedFilm = {
        "film_id": film["film_id"],
        "film_title": film["film_title"],
        "film_synopsis": film["film_synopsis"],
        "film_genre": film["film_genre"],
        "film_duration": film["film_duration"],
        "film_format": film["film_format"],
        "poster": film["poster"],
        "banner": film["banner"],
        "shows": []
      };

      Map<String, dynamic> shows = film["shows"];
      for (var key in shows.keys) {
        if (shows[key] is Map) {
          groupedFilm["shows"].add(shows[key]);
        }
      }
      print(groupedFilms);

      print('\n\n\n\n');
      groupedFilms.add(groupedFilm);
    }

    return res;
  }
}
