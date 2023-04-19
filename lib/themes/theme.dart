import 'package:flutter/material.dart';
import 'package:pick_a_dish/themes/colors.dart';

class PADTheme {
  static ThemeData get darkTheme {
    return ThemeData(
      canvasColor: PADColors.canvas,
      textTheme: TextTheme(
        headline1: TextStyle(color: PADColors.primary),
        bodyText1: TextStyle(color: PADColors.text1),
      ),
    );
  }
}

// RESOURCES
//
// https://www.kodeco.com/16628777-theming-a-flutter-app-getting-started
