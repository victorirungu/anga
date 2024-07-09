import 'package:anga/views/themes/themes.dart';
import 'package:flutter/material.dart';

class ContactInfo extends StatelessWidget {
  const ContactInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return MediaQuery.of(context).size.width > 1050
        ? SizedBox(
            width: MediaQuery.of(context).size.width * .7,
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconTextWidget(
                  icon: Icons.location_on,
                  text: 'Diamond Plaza, Pramukh Swami Ave',
                ),
                IconTextWidget(
                  icon: Icons.phone_in_talk,
                  text: '+254709920000 ',
                ),
                IconTextWidget(
                  icon: Icons.email_outlined,
                  text: 'support@angacinemas.com',
                ),
              ],
            ),
          )
        : MediaQuery.of(context).size.width > 700
            ? SizedBox(
                height: 170.0,
                width: MediaQuery.of(context).size.width * .8,
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: IconTextWidget(
                            icon: Icons.location_on,
                            text: 'Diamond Plaza, Pramukh Swami Ave',
                          ),
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        IconTextWidget(
                          icon: Icons.phone_in_talk,
                          text: '+254709920000 ',
                        ),
                      ],
                    ),
                    IconTextWidget(
                      icon: Icons.email_outlined,
                      text: 'support@angacinemas.com',
                    ),
                  ],
                ),
              )
            : SizedBox(
                width: MediaQuery.of(context).size.width * .8,
                height: 200.0,
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconTextWidget(
                      icon: Icons.location_on,
                      text: 'Diamond Plaza, Pramukh Swami Ave',
                    ),
                    IconTextWidget(
                      icon: Icons.phone_in_talk,
                      text: '+254709920000 ',
                    ),
                    IconTextWidget(
                      icon: Icons.email_outlined,
                      text: 'support@angacinemas.com',
                    ),
                  ],
                ),
              );
  }
}

class IconTextWidget extends StatelessWidget {
  final IconData icon;
  final String text;

  const IconTextWidget({super.key, required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: primaryColor(), borderRadius: BorderRadius.circular(10.0)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                  color: colorBlack(),
                  borderRadius: BorderRadius.circular(3.0)),
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Icon(
                  icon,
                  color: primaryColor(), // Icon color
                ),
              ),
            ),
            const SizedBox(width: 8), // Space between icon and text
            SelectableText(
              text,
              style: const TextStyle(
                color: Colors.black, // Text color
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
