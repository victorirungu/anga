import 'package:anga/views/themes/themes.dart';
import 'package:anga/views/widgets/buttons/simple_button.dart';
import 'package:flutter/material.dart';

class MyHistoryTable extends StatelessWidget {
  final List<Map<String, String>> events = [
    {
      'Event/Show': 'Twisters 2D',
      'Date': 'MON 08 JUNE',
      'Time': '12:00PM',
      'Venue': 'DIAMOND HALL',
      'Charges': '400/-'
    },
    {
      'Event/Show': 'Bad Boys 2D',
      'Date': 'WED 10 JUNE',
      'Time': '08:00PM',
      'Venue': 'CBD HALL',
      'Charges': '400/-'
    },
    {
      'Event/Show': 'Sarfira 2D',
      'Date': 'SAT 13 JUNE',
      'Time': '05:00PM',
      'Venue': 'PANARI HALL',
      'Charges': '400/-'
    },
    {
      'Event/Show': 'Twisters 2D',
      'Date': 'MON 08 JUNE',
      'Time': '12:00PM',
      'Venue': 'DIAMOND HALL',
      'Charges': '400/-'
    },
    {
      'Event/Show': 'Bad Boys 2D',
      'Date': 'WED 10 JUNE',
      'Time': '08:00PM',
      'Venue': 'CBD HALL',
      'Charges': '400/-'
    },
    {
      'Event/Show': 'Sarfira 2D',
      'Date': 'SAT 13 JUNE',
      'Time': '05:00PM',
      'Venue': 'PANARI HALL',
      'Charges': '400/-'
    },
    {
      'Event/Show': 'A Quiet Place 2D',
      'Date': 'SUN 14 JUNE',
      'Time': '08:30PM',
      'Venue': 'CBD HALL',
      'Charges': '400/-'
    },
  ];

  MyHistoryTable({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: DataTable(
            dataRowMinHeight: 30.0,
            headingRowColor: WidgetStateProperty.resolveWith<Color>(
                (states) => secondaryColor()),
            dataRowColor: WidgetStateProperty.resolveWith<Color>(
                (states) => lightColor()),
            border: TableBorder.all(color: darkColor()),
            columns: [
              DataColumn(
                  label: Text('Event/Show',
                      style: TextStyle(
                          color: lightColor(), fontWeight: FontWeight.w700))),
              DataColumn(
                  label: Text('Date',
                      style: TextStyle(
                          color: lightColor(), fontWeight: FontWeight.w700))),
              DataColumn(
                  label: Text('Time',
                      style: TextStyle(
                          color: lightColor(), fontWeight: FontWeight.w700))),
              DataColumn(
                  label: Text('Venue',
                      style: TextStyle(
                          color: lightColor(), fontWeight: FontWeight.w700))),
              DataColumn(
                  label: Text('Charges',
                      style: TextStyle(
                          color: lightColor(), fontWeight: FontWeight.w700))),
            ],
            rows: events
                .map(
                  (event) => DataRow(
                    cells: [
                      DataCell(Text(event['Event/Show']!,
                          style: TextStyle(
                              color: darkColor(),
                              fontWeight: FontWeight.w700,
                              fontSize: 15.0))),
                      DataCell(Text(event['Date']!,
                          style: TextStyle(
                              color: darkColor(),
                              fontWeight: FontWeight.w700,
                              fontSize: 15.0))),
                      DataCell(Text(event['Time']!,
                          style: TextStyle(
                              color: darkColor(),
                              fontWeight: FontWeight.w700,
                              fontSize: 15.0))),
                      DataCell(Text(event['Venue']!,
                          style: TextStyle(
                              color: darkColor(),
                              fontWeight: FontWeight.w700,
                              fontSize: 15.0))),
                      DataCell(Text(event['Charges']!,
                          style: TextStyle(
                              color: darkColor(),
                              fontWeight: FontWeight.w700,
                              fontSize: 15.0))),
                    ],
                  ),
                )
                .toList(),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: CustomElevatedButton(
              onPressed: () {},
              width: 140.0,
              height: 40.0,
              borderRadius: 10.0,
              text: 'Clear History',
              bgColor: primaryColor(),
              style: TextStyle(
                  fontSize: 17.0,
                  fontWeight: FontWeight.w700,
                  color: colorBlack())),
        ),
      ],
    );
  }
}
