import 'package:flutter/material.dart';

Map getResolution(context) {
  double actualHeight = MediaQuery.of(context).size.height -
      ((MediaQuery.of(context).padding.top +
          MediaQuery.of(context).padding.bottom));
  double actualWidth = MediaQuery.of(context).size.width;
  double heightWidthRatio = actualHeight / actualWidth;
  double displayWidth =
      MediaQuery.of(context).size.width > 600 && (heightWidthRatio < 1)
          ? ((MediaQuery.of(context).size.width) < 600
              ? 600
              : ( MediaQuery.of(context).size.width))
          : MediaQuery.of(context).size.width;

           double dialogueWidth =
      MediaQuery.of(context).size.width > 500 && (heightWidthRatio < 1)
          ?  (.65 * MediaQuery.of(context).size.width)
          : MediaQuery.of(context).size.width;
          double dialogueWidth2 =
      MediaQuery.of(context).size.width > 500 && (heightWidthRatio < 1)
          ?  (.45 * MediaQuery.of(context).size.width)
          : MediaQuery.of(context).size.width;

  double displayHeight = (heightWidthRatio < 1)
      ? (actualHeight < 500 ? 650 : actualHeight)
      : actualHeight;

  return {'width': displayWidth,'dialogue_width': dialogueWidth,'dialogue_width2': dialogueWidth2, 'height': displayHeight};
}