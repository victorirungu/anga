// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:anga/views/themes/themes.dart';
import 'package:barcode/barcode.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class TicketWidget extends StatelessWidget {
  const TicketWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 320,
      decoration: BoxDecoration(
        color: secondaryColor(),
        border: Border.all(color: primaryBackGround(), width: 1),
      ),
      child: Stack(
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(vertical: 10),
                width: 100,
                color: Colors.black.withOpacity(.9),
                child: const RotatedBox(
                  quarterTurns: 3,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Ticket Number:',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                      Text(
                        '#123456789',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "No Title",
                            style: const TextStyle(
                                fontSize: 42,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                          Container(
                            width: 70,
                            height: 70,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                width: 2,
                                color: Colors.white,
                              ),
                              image: const DecorationImage(
                                image: AssetImage("assets/logo.png"),
                                fit: BoxFit.fill,
                              ),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 8),
                      Text(
                        "No Duration",
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                        ),
                      ),
                      const SizedBox(height: 26),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: ticketItem(
                              title: 'Date:',
                              value: DateTime.now().toString(),
                            ),
                          ),
                          Expanded(
                            child: ticketItem(
                              title: 'Time:',
                              value: DateTime.now().toString(),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: ticketItem(
                              title: 'Hall:',
                              value: "",
                            ),
                          ),
                          Expanded(
                            child: ticketItem(
                              title: 'Seat:',
                              value: "Seat 11",
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 20),
              Stack(
                alignment: Alignment.center,
                children: [
                  const DottedLine(
                    direction: Axis.vertical,
                    lineLength: double.infinity,
                    lineThickness: 2.5,
                    dashLength: 8.0,
                    dashColor: Colors.black,
                    dashRadius: 0.0,
                    dashGapLength: 5.0,
                    dashGapColor: Colors.transparent,
                    dashGapRadius: 30.0,
                  ),
                  Align(
                    alignment: Alignment.topCenter,
                    child: Container(
                      transform: Matrix4.translationValues(0, -20, 0),
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: primaryBackGround(),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      transform: Matrix4.translationValues(0, 20, 0),
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: primaryBackGround().withOpacity(1),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 10),
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                color: Colors.white.withOpacity(.9),
                child: RotatedBox(
                  quarterTurns: 3,
                  child: Column(
                    children: [
                      generateBarcode("Home here"),
                      const SizedBox(height: 25),
                      Row(
                        children: <Widget>[
                          Expanded(
                            child: ticketItem1(
                              title: 'Hall',
                              value: "Hall",
                            ),
                          ),
                          Expanded(
                            child: ticketItem1(
                              title: 'Time',
                              value: DateTime.now().toString(),
                            ),
                          ),
                          Expanded(
                            child: ticketItem1(
                              title: 'Seat',
                              value: 'seat 11',
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

Widget generateBarcode(String data) {
  final barcode = Barcode.code128();
  final svg = barcode.toSvg(data, width: 270, height: 50, drawText: false);
  return SvgPicture.string(svg);
}

Widget ticketItem({required String title, required String value}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        title,
        style: const TextStyle(
          fontSize: 18,
          color: Colors.black,
          fontWeight: FontWeight.w500,
        ),
      ),
      const SizedBox(height: 8),
      Text(
        value,
        style: const TextStyle(
          color: Colors.black,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    ],
  );
}

Widget ticketItem1({required String title, required String value}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Text(
        title,
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontSize: 13,
          color: Colors.black,
          fontWeight: FontWeight.w500,
        ),
      ),
      const SizedBox(height: 8),
      Text(
        value,
        textAlign: TextAlign.center,
        style: const TextStyle(
          color: Colors.black,
          fontSize: 14,
          fontWeight: FontWeight.bold,
        ),
      ),
    ],
  );
}
