import 'package:anga/views/themes/themes.dart';
import 'package:flutter/material.dart';

class ContactInfo extends StatelessWidget {
  const ContactInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * .6,
      child: Row(
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

  IconTextWidget({required this.icon, required this.text});

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
            SizedBox(width: 8), // Space between icon and text
            Text(
              text,
              style: TextStyle(
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
