import 'package:flutter/material.dart';

const fontFamily = 'Roboto';
TextTheme globalTextTheme() {
  return const TextTheme(
    bodyMedium: TextStyle(
        fontFamily: fontFamily, fontWeight: FontWeight.normal, fontSize: 16.0),
    displayLarge: TextStyle(
        fontFamily: fontFamily, fontWeight: FontWeight.bold, fontSize: 24.0),
    displayMedium: TextStyle(
        fontFamily: fontFamily, fontWeight: FontWeight.w500, fontSize: 20.0),
    titleMedium: TextStyle(
        fontFamily: fontFamily, fontWeight: FontWeight.bold, fontSize: 16.0),
    titleSmall: TextStyle(
        fontFamily: fontFamily, fontWeight: FontWeight.w400, fontSize: 14.0),
  );
}
