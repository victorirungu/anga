import 'package:anga/views/themes/themes.dart';
import 'package:flutter/material.dart';

class SeatingChart extends StatefulWidget {
  final Map jsonData;

  SeatingChart({required this.jsonData});

  @override
  _SeatingChartState createState() => _SeatingChartState();
}

class _SeatingChartState extends State<SeatingChart> {
  late Map seatData;
  late List<dynamic> seats;

  @override
  void initState() {
    super.initState();
    seatData = widget.jsonData;
    seats = seatData['data']['seats'];
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 40.0),
      child: Column(
        children: [
          Image(image: AssetImage('images/screen.png')),
          SizedBox(
            width: 600.0,
            height: 400.0,
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.all(15.0),
                  child: Text('Screen', style: TextStyle(color: Colors.white)),
                ),
                SizedBox(height: 40.0),
                Expanded(
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 17,
                      mainAxisSpacing: 4.0,
                      crossAxisSpacing: 4.0,
                    ),
                    itemCount: seats.length,
                    itemBuilder: (context, index) {
                      final seat = seats[index];
                      return Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              if (seat['status'] == 'available') {
                                seat['status'] = 'selected';
                              } else if (seat['status'] == 'selected') {
                                seat['status'] = 'available';
                              }
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: _getSeatColor(seat),
                              shape: BoxShape.circle,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Center(
                                child: Text(
                                  seat['seat_type'] == 'space'
                                      ? ''
                                      : seat['seat'],
                                  style: TextStyle(
                                    color: lightColor(),
                                    fontSize: 10.0,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Color _getSeatColor(Map<String, dynamic> seat) {
    if (seat['seat_type'] == 'space') return Colors.transparent;
    if (seat['status'] == 'reserved') {
      return Colors.blue;
    } else if (seat['status'] == 'selected') {
      return Colors.yellow;
    } else if (seat['available']) {
      return Colors.grey;
    }
    return Colors.black;
  }
}
