import 'package:anga/views/themes/themes.dart';
import 'package:anga/views/widgets/cards/cards.dart';
import 'package:flutter/material.dart';

class CinemaGrid extends StatelessWidget {
  final List items;

  const CinemaGrid({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * .8,
      child: LayoutBuilder(
        builder: (context, constraints) {
          double gridWidth = constraints.maxWidth;
          double aspectRatio = 250 / 385;

          int crossAxisCount = (gridWidth / 250).floor();
          double containerWidth = (gridWidth / crossAxisCount) - 10;
          double containerHeight = containerWidth / aspectRatio;
          var rows = (items.length / crossAxisCount).ceil();

          double padding = crossAxisCount > 1 ? 170.0 : 220.0;
          return SizedBox(
            height: (rows * containerWidth) + (padding * rows),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: crossAxisCount,
                  childAspectRatio: aspectRatio,
                ),
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return InteractiveCard(
                    item: items[index],
                    borderColor: secondaryColor(),
                    width: containerWidth,
                    height: containerHeight,
                    usage: 'Cinema',
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
