import 'package:anga/views/themes/themes.dart';
import 'package:anga/views/widgets/buttons/simple_button.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Locations extends StatefulWidget {
  final double width;
  final List items;

  const Locations({super.key, required this.width, required this.items});

  @override
  State<Locations> createState() => LocationsState();
}

class LocationsState extends State<Locations> {
  // CinemaController cinemaController = Get.find<CinemaController>();
  // String selectedLocation = widget.locations[0];
  @override
  void initState() {
    super.initState();
    // selectedLocation = getSelectedLoc(locationController.activeCatId.value);
  }

  // void updateCatView(String category) {
  //   setState(() {
  //     selectedCategory = category;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    var btnWidth = widget.width * .22 > 155.0
        ? 155.0
        : (widget.width * .22 < 120.0 ? 120.0 : widget.width * .22);

    return SizedBox(
      width: widget.width * .8,
      child: widget.width * .8 >
              ((widget.items.length * btnWidth) + (widget.items.length * 24.0))
          ? locationBtnWidget()
          : SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: locationBtnWidget(),
            ),
    );
  }

  Row locationBtnWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: widget.items.map((item) {
        // bool isSelected = item['text'] == selectedCategory;
        bool isSelected = false;
        return Padding(
          padding: const EdgeInsets.all(4.0),
          child: CustomElevatedButton(
            bgColor: primaryColor(),
            color: colorBlack(),
            text: item['name'],
            width: widget.width * .22 > 155.0
                ? 155.0
                : (widget.width * .22 < 120.0 ? 120.0 : widget.width * .22),
            height: 35.0,
            borderRadius: 20.0,
            onPressed: () {
              // if (selectedCategory != item['text']) {
              //   updateCatView(item['text']);
              //   updateCat(item['text']);
              // }
            },
            style: TextStyle(
                overflow: TextOverflow.ellipsis,
                color: darkColor(),
                fontSize: widget.width > 700 ? 16.0 : 12.0,
                fontWeight: FontWeight.w900),
          ),
        );
      }).toList(),
    );
  }

  // Future<void> updateCat(item) async {
  //   switch (item) {
  //     case "All":
  //       eventController.activeCatId.value = 0;
  //       break;
  //     case "Concert":
  //       eventController.activeCatId.value = 1;
  //       break;
  //     case "MotorSport":
  //       eventController.activeCatId.value = 2;
  //       break;
  //     case "Sports":
  //       eventController.activeCatId.value = 3;
  //       break;
  //     case "Business":
  //       eventController.activeCatId.value = 4;
  //       break;
  //     case "Auction":
  //       eventController.activeCatId.value = 5;
  //       break;
  //     case "Theatre":
  //       eventController.activeCatId.value = 6;
  //       break;
  //     case "Shoot":
  //       eventController.activeCatId.value = 7;
  //       break;
  //     case "Comedy":
  //       eventController.activeCatId.value = 8;
  //       break;
  //     case "Hybrid":
  //       eventController.activeCatId.value = 9;
  //       break;
  //       case "Hotels":
  //       eventController.activeCatId.value = 10;
  //       break;
  //       case "Holidays":
  //       eventController.activeCatId.value = 11;
  //       break;
  //       case "Travels":
  //       eventController.activeCatId.value = 12;
  //       break;

  //     default:
  //       eventController.activeCatId.value = 0;
  //       break;
  //   }

  //   eventController.catChanged.value = true;

  //     eventController.isFetching.value = true;
  //     await eventController.getEvents();
  //     eventController.isFetching.value = false;

  // }

  // Map<int, String> categoryMap = {
  //   0: "All",
  //   1: "Concert",
  //   2: "MotorSport",
  //   3: "Sports",
  //   4: "Business",
  //   5: "Auction",
  //   6: "Theatre",
  //   7: "Shoot",
  //   8: "Comedy",
  //   9: "Hybrid",
  //   10: "Hotels",
  //   11: "Holidays",
  //   12: "Travels"

  // };

  // String getSelectedCat(int item) {
  //   return categoryMap[item] ?? "All";
  // }
}
