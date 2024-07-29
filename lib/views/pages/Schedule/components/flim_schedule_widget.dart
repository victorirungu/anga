import 'package:anga/controllers/cinema.dart';
import 'package:anga/views/themes/themes.dart';
import 'package:anga/views/widgets/buttons/simple_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FilmScheduleWidget extends StatefulWidget {
  final Map item;
  const FilmScheduleWidget({super.key, required this.item});

  @override
  // ignore: library_private_types_in_public_api
  _FilmScheduleWidgetState createState() => _FilmScheduleWidgetState();
}

class _FilmScheduleWidgetState extends State<FilmScheduleWidget> {
  int _currentIndex = 0;
  List daysOfWeek = [];
  final CinemaController cinemaController = Get.put(CinemaController());

  @override
  void initState() {
    super.initState();
    daysOfWeek = cinemaController.getWeekDates();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * .6,
      height: 250.0,
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
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: IconButton(
                    icon: const Icon(Icons.arrow_forward_ios,
                        color: Colors.white),
                    onPressed: () {
                      setState(() {
                        if (_currentIndex < daysOfWeek.length - 1) {
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
              children:
                  cinemaController.schedule[_currentIndex]['times'].isEmpty
                      ? [
                          const Text('No showtimes available',
                              style: TextStyle(color: Colors.white))
                        ]
                      : cinemaController.schedule[_currentIndex]['times']
                          .map<Widget>((time) {
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
                onPressed: () {
                  Get.toNamed(
                    '/show',
                    arguments: {
                      'item': widget.item,
                    },
                  );
                },
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
