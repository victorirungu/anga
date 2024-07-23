import 'package:anga/views/widgets/inputs/text_field.dart';
import 'package:flutter/material.dart';

class SearchComponent extends StatelessWidget {
  const SearchComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45.0,
      constraints: const BoxConstraints(maxWidth: 400.0),
      child: CustomTextField(
        hint: 'Search',
        bRadius: 10.0,
        fillColor: true,
        suffix: IconButton(
          icon: const Icon(
            Icons.search,
            size: 30.0,
          ),
          onPressed: () {},
        ),
      ),
    );
  }
}
