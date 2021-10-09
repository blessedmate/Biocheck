import 'package:biocheck_flutter/app/utils/palette.dart';
import 'package:flutter/material.dart';

class TypographyStyles {
  static const title = TextStyle(
    fontSize: 24,
    fontFamily: 'Airbnb',
    fontWeight: FontWeight.w500,
    color: Colors.black,
  );

  static const warning = TextStyle(
      fontSize: 14,
      fontFamily: 'Airbnb',
      fontWeight: FontWeight.w300,
      color: Colors.red);

  static const bigbuttons = TextStyle(
      fontSize: 18,
      fontFamily: 'Airbnb',
      package: 'fonts/AirbnbCerealLight.ttf');

  static const subtitle = TextStyle(
      fontSize: 18, fontFamily: 'Airbnb', fontWeight: FontWeight.w500);

  static const evaluationOptions = TextStyle(
      fontSize: 14, fontFamily: 'Airbnb', fontWeight: FontWeight.w500);

  static const signIn = TextStyle(
      fontSize: 14,
      fontFamily: 'Airbnb',
      fontWeight: FontWeight.w500,
      color: Palette.primaryColor);
}
