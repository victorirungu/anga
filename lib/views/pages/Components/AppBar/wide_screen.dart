import 'package:anga/controllers/cinema.dart';
import 'package:anga/controllers/navigation.dart';
import 'package:anga/views/functions/resolution.dart';
import 'package:anga/views/pages/Home/components/logo.dart';
import 'package:anga/views/themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomAppBar extends StatefulWidget {
  const CustomAppBar({
    super.key,
    required this.scrollController,
  });

  final ScrollController scrollController;

  @override
  CustomAppBarState createState() => CustomAppBarState();
}

class CustomAppBarState extends State<CustomAppBar> {
  String activeLink = 'Home';
  ScrollController? activeScrollController;
  Color appBarColor = Colors.transparent;
  bool hasReachedTopThreshold = false;
  final NavigationController navigationController =
      Get.put(NavigationController());
  final CinemaController cinemaController = Get.put(CinemaController());

  bool _isDropdownShown = false;

  @override
  void initState() {
    super.initState();
    activeLink = navigationController.activePage.value;
    activeScrollController = widget.scrollController;
    activeScrollController!.addListener(_onScroll);
  }

  void setActiveLink(String link) {
    setState(() {
      activeLink = link;
    });
  }

  void scrollToTop() {
    if (activeScrollController!.hasClients) {
      activeScrollController!.animateTo(
        0.0,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeOut,
      );
    }
  }

  void scrollToPosition(BuildContext? context) {
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }

  Widget buildNavButton(BuildContext context, double width, String title,
      List dropdownItems, VoidCallback? onPressed) {
    final bool isActive = activeLink == title;

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onHover: (event) => _showDropdown(context, title, dropdownItems, width),
      onEnter: (event) => _showDropdown(context, title, dropdownItems, width),
      onExit: (event) {
        _isDropdownShown = false;
      },
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: TextButton(
          onPressed: () {
            if (!isActive) {
              onPressed?.call();
              setActiveLink(title);
            }
          },
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: width * .0134 > 16.0
                          ? 16.0
                          : (width * .0134 < 12.0 ? 12.0 : width * .0134),
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
                  width: width * .03,
                  color: primaryColor(),
                ),
            ],
          ),
        ),
      ),
    );
  }

  BuildContext? getSectionContext(activeKey) {
    return activeKey.currentContext;
  }

  void _onScroll() {
    if (!hasReachedTopThreshold &&
        activeScrollController!.position.pixels <= 100) {
      setState(() {
        hasReachedTopThreshold = true;
      });
    } else if (hasReachedTopThreshold &&
        activeScrollController!.position.pixels > 100) {
      setState(() {
        hasReachedTopThreshold = false;
      });
    }
  }

  void _showDropdown(
      BuildContext context, String title, List dropdownItems, width) {
    if (dropdownItems.isEmpty) return;

    if (_isDropdownShown) {
      _isDropdownShown = false;
      return;
    }
    _isDropdownShown = true;
    showMenu(
      context: context,
      position: RelativeRect.fromLTRB(width / 2.32, 75.0, width / 2.32, 0.0),
      items: dropdownItems.map((item) {
        return PopupMenuItem<String>(
          value: item,
          child: Text(item),
        );
      }).toList(),
    ).then((value) {
      Get.toNamed(
        '/schedule',
        arguments: {
          'focus': value,
        },
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    Map resolution = getResolution(context);
    double width = resolution['width'];

    List<String?> locationNames =
        cinemaController.locations.map((location) => location['name']).toList();
    List<String?> navButtonOptions = ['Full Schedule', ...locationNames];
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      color: widget.scrollController.hasClients &&
              widget.scrollController.offset > 100
          ? primaryBackGround().withOpacity(.95)
          : Colors.transparent,
      width: width - 10.0,
      height: 100.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Logo(),
          Row(
            children: [
              buildNavButton(context, width, 'Home', [], () {
                if (Get.currentRoute != '/home') {
                  Get.offAllNamed('/home');
                } else {
                  scrollToTop();
                }
              }),
              buildNavButton(context, width, 'Events/Sports', [], () {
                Get.offAllNamed('/events-and-sports');
              }),

              // const DropDown(),

              buildNavButton(
                  context, width, 'Schedule', navButtonOptions, () {}),
              buildNavButton(context, width, 'Coming Soon', [], () {
                Get.offAllNamed('/coming-soon');
              }),
              buildNavButton(context, width, 'My History', [], () {
                Get.offAllNamed('/history');
              }),
              buildNavButton(
                context,
                MediaQuery.of(context).size.width,
                'Contact',
                [],
                () {
                  Get.offAllNamed('/contacts');
                },
              ),
              buildNavButton(context, width, 'Login', [], () {
                Get.offAllNamed('/auth');
              }),
            ],
          ),
          const SizedBox(),
        ],
      ),
    );
  }
}
