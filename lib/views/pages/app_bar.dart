import 'package:anga/views/functions/resolution.dart';
import 'package:anga/views/themes/themes.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatefulWidget {
  const CustomAppBar({super.key});

  @override
  CustomAppBarState createState() => CustomAppBarState();
}

class CustomAppBarState extends State<CustomAppBar> {
  String activeLink = 'Home';
  bool _isDropdownShown = false;

  void setActiveLink(String link) {
    setState(() {
      activeLink = link;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 24.0,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 100.0,
        color: Colors.transparent,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 30.0),
              child: MouseRegion(
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                  onTap: () {},
                  child: const Image(image: AssetImage("images/logo.png")),
                ),
              ),
            ),
            Row(
              children: [
                buildNavButton(context, 'Home', []),
                buildNavButton(context, 'Events/Sports', []),
                buildNavButton(context, 'Schedule ',
                    ['Full Schedule', 'CBD', 'Panari/Sky', 'Diamond']),
                buildNavButton(context, 'Coming Soon', []),
                buildNavButton(context, 'My History', []),
                buildNavButton(context, 'Contact', []),
                buildNavButton(context, 'Login', []),
              ],
            ),
            const SizedBox(),
          ],
        ),
      ),
    );
  }

  Widget buildNavButton(
      BuildContext context, String title, List<String> dropdownItems) {
    final bool isActive = activeLink == title;
    Map resolution = getResolution(context);
    double width = resolution['width'];

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onHover: (event) => _showDropdown(context, title, dropdownItems, width),
      onEnter: (event) => _showDropdown(context, title, dropdownItems, width),
      onExit: (event) {
        _isDropdownShown = false;
        Navigator.pop;
      },
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: TextButton(
          onPressed: () {
            setActiveLink(title);
          },
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 16.0,
                      wordSpacing: 1.2,
                      color: isActive ? primaryColor() : primaryForeGround(),
                      fontWeight: isActive ? FontWeight.bold : FontWeight.w300,
                    ),
                  ),
                  dropdownItems.isNotEmpty
                      ? Icon(
                          Icons.keyboard_arrow_down,
                          color: primaryForeGround(),
                        )
                      : const SizedBox()
                ],
              ),
              if (isActive)
                Container(
                  margin: const EdgeInsets.only(top: 2.0),
                  height: 1.0,
                  width: 40.0,
                  color: primaryColor(),
                ),
            ],
          ),
        ),
      ),
    );
  }

  void _showDropdown(
      BuildContext context, String title, List<String> dropdownItems, width) {
    if (dropdownItems.isEmpty) return;

    if (_isDropdownShown) {
      _isDropdownShown = false;
      return;
    }
    _isDropdownShown = true;
    showMenu(
      context: context,
      position: RelativeRect.fromLTRB(width / 2.23, 90.0, width / 2.23, 0.0),
      items: dropdownItems.map((String item) {
        return PopupMenuItem<String>(
          value: item,
          child: Text(item),
        );
      }).toList(),
    ).then((value) {
      // Handle the selected value if needed
    });
  }
}
