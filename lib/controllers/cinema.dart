import 'dart:convert';

import 'package:get/get.dart';

class CinemaController extends GetxController {
  var selectedLocationId = 1.obs;
  var selectedLocationCinema = {}.obs;

  var locations = [
    {
      'id': '1',
      'name': 'ANGA DIAMOND',
      'location': 'Diamond Plaza',
      'desc': '',
      'cinemas': jsonEncode([
        {
          'id': '1',
          'name': 'Kraven',
          'image': 'images/homepage1.jpg',
        },
        {
          'id': '2',
          'name': 'Furiosa',
          'image': 'images/homepage2.jpg',
        },
        {
          'id': '3',
          'name': 'Bad Boys',
          'image': 'images/homepage4.jpg',
        },
        {
          'id': '4',
          'name': 'Inside Out 2',
          'image': 'images/homepage55.jpg',
          'date': 'Mon 29th Jul 2024',
          'time': '12:00 PM',
          'location': 'Anga Diamond'
        },
        {
          'id': '5',
          'name': 'Despicable me 4',
          'image': 'images/homepage66.jpeg',
          'date': 'Mon 29th Jul 2024',
          'time': '07:00 PM',
          'location': 'Anga Diamond'
        },
      ])
    },
    {
      'id': '2',
      'name': 'ANGA SKY ',
      'location': 'Sky Location',
      'desc': '',
      'cinemas': jsonEncode([
        {
          'id': '1',
          'name': 'Kraven',
          'image': 'images/homepage1.jpg',
        },
        {
          'id': '2',
          'name': 'Furiosa',
          'image': 'images/homepage2.jpg',
        },
        {
          'id': '3',
          'name': 'Bad Boys',
          'image': 'images/homepage4.jpg',
        },
      ])
    },
    {
      'id': '3',
      'name': 'ANGA CBD',
      'location': 'CBD Location',
      'desc': '',
      'cinemas': jsonEncode([
        {
          'id': '1',
          'name': 'Kraven',
          'image': 'images/homepage1.jpg',
        },
        {
          'id': '2',
          'name': 'Furiosa',
          'image': 'images/homepage2.jpg',
        },
      ])
    },
  ];

  final List items = [
    {
      'id': '4',
      'name': 'Inside Out 2',
      'image': 'images/homepage55.jpg',
    },
    {
      'id': '5',
      'name': 'Despicable me 4',
      'image': 'images/homepage66.jpeg',
    },
  ];

  @override
  void onInit() {
    super.onInit();
    updateLocationCinema();
  }

  updateLocation(int id) {
    selectedLocationId.value = id;
    updateLocationCinema();
  }

  void updateLocationCinema() {
    selectedLocationCinema.value = locations.firstWhere(
      (location) => int.parse(location['id']!) == selectedLocationId.value,
      orElse: () => locations[0],
    );
  }
}
