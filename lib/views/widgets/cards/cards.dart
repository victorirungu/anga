import 'package:anga/views/themes/themes.dart';
import 'package:anga/views/widgets/text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animated_button/flutter_animated_button.dart';
import 'package:google_fonts/google_fonts.dart';

class InteractiveCard extends StatefulWidget {
  final double width;
  final double height;
  final Map item;
  final Color borderColor;
  final String usage;

  const InteractiveCard({
    super.key,
    required this.item,
    required this.borderColor,
    required this.usage,
    this.width = 250.0,
    this.height = 320.0,
  });

  @override
  InteractiveCardState createState() => InteractiveCardState();
}

class InteractiveCardState extends State<InteractiveCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(6.0),
            child: MouseRegion(
              cursor: SystemMouseCursors.click,
              onEnter: (_) => setState(() => _isHovered = true),
              onExit: (_) => setState(() => _isHovered = false),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                  side: BorderSide(color: widget.borderColor, width: 3.0),
                ),
                elevation: 10,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: AnimatedScale(
                    duration: const Duration(milliseconds: 200),
                    scale: _isHovered ? 1.1 : 1.0,
                    child: Image.asset(
                      widget.item['image']!,
                      width: widget.width,
                      height: widget.height * .75,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
          ),
          ...baseWidget(),
        ],
      ),
    );
  }

  baseWidget() {
    if (widget.usage == "Cinema") {
      return [
        SelectableText(
          widget.item['name'],
          style: GoogleFonts.roboto(
              fontSize: 19,
              fontWeight: FontWeight.w500,
              color: primaryForeGround()),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(12.0, 4.0, 0.0, 4.0),
          child: AnimatedButton(
            onPress: () {},
            height: 32,
            width: 120,
            text: 'Book now',
            isReverse: true,
            animatedOn: AnimatedOn.onHover,
            selectedTextColor: darkColor(),
            transitionType: TransitionType.LEFT_TO_RIGHT,
            textStyle: TextStyle(
                color: lightColor(),
                fontSize: 16.0,
                fontWeight: FontWeight.w500),
            backgroundColor: secondaryColor(),
            borderColor: themeColorTransparent(),
            borderWidth: 1.0,
            borderRadius: 20.0,
            selectedBackgroundColor: primaryColor(),
          ),
        )
      ];
    } else if (widget.usage == 'Events') {
      return [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Align(
            alignment: Alignment.topLeft,
            child: SelectableText(
              widget.item['name'],
              style: GoogleFonts.roboto(
                  fontSize: 23,
                  fontWeight: FontWeight.w500,
                  color: secondaryColor()),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Icon(
                Icons.calendar_month,
                color: primaryForeGround(),
                size: 22.0,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: CustomText(
                  text: widget.item['date'],
                  color: primaryForeGround(),
                  fontSize: 17.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Icon(
                Icons.watch_later,
                color: primaryForeGround(),
                size: 22.0,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: CustomText(
                  text: widget.item['time'],
                  color: primaryForeGround(),
                  fontSize: 17.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Icon(
                Icons.location_on,
                color: primaryForeGround(),
                size: 22.0,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: CustomText(
                  text: widget.item['location'],
                  color: primaryForeGround(),
                  fontSize: 17.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
        Align(
          alignment: Alignment.topLeft,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(8.0, 12.0, 0.0, 4.0),
            child: AnimatedButton(
              onPress: () {},
              height: 35,
              width: 110,
              text: 'Book',
              isReverse: true,
              animatedOn: AnimatedOn.onHover,
              selectedTextColor: darkColor(),
              transitionType: TransitionType.LEFT_TO_RIGHT,
              textStyle: TextStyle(
                  color: lightColor(),
                  fontSize: 16.0,
                  fontWeight: FontWeight.w500),
              backgroundColor: secondaryColor(),
              borderColor: themeColorTransparent(),
              borderWidth: 1.0,
              borderRadius: 20.0,
              selectedBackgroundColor: primaryColor(),
            ),
          ),
        )
      ];
    } else if (widget.usage == 'ComingSoon') {
      return [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: SelectableText(
            widget.item['releases'],
            style: GoogleFonts.roboto(
                fontSize: 23,
                fontWeight: FontWeight.w500,
                color: primaryForeGround()),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: SelectableText(
            widget.item['name'],
            style: GoogleFonts.roboto(
                fontSize: 23,
                fontWeight: FontWeight.w500,
                color: primaryForeGround()),
          ),
        ),
      ];
    } else {
      return const SizedBox();
    }
  }
}
