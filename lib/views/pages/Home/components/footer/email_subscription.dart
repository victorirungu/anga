import 'package:anga/views/themes/themes.dart';
import 'package:anga/views/widgets/text.dart';
import 'package:flutter/material.dart';

class EmailSubscription extends StatelessWidget {
  final double width;
  const EmailSubscription({super.key, required this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width * .37,
      height: 45.0,
      decoration: BoxDecoration(
        color: lightColor(),
        borderRadius: BorderRadius.circular(30.0),
      ),
      child: Row(
        children: <Widget>[
          const Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Your email address',
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(left: 20.0),
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.all(0.0),
              fixedSize: const Size(150.0, 45.0),
              backgroundColor: secondaryColor(),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
            ),
            child: CustomText(
              text: 'Subscribe',
              color: lightColor(),
              fontSize: 20.0,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
