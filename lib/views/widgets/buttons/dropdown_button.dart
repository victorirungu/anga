import 'package:anga/views/themes/themes.dart';
import 'package:flutter/material.dart';

class CustomDropdown extends StatefulWidget {
  final String defaultTitle;
  final List<String> options;
  final double width;
  final bool isUnderlined;
  final Color backgroundColor;
  final BorderRadius borderRadius;
  final dynamic underline;
  final dynamic icon;

  const CustomDropdown({
    super.key,
    required this.defaultTitle,
    required this.options,
    required this.width,
    this.isUnderlined = false,
    this.underline,
    this.icon,
    this.backgroundColor = Colors.transparent,
    this.borderRadius = BorderRadius.zero,
  });

  @override
  CustomDropdownState createState() => CustomDropdownState();
}

class CustomDropdownState extends State<CustomDropdown> {
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      height: 40.0,
      child: Container(
        decoration: BoxDecoration(
          color: widget.backgroundColor,
          borderRadius: widget.borderRadius,
          border: widget.isUnderlined
              ? const Border(
                  bottom: BorderSide(
                    color: Colors.grey,
                    width: 1.0,
                  ),
                )
              : null,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          children: [
            widget.icon != null
                ? Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      widget.icon,
                      color: primaryForeGround(),
                    ),
                  )
                : const SizedBox(),
            SizedBox(
              width:
                  widget.icon != null ? widget.width * .7 : widget.width * .96,
              child: DropdownButton<String>(
                underline: widget.underline,
                style: TextStyle(color: primaryForeGround()),
                dropdownColor: primaryBackGround(),
                isExpanded: true,
                hint: Text(
                  widget.defaultTitle,
                  style: TextStyle(
                      color: widget.icon == null
                          ? themeColorGrey()
                          : lightColor()),
                ),
                value: selectedValue,
                onChanged: (String? newValue) {
                  setState(() {
                    selectedValue = newValue;
                  });
                },
                icon: widget.icon == null
                    ? SizedBox(
                        height: 30.0,
                        child: Column(
                          children: [
                            Icon(
                              Icons.expand_less_outlined,
                              color: primaryForeGround(),
                              size: 15.0,
                            ),
                            Icon(
                              Icons.expand_more_outlined,
                              color: primaryForeGround(),
                              size: 15.0,
                            ),
                          ],
                        ),
                      )
                    : Icon(
                        Icons.arrow_drop_down_circle_rounded,
                        color: primaryForeGround(),
                      ),
                items: widget.options.map((String option) {
                  return DropdownMenuItem<String>(
                    value: option,
                    child: Text(option),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
