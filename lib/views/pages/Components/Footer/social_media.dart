import 'package:anga/views/themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SocialMediaIcons extends StatelessWidget {
  const SocialMediaIcons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildSocialIcon(FontAwesomeIcons.facebookF, () {},
            top: 12.0, left: 12.0),
        _buildSocialIcon(FontAwesomeIcons.xTwitter, () {}),
        _buildSocialIcon(FontAwesomeIcons.instagram, () {}),
        _buildSocialIcon(FontAwesomeIcons.linkedinIn, () {}),
      ],
    );
  }

  Widget _buildSocialIcon(IconData icon, onTap,
      {double top = 8.0, double left = 8.0}) {
    return InkWell(
      onTap: () => onTap,
      child: Stack(children: [
        Container(
          padding: const EdgeInsets.all(0.0),
          width: 38.0,
          height: 38.0,
          margin: const EdgeInsets.all(2.0),
          decoration: BoxDecoration(
            color: primaryForeGround(),
            border: Border.all(color: themeColorTransparent()),
            borderRadius: BorderRadius.circular(3.0),
          ),
        ),
        Positioned(
          top: top,
          left: left,
          child: FaIcon(
            icon,
            color: primaryBackGround(),
            size: 28.0,
          ),
        )
      ]),
    );
  }
}
