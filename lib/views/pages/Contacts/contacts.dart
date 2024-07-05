import 'package:anga/views/functions/resolution.dart';
import 'package:anga/views/pages/Contacts/components/contact_info.dart';
import 'package:anga/views/pages/Contacts/components/form.dart';
import 'package:anga/views/pages/Home/components/footer/footer.dart';
import 'package:anga/views/themes/themes.dart';
import 'package:flutter/material.dart';

class Contacts extends StatelessWidget {
  ScrollController scrollController = ScrollController();

  Contacts({super.key});
  @override
  Widget build(BuildContext context) {
    Map resolution = getResolution(context);
    double width = resolution['width'];
    double height = resolution['height'];
    return SizedBox(
      height: height,
      child: ScrollbarTheme(
        data: ScrollbarThemeData(
          thumbColor:
              WidgetStateProperty.all(primaryForeGround().withOpacity(.75)),
          radius: const Radius.circular(5.0),
          thickness: WidgetStateProperty.all(width > 500 ? 7.0 : 3.0),
          thumbVisibility: WidgetStateProperty.all(true),
          trackVisibility: WidgetStateProperty.all(false),
          interactive: true,
          trackColor: WidgetStateProperty.all(primaryColor().withOpacity(.2)),
        ),
        child: Scrollbar(
          controller: scrollController,
          radius: const Radius.circular(5.0),
          thickness: width > 500 ? 7.0 : 3.0,
          child: SingleChildScrollView(
            controller: scrollController,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                //Header
                ContactForm(width: width),
                const Padding(
                  padding: EdgeInsets.only(top: 80.0, bottom: 80.0),
                  child: ContactInfo(),
                ),
                Footer(width: width),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
