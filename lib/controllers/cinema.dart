import 'dart:convert';

import 'package:get/get.dart';
import 'package:intl/intl.dart';

class CinemaController extends GetxController {
  var selectedLocationId = 1.obs;
  var selectedLocationCinema = {}.obs;

 RxList schedule = [
    {
      'id': '1',
      'name': 'Kraven',
      'image': 'images/homepage1.jpg',
      'location': 'Diamond',
      'experience': '2D',
      'date': '2024-07-24',
      'times': [
        '10:30am',
        '12:30pm',
        '8:00pm',
      ],
      'duration': '125mins',
      'category': 'action',
    },
    {
      'id': '2',
      'name': 'Furiosa',
      'image': 'images/homepage2.jpg',
      'location': 'Diamond',
      'experience': '2D',
      'date': '2024-07-24',
      'times': [
        '10:30am',
        '12:30pm',
        '8:00pm',
      ],
      'duration': '125mins',
      'category': 'action',
    },
    {
      'id': '3',
      'name': 'Bad Boys',
      'image': 'images/homepage4.jpg',
      'location': 'CBD',
      'experience': '3D',
      'date': '2024-07-25',
      'times': [
        '10:00am',
        '8:00pm',
      ],
      'duration': '118mins',
      'category': 'action',
    },
    {
      'id': '4',
      'name': 'Inside Out 2',
      'image': 'images/homepage55.jpg',
      'location': 'CBD',
      'experience': '3D',
      'date': '2024-07-25',
      'times': [
        '10:00am',
        '8:00pm',
      ],
      'duration': '135mins',
      'category': 'action',
    },
    {
      'id': '5',
      'name': 'Despicable me 4',
      'image': 'images/homepage66.jpeg',
      'location': 'Panari/Sky',
      'experience': '3D',
      'date': '2024-07-26',
      'times': [
        '10:00am',
        '12:00pm',
        '10:00pm',
      ],
      'duration': '135mins',
      'category': 'action',
    },
  ].obs;







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


  var seatsData = {
    "success": true,
    "code": 200,
    "message": "Seats Fetched successfully",
    "data": {
        "seats": [
            {
                "seat": "SA1",
                "status": "available",
                "available": true,
                "temp_uid": "",
                "row": 1,
                "col": 1,
                "seat_type": "space"
            },
            {
                "seat": "SA2",
                "status": "available",
                "available": true,
                "temp_uid": "",
                "row": 1,
                "col": 2,
                "seat_type": "space"
            },
            {
                "seat": "SA3",
                "status": "available",
                "available": true,
                "temp_uid": "",
                "row": 1,
                "col": 3,
                "seat_type": "space"
            },
            {
                "seat": "SA4",
                "status": "available",
                "available": true,
                "temp_uid": "",
                "row": 1,
                "col": 4,
                "seat_type": "space"
            },
            {
                "seat": "A1",
                "status": "available",
                "available": true,
                "temp_uid": "",
                "row": 1,
                "col": 5,
                "seat_type": "normal"
            },
            {
                "seat": "A2",
                "status": "available",
                "available": true,
                "temp_uid": "",
                "row": 1,
                "col": 6,
                "seat_type": "normal"
            },
            {
                "seat": "A3",
                "status": "available",
                "available": true,
                "temp_uid": "",
                "row": 1,
                "col": 7,
                "seat_type": "normal"
            },
            {
                "seat": "A4",
                "status": "available",
                "available": true,
                "temp_uid": "",
                "row": 1,
                "col": 8,
                "seat_type": "normal"
            },
            {
                "seat": "A5",
                "status": "available",
                "available": true,
                "temp_uid": "",
                "row": 1,
                "col": 9,
                "seat_type": "normal"
            },
            {
                "seat": "A6",
                "status": "available",
                "available": true,
                "temp_uid": "",
                "row": 1,
                "col": 10,
                "seat_type": "normal"
            },
            {
                "seat": "A7",
                "status": "available",
                "available": true,
                "temp_uid": "",
                "row": 1,
                "col": 11,
                "seat_type": "normal"
            },
            {
                "seat": "A8",
                "status": "available",
                "available": true,
                "temp_uid": "",
                "row": 1,
                "col": 12,
                "seat_type": "normal"
            },
            {
                "seat": "A9",
                "status": "available",
                "available": true,
                "temp_uid": "",
                "row": 1,
                "col": 13,
                "seat_type": "normal"
            },
            {
                "seat": "A10",
                "status": "available",
                "available": true,
                "temp_uid": "",
                "row": 1,
                "col": 14,
                "seat_type": "normal"
            },
            {
                "seat": "A11",
                "status": "available",
                "available": true,
                "temp_uid": "",
                "row": 1,
                "col": 15,
                "seat_type": "normal"
            },
            {
                "seat": "A12",
                "status": "available",
                "available": true,
                "temp_uid": "",
                "row": 1,
                "col": 16,
                "seat_type": "normal"
            },
            {
                "seat": "A13",
                "status": "available",
                "available": true,
                "temp_uid": "",
                "row": 1,
                "col": 17,
                "seat_type": "normal"
            },
            {
                "seat": "SB1",
                "status": "available",
                "available": true,
                "temp_uid": "",
                "row": 2,
                "col": 1,
                "seat_type": "space"
            },
            {
                "seat": "SB2",
                "status": "available",
                "available": true,
                "temp_uid": "",
                "row": 2,
                "col": 2,
                "seat_type": "space"
            },
            {
                "seat": "SB3",
                "status": "available",
                "available": true,
                "temp_uid": "",
                "row": 2,
                "col": 3,
                "seat_type": "space"
            },
            {
                "seat": "SB4",
                "status": "available",
                "available": true,
                "temp_uid": "",
                "row": 2,
                "col": 4,
                "seat_type": "space"
            },
            {
                "seat": "B1",
                "status": "available",
                "available": true,
                "temp_uid": "",
                "row": 2,
                "col": 5,
                "seat_type": "normal"
            },
            {
                "seat": "B2",
                "status": "available",
                "available": true,
                "temp_uid": "",
                "row": 2,
                "col": 6,
                "seat_type": "normal"
            },
            {
                "seat": "B3",
                "status": "available",
                "available": true,
                "temp_uid": "",
                "row": 2,
                "col": 7,
                "seat_type": "normal"
            },
            {
                "seat": "B4",
                "status": "available",
                "available": true,
                "temp_uid": "",
                "row": 2,
                "col": 8,
                "seat_type": "normal"
            },
            {
                "seat": "B5",
                "status": "available",
                "available": true,
                "temp_uid": "",
                "row": 2,
                "col": 9,
                "seat_type": "normal"
            },
            {
                "seat": "B6",
                "status": "available",
                "available": true,
                "temp_uid": "",
                "row": 2,
                "col": 10,
                "seat_type": "normal"
            },
            {
                "seat": "B7",
                "status": "available",
                "available": true,
                "temp_uid": "",
                "row": 2,
                "col": 11,
                "seat_type": "normal"
            },
            {
                "seat": "B8",
                "status": "available",
                "available": true,
                "temp_uid": "",
                "row": 2,
                "col": 12,
                "seat_type": "normal"
            },
            {
                "seat": "B9",
                "status": "available",
                "available": true,
                "temp_uid": "",
                "row": 2,
                "col": 13,
                "seat_type": "normal"
            },
            {
                "seat": "B10",
                "status": "available",
                "available": true,
                "temp_uid": "",
                "row": 2,
                "col": 14,
                "seat_type": "normal"
            },
            {
                "seat": "B11",
                "status": "available",
                "available": true,
                "temp_uid": "",
                "row": 2,
                "col": 15,
                "seat_type": "normal"
            },
            {
                "seat": "B12",
                "status": "available",
                "available": true,
                "temp_uid": "",
                "row": 2,
                "col": 16,
                "seat_type": "normal"
            },
            {
                "seat": "B13",
                "status": "available",
                "available": true,
                "temp_uid": "",
                "row": 2,
                "col": 17,
                "seat_type": "normal"
            },
            {
                "seat": "SC1",
                "status": "available",
                "available": true,
                "temp_uid": "",
                "row": 3,
                "col": 1,
                "seat_type": "space"
            },
            {
                "seat": "SC2",
                "status": "available",
                "available": true,
                "temp_uid": "",
                "row": 3,
                "col": 2,
                "seat_type": "space"
            },
            {
                "seat": "SC3",
                "status": "available",
                "available": true,
                "temp_uid": "",
                "row": 3,
                "col": 3,
                "seat_type": "space"
            },
            {
                "seat": "SC4",
                "status": "available",
                "available": true,
                "temp_uid": "",
                "row": 3,
                "col": 4,
                "seat_type": "space"
            },
            {
                "seat": "C1",
                "status": "available",
                "available": true,
                "temp_uid": "",
                "row": 3,
                "col": 5,
                "seat_type": "normal"
            },
            {
                "seat": "C2",
                "status": "available",
                "available": true,
                "temp_uid": "",
                "row": 3,
                "col": 6,
                "seat_type": "normal"
            },
            {
                "seat": "C3",
                "status": "available",
                "available": true,
                "temp_uid": "",
                "row": 3,
                "col": 7,
                "seat_type": "normal"
            },
            {
                "seat": "C4",
                "status": "available",
                "available": true,
                "temp_uid": "",
                "row": 3,
                "col": 8,
                "seat_type": "normal"
            },
            {
                "seat": "C5",
                "status": "available",
                "available": true,
                "temp_uid": "",
                "row": 3,
                "col": 9,
                "seat_type": "normal"
            },
            {
                "seat": "C6",
                "status": "available",
                "available": true,
                "temp_uid": "",
                "row": 3,
                "col": 10,
                "seat_type": "normal"
            },
            {
                "seat": "C7",
                "status": "available",
                "available": true,
                "temp_uid": "",
                "row": 3,
                "col": 11,
                "seat_type": "normal"
            },
            {
                "seat": "C8",
                "status": "available",
                "available": true,
                "temp_uid": "",
                "row": 3,
                "col": 12,
                "seat_type": "normal"
            },
            {
                "seat": "C9",
                "status": "available",
                "available": true,
                "temp_uid": "",
                "row": 3,
                "col": 13,
                "seat_type": "normal"
            },
            {
                "seat": "C10",
                "status": "available",
                "available": true,
                "temp_uid": "",
                "row": 3,
                "col": 14,
                "seat_type": "normal"
            },
            {
                "seat": "C11",
                "status": "available",
                "available": true,
                "temp_uid": "",
                "row": 3,
                "col": 15,
                "seat_type": "normal"
            },
            {
                "seat": "C12",
                "status": "available",
                "available": true,
                "temp_uid": "",
                "row": 3,
                "col": 16,
                "seat_type": "normal"
            },
            {
                "seat": "C13",
                "status": "available",
                "available": true,
                "temp_uid": "",
                "row": 3,
                "col": 17,
                "seat_type": "normal"
            },
            {
                "seat": "SD1",
                "status": "available",
                "available": true,
                "temp_uid": "",
                "row": 4,
                "col": 1,
                "seat_type": "space"
            },
            {
                "seat": "SD2",
                "status": "available",
                "available": true,
                "temp_uid": "",
                "row": 4,
                "col": 2,
                "seat_type": "space"
            },
            {
                "seat": "SD3",
                "status": "available",
                "available": true,
                "temp_uid": "",
                "row": 4,
                "col": 3,
                "seat_type": "space"
            },
            {
                "seat": "SD4",
                "status": "available",
                "available": true,
                "temp_uid": "",
                "row": 4,
                "col": 4,
                "seat_type": "space"
            },
            {
                "seat": "D1",
                "status": "available",
                "available": true,
                "temp_uid": "",
                "row": 4,
                "col": 5,
                "seat_type": "normal"
            },
            {
                "seat": "D2",
                "status": "available",
                "available": true,
                "temp_uid": "",
                "row": 4,
                "col": 6,
                "seat_type": "normal"
            },
            {
                "seat": "D3",
                "status": "available",
                "available": true,
                "temp_uid": "",
                "row": 4,
                "col": 7,
                "seat_type": "normal"
            },
            {
                "seat": "D4",
                "status": "available",
                "available": true,
                "temp_uid": "",
                "row": 4,
                "col": 8,
                "seat_type": "normal"
            },
            {
                "seat": "D5",
                "status": "available",
                "available": true,
                "temp_uid": "",
                "row": 4,
                "col": 9,
                "seat_type": "normal"
            },
            {
                "seat": "D6",
                "status": "available",
                "available": true,
                "temp_uid": "",
                "row": 4,
                "col": 10,
                "seat_type": "normal"
            },
            {
                "seat": "D7",
                "status": "available",
                "available": true,
                "temp_uid": "",
                "row": 4,
                "col": 11,
                "seat_type": "normal"
            },
            {
                "seat": "D8",
                "status": "available",
                "available": true,
                "temp_uid": "",
                "row": 4,
                "col": 12,
                "seat_type": "normal"
            },
            {
                "seat": "D9",
                "status": "available",
                "available": true,
                "temp_uid": "",
                "row": 4,
                "col": 13,
                "seat_type": "normal"
            },
            {
                "seat": "D10",
                "status": "available",
                "available": true,
                "temp_uid": "",
                "row": 4,
                "col": 14,
                "seat_type": "normal"
            },
            {
                "seat": "D11",
                "status": "available",
                "available": true,
                "temp_uid": "",
                "row": 4,
                "col": 15,
                "seat_type": "normal"
            },
            {
                "seat": "D12",
                "status": "available",
                "available": true,
                "temp_uid": "",
                "row": 4,
                "col": 16,
                "seat_type": "normal"
            },
            {
                "seat": "D13",
                "status": "available",
                "available": true,
                "temp_uid": "",
                "row": 4,
                "col": 17,
                "seat_type": "normal"
            },
            {
                "seat": "SE1",
                "status": "available",
                "available": true,
                "temp_uid": "",
                "row": 5,
                "col": 1,
                "seat_type": "space"
            },
            {
                "seat": "SE2",
                "status": "available",
                "available": true,
                "temp_uid": "",
                "row": 5,
                "col": 2,
                "seat_type": "space"
            },
            {
                "seat": "SE3",
                "status": "available",
                "available": true,
                "temp_uid": "",
                "row": 5,
                "col": 3,
                "seat_type": "space"
            },
            {
                "seat": "SE4",
                "status": "available",
                "available": true,
                "temp_uid": "",
                "row": 5,
                "col": 4,
                "seat_type": "space"
            },
            {
                "seat": "E1",
                "status": "available",
                "available": true,
                "temp_uid": "",
                "row": 5,
                "col": 5,
                "seat_type": "normal"
            },
            {
                "seat": "E2",
                "status": "available",
                "available": true,
                "temp_uid": "",
                "row": 5,
                "col": 6,
                "seat_type": "normal"
            },
            {
                "seat": "E3",
                "status": "available",
                "available": true,
                "temp_uid": "",
                "row": 5,
                "col": 7,
                "seat_type": "normal"
            },
            {
                "seat": "E4",
                "status": "available",
                "available": true,
                "temp_uid": "",
                "row": 5,
                "col": 8,
                "seat_type": "normal"
            },
            {
                "seat": "E5",
                "status": "available",
                "available": true,
                "temp_uid": "",
                "row": 5,
                "col": 9,
                "seat_type": "normal"
            },
            {
                "seat": "E6",
                "status": "available",
                "available": true,
                "temp_uid": "",
                "row": 5,
                "col": 10,
                "seat_type": "normal"
            },
            {
                "seat": "E7",
                "status": "available",
                "available": true,
                "temp_uid": "",
                "row": 5,
                "col": 11,
                "seat_type": "normal"
            },
            {
                "seat": "E8",
                "status": "available",
                "available": true,
                "temp_uid": "",
                "row": 5,
                "col": 12,
                "seat_type": "normal"
            },
            {
                "seat": "E9",
                "status": "available",
                "available": true,
                "temp_uid": "",
                "row": 5,
                "col": 13,
                "seat_type": "normal"
            },
            {
                "seat": "E10",
                "status": "available",
                "available": true,
                "temp_uid": "",
                "row": 5,
                "col": 14,
                "seat_type": "normal"
            },
            {
                "seat": "E11",
                "status": "available",
                "available": true,
                "temp_uid": "",
                "row": 5,
                "col": 15,
                "seat_type": "normal"
            },
            {
                "seat": "E12",
                "status": "available",
                "available": true,
                "temp_uid": "",
                "row": 5,
                "col": 16,
                "seat_type": "normal"
            },
            {
                "seat": "E13",
                "status": "available",
                "available": true,
                "temp_uid": "",
                "row": 5,
                "col": 17,
                "seat_type": "normal"
            },
            {
                "seat": "SF1",
                "status": "available",
                "available": true,
                "temp_uid": "",
                "row": 6,
                "col": 1,
                "seat_type": "space"
            },
            {
                "seat": "SF2",
                "status": "available",
                "available": true,
                "temp_uid": "",
                "row": 6,
                "col": 2,
                "seat_type": "space"
            },
            {
                "seat": "SF3",
                "status": "available",
                "available": true,
                "temp_uid": "",
                "row": 6,
                "col": 3,
                "seat_type": "space"
            },
            {
                "seat": "SF4",
                "status": "available",
                "available": true,
                "temp_uid": "",
                "row": 6,
                "col": 4,
                "seat_type": "space"
            },
            {
                "seat": "F1",
                "status": "available",
                "available": true,
                "temp_uid": "",
                "row": 6,
                "col": 5,
                "seat_type": "normal"
            },
            {
                "seat": "F2",
                "status": "available",
                "available": true,
                "temp_uid": "",
                "row": 6,
                "col": 6,
                "seat_type": "normal"
            },
            {
                "seat": "F3",
                "status": "available",
                "available": true,
                "temp_uid": "",
                "row": 6,
                "col": 7,
                "seat_type": "normal"
            },
            {
                "seat": "F4",
                "status": "available",
                "available": true,
                "temp_uid": "",
                "row": 6,
                "col": 8,
                "seat_type": "normal"
            },
            {
                "seat": "F5",
                "status": "available",
                "available": true,
                "temp_uid": "",
                "row": 6,
                "col": 9,
                "seat_type": "normal"
            },
            {
                "seat": "F6",
                "status": "available",
                "available": true,
                "temp_uid": "",
                "row": 6,
                "col": 10,
                "seat_type": "normal"
            },
            {
                "seat": "F7",
                "status": "available",
                "available": true,
                "temp_uid": "",
                "row": 6,
                "col": 11,
                "seat_type": "normal"
            },
            {
                "seat": "F8",
                "status": "available",
                "available": true,
                "temp_uid": "",
                "row": 6,
                "col": 12,
                "seat_type": "normal"
            },
            {
                "seat": "F9",
                "status": "available",
                "available": true,
                "temp_uid": "",
                "row": 6,
                "col": 13,
                "seat_type": "normal"
            },
            {
                "seat": "F10",
                "status": "available",
                "available": true,
                "temp_uid": "",
                "row": 6,
                "col": 14,
                "seat_type": "normal"
            },
            {
                "seat": "F11",
                "status": "available",
                "available": true,
                "temp_uid": "",
                "row": 6,
                "col": 15,
                "seat_type": "normal"
            },
            {
                "seat": "F12",
                "status": "available",
                "available": true,
                "temp_uid": "",
                "row": 6,
                "col": 16,
                "seat_type": "normal"
            },
            {
                "seat": "F13",
                "status": "available",
                "available": true,
                "temp_uid": "",
                "row": 6,
                "col": 17,
                "seat_type": "normal"
            },
            {
                "seat": "G1",
                "status": "available",
                "available": true,
                "temp_uid": "",
                "row": 7,
                "col": 1,
                "seat_type": "normal"
            },
            {
                "seat": "G2",
                "status": "available",
                "available": true,
                "temp_uid": "",
                "row": 7,
                "col": 2,
                "seat_type": "normal"
            },
            {
                "seat": "G3",
                "status": "available",
                "available": true,
                "temp_uid": "",
                "row": 7,
                "col": 3,
                "seat_type": "normal"
            },
            {
                "seat": "G4",
                "status": "available",
                "available": true,
                "temp_uid": "",
                "row": 7,
                "col": 4,
                "seat_type": "normal"
            },
            {
                "seat": "G5",
                "status": "available",
                "available": true,
                "temp_uid": "",
                "row": 7,
                "col": 5,
                "seat_type": "normal"
            },
            {
                "seat": "G6",
                "status": "available",
                "available": true,
                "temp_uid": "",
                "row": 7,
                "col": 6,
                "seat_type": "normal"
            },
            {
                "seat": "G7",
                "status": "available",
                "available": true,
                "temp_uid": "",
                "row": 7,
                "col": 7,
                "seat_type": "normal"
            },
            {
                "seat": "G8",
                "status": "available",
                "available": true,
                "temp_uid": "",
                "row": 7,
                "col": 8,
                "seat_type": "normal"
            },
            {
                "seat": "G9",
                "status": "available",
                "available": true,
                "temp_uid": "",
                "row": 7,
                "col": 9,
                "seat_type": "normal"
            },
            {
                "seat": "G10",
                "status": "available",
                "available": true,
                "temp_uid": "",
                "row": 7,
                "col": 10,
                "seat_type": "normal"
            },
            {
                "seat": "G11",
                "status": "available",
                "available": true,
                "temp_uid": "",
                "row": 7,
                "col": 11,
                "seat_type": "normal"
            },
            {
                "seat": "G12",
                "status": "available",
                "available": true,
                "temp_uid": "",
                "row": 7,
                "col": 12,
                "seat_type": "normal"
            },
            {
                "seat": "G13",
                "status": "available",
                "available": true,
                "temp_uid": "",
                "row": 7,
                "col": 13,
                "seat_type": "normal"
            },
            {
                "seat": "G14",
                "status": "available",
                "available": true,
                "temp_uid": "",
                "row": 7,
                "col": 14,
                "seat_type": "normal"
            },
            {
                "seat": "G15",
                "status": "available",
                "available": true,
                "temp_uid": "",
                "row": 7,
                "col": 15,
                "seat_type": "normal"
            },
            {
                "seat": "G16",
                "status": "available",
                "available": true,
                "temp_uid": "",
                "row": 7,
                "col": 16,
                "seat_type": "normal"
            },
            {
                "seat": "G17",
                "status": "available",
                "available": true,
                "temp_uid": "",
                "row": 7,
                "col": 17,
                "seat_type": "normal"
            },
            {
                "seat": "H1",
                "status": "available",
                "available": true,
                "temp_uid": "",
                "row": 8,
                "col": 1,
                "seat_type": "normal"
            },
            {
                "seat": "H2",
                "status": "available",
                "available": true,
                "temp_uid": "",
                "row": 8,
                "col": 2,
                "seat_type": "normal"
            },
            {
                "seat": "H3",
                "status": "available",
                "available": true,
                "temp_uid": "",
                "row": 8,
                "col": 3,
                "seat_type": "normal"
            },
            {
                "seat": "H4",
                "status": "available",
                "available": true,
                "temp_uid": "",
                "row": 8,
                "col": 4,
                "seat_type": "normal"
            },
            {
                "seat": "H5",
                "status": "available",
                "available": true,
                "temp_uid": "",
                "row": 8,
                "col": 5,
                "seat_type": "normal"
            },
            {
                "seat": "H6",
                "status": "available",
                "available": true,
                "temp_uid": "",
                "row": 8,
                "col": 6,
                "seat_type": "normal"
            },
            {
                "seat": "H7",
                "status": "available",
                "available": true,
                "temp_uid": "",
                "row": 8,
                "col": 7,
                "seat_type": "normal"
            },
            {
                "seat": "H8",
                "status": "available",
                "available": true,
                "temp_uid": "",
                "row": 8,
                "col": 8,
                "seat_type": "normal"
            },
            {
                "seat": "H9",
                "status": "available",
                "available": true,
                "temp_uid": "",
                "row": 8,
                "col": 9,
                "seat_type": "normal"
            },
            {
                "seat": "H10",
                "status": "available",
                "available": true,
                "temp_uid": "",
                "row": 8,
                "col": 10,
                "seat_type": "normal"
            },
            {
                "seat": "H11",
                "status": "available",
                "available": true,
                "temp_uid": "",
                "row": 8,
                "col": 11,
                "seat_type": "normal"
            },
            {
                "seat": "H12",
                "status": "available",
                "available": true,
                "temp_uid": "",
                "row": 8,
                "col": 12,
                "seat_type": "normal"
            },
            {
                "seat": "H13",
                "status": "available",
                "available": true,
                "temp_uid": "",
                "row": 8,
                "col": 13,
                "seat_type": "normal"
            },
            {
                "seat": "H14",
                "status": "available",
                "available": true,
                "temp_uid": "",
                "row": 8,
                "col": 14,
                "seat_type": "normal"
            },
            {
                "seat": "H15",
                "status": "available",
                "available": true,
                "temp_uid": "",
                "row": 8,
                "col": 15,
                "seat_type": "normal"
            },
            {
                "seat": "H16",
                "status": "available",
                "available": true,
                "temp_uid": "",
                "row": 8,
                "col": 16,
                "seat_type": "normal"
            },
            {
                "seat": "H17",
                "status": "available",
                "available": true,
                "temp_uid": "",
                "row": 8,
                "col": 17,
                "seat_type": "normal"
            }
        ],
        "show": {
            "show_id": "57984",
            "company_id": "CPY202306121e4sgb7",
            "site_id": "SIT202306135AXcxyH",
            "site_name": "Anga Diamond Cinema",
            "film_id": "ST00001340",
            "film_name": "Twisters 2D",
            "screen_id": "SCN20240304Mqy0xvU",
            "screen_name": "DREAM HALL",
            "day": "2024-07-17",
            "showtime": "10:50:00",
            "duration": "125",
            "price_card_id": "PRC20240716jsxInYJ",
            "price_card_name": "E.BIRD 2D",
            "seating": "select",
            "comps": "allowed",
            "sales_via": "web,pos",
            "show_status": "Open",
            "trailer_duration": "0",
            "clean_up": "0",
            "show_type": "public",
            "revenue": "no",
            "show_date_created": "2024-07-16 14:21:10",
            "show_date_updated": "2024-07-16 14:21:10"
        }
    }
};

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

List<Map<String, dynamic>> getWeekDates() {
  // Initialize the list that will hold the week's dates
  List<Map<String, dynamic>> weekDates = [];

  // Get today's date
  DateTime now = DateTime.now();

  // Find the start of the week (Monday)
  DateTime startOfWeek = now.subtract(Duration(days: now.weekday - 1));

  // Generate dates for each day of the week starting from Monday to Sunday
  for (int i = 0; i < 7; i++) {
    DateTime currentDate = startOfWeek.add(Duration(days: i));

    // Format the date
    String formattedDate = DateFormat('dd MMMM').format(currentDate);

    // Determine the weekday abbreviation
    String dayAbbreviation = '';
    switch (currentDate.weekday) {
      case 1:
        dayAbbreviation = 'MON';
        break;
      case 2:
        dayAbbreviation = 'TUE';
        break;
      case 3:
        dayAbbreviation = 'WED';
        break;
      case 4:
        dayAbbreviation = 'THU';
        break;
      case 5:
        dayAbbreviation = 'FRI';
        break;
      case 6:
        dayAbbreviation = 'SAT';
        break;
      case 7:
        dayAbbreviation = 'SUN';
        break;
    }

    // Add the map to the list
    weekDates.add({
      'day': dayAbbreviation,
      'date': formattedDate,
      'raw_date': DateFormat('yyyy-MM-dd').format(currentDate)
    });
  }
  return weekDates;
}
}
