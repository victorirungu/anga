import 'package:anga/views/themes/themes.dart';
import 'package:anga/views/widgets/cards/cards.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CinemaGrid extends StatelessWidget {
  final List items;

  const CinemaGrid({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double gridWidth = constraints.maxWidth;
        double aspectRatio = 220 / 390;

        int crossAxisCount = (gridWidth / 220).floor();

        crossAxisCount = (crossAxisCount == 1) ? 2 : crossAxisCount;
        aspectRatio = (crossAxisCount == 2) ? 220 / 390 : aspectRatio;

        double containerWidth = (gridWidth / crossAxisCount) - 10;
        double containerHeight = containerWidth / aspectRatio;
        var rows = (items.length / crossAxisCount).ceil();

        double padding = 18.0;
        return SizedBox(
          height: (rows * containerHeight) + (padding * rows),
          child: Padding(
            padding: const EdgeInsets.all(0.0),
            child: GridView.builder(
              physics: const ScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: crossAxisCount,
                childAspectRatio: aspectRatio,
              ),
              itemCount: items.length,
              itemBuilder: (context, index) {
                return InteractiveCard(
                    padding: 10.0,
                    item: items[index],
                    borderColor: secondaryColor(),
                    width: containerWidth,
                    height: containerHeight,
                    usage: 'Cinema',
                    onPressed: () {
                      Get.toNamed(
                        '/show',
                        arguments: {
                          'item': items[index],
                        },
                      );
                    });
              },
            ),
          ),
        );
      },
    );
  }
}
