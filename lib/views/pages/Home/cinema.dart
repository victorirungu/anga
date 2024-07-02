import 'package:anga/views/pages/Home/components/cards/cards.dart';
import 'package:flutter/material.dart';



class Cinema extends StatelessWidget {
  const Cinema({super.key});

  @override
  Widget build(BuildContext context) {
        final List<Map<String, String>> items = [
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
    },
    {
      'id': '5',
      'name': 'Despicable me 4',
      'image': 'images/homepage66.jpeg',
    },
  ];
    return GridView.builder(
                          shrinkWrap: true,
                          itemCount: items.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                childAspectRatio: .65,
                            crossAxisCount: 4,

                          ),
                          itemBuilder: (context, index) {
                            return InteractiveCard(name: items[index]['name']! , image: items[index]['image']!  ,);
                          },
                        );
  }
}

