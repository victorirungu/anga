import 'package:anga/views/themes/themes.dart';
import 'package:anga/views/widgets/buttons/simple_button.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class FilmScheduleWidget extends StatefulWidget {
  const FilmScheduleWidget({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _FilmScheduleWidgetState createState() => _FilmScheduleWidgetState();
}

class _FilmScheduleWidgetState extends State<FilmScheduleWidget> {
  int _currentIndex = 0;
  final List daysOfWeek = getWeekDates();
  final List<Map<String, dynamic>> schedule = [
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

    // {
    //   "day": "MON",
    //   "date": "08 JUNE",
    //   "times": ["12:00pm", "8:30pm"]
    // },
    // {"day": "TUE", "date": "09 JUNE", "times": []},
    // {"day": "WED", "date": "10 JUNE", "times": []},
    // {"day": "THU", "date": "11 JUNE", "times": []},
    // {"day": "FRI", "date": "12 JUNE", "times": []},
    // {
    //   "day": "SAT",
    //   "date": "13 JUNE",
    //   "times": ["11:30am"]
    // },
    // {"day": "SUN", "date": "14 JUNE", "times": []}
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * .6,
      height: 400.0,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            color: primaryBackGround(),
            child: Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
                  onPressed: () {
                    setState(() {
                      if (_currentIndex > 0) {
                        _currentIndex--;
                      }
                    });
                  },
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * .52,
                  height: 65.0,
                  child: Expanded(
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: daysOfWeek.length,
                      itemBuilder: (context, index) {
                        final item = daysOfWeek[index];
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              _currentIndex = index;
                            });
                          },
                          child: Container(
                            width: 90.0,
                            height: 40.0,
                            margin: const EdgeInsets.all(4.0),
                            decoration: BoxDecoration(
                              color: _currentIndex == index
                                  ? secondaryColor()
                                  : Colors.grey,
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  item['day'],
                                  style: const TextStyle(
                                      color: Colors.white, fontSize: 16.0),
                                ),
                                Text(
                                  item['date'],
                                  style: const TextStyle(
                                      color: Colors.white, fontSize: 12.0),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: IconButton(
                    icon: const Icon(Icons.arrow_forward_ios,
                        color: Colors.white),
                    onPressed: () {
                      setState(() {
                        if (_currentIndex < schedule.length - 1) {
                          _currentIndex++;
                        }
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width * .52,
            color: secondaryColor(),
            height: 1.0,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * .5,
            height: 70.0,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: schedule[_currentIndex]['times'].isEmpty
                  ? [
                      const Text('No showtimes available',
                          style: TextStyle(color: Colors.white))
                    ]
                  : schedule[_currentIndex]['times'].map<Widget>((time) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: 90.0,
                          margin: const EdgeInsets.symmetric(vertical: 8.0),
                          padding: const EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Center(
                            child: Text(
                              time,
                              style: const TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      );
                    }).toList(),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.only(right: 24.0),
              child: CustomElevatedButton(
                text: 'BOOK NOW',
                width: 140.0,
                onPressed: () {},
                style: TextStyle(
                    color: lightColor(),
                    fontSize: 18.0,
                    fontWeight: FontWeight.w800),
                bgColor: secondaryColor(),
                color: secondaryColor(),
                height: 45.0,
                borderRadius: 30.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
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
  print(weekDates);
  return weekDates;
}
