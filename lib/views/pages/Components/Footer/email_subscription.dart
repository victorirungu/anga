import 'package:anga/views/themes/themes.dart';
import 'package:anga/views/widgets/text.dart';
import 'package:flutter/material.dart';

class EmailSubscription extends StatelessWidget {
  final double width;
  const EmailSubscription({super.key, required this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width > 900 ? width * .37 : width * .7,
      height: width > 600 ? 45.0 : 42.0,
      decoration: BoxDecoration(
        color: lightColor(),
        borderRadius: BorderRadius.circular(30.0),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
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
              fixedSize: Size(
                width > 600 ? 150.0 : 120.0,
                width > 600 ? 45.0 : 42.0,
              ),
              backgroundColor: secondaryColor(),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
            ),
            child: CustomText(
              text: 'Subscribe',
              color: lightColor(),
              fontSize: width * .0225 > 20.0
                  ? 20.0
                  : width * .0225 < 14.0
                      ? 14.0
                      : width * .0225,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
