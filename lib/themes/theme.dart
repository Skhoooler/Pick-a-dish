import 'package:flutter/material.dart';
import 'package:pick_a_dish/themes/colors.dart';
import 'package:google_fonts/google_fonts.dart';

class PADTheme {
  static ThemeData get darkTheme {
    return ThemeData(
      canvasColor: PADColors.canvas,

      /* BUTTON THEMES */
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.pressed)) {
              return PADColors.panel;
            }
            return PADColors.primary;
          }),
          textStyle: MaterialStateProperty.resolveWith(
            (states) {
              if (states.contains(MaterialState.pressed)) {
                return textTheme.bodyText1
                    ?.copyWith(color: PADColors.text1, fontSize: 32);
              }
              return textTheme.bodyText1
                  ?.copyWith(color: PADColors.canvas, fontSize: 28);
            },
          ),
        ),
      ),

      /* INPUT THEMES */
      inputDecorationTheme: InputDecorationTheme(
        hintStyle: textTheme.bodyText1?.copyWith(color: PADColors.primary),
        counterStyle: textTheme.bodyText1?.copyWith(color: PADColors.primary),

        //border: CustomPainter()

        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: PADColors.primary),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(color: PADColors.primary),
        ),
      ),

      /* ICON THEMES */
      iconTheme: IconThemeData(
        color: PADColors.primary,
        size: 40,
      ),

      /* TEXT THEMES */
      textTheme: textTheme,
    );
  }

  static TextTheme get textTheme {
    return TextTheme(
        headline1: GoogleFonts.playfairDisplaySc().copyWith(
          color: PADColors.canvas,
          fontSize: 64,
        ),
        headline2: GoogleFonts.lato().copyWith(
          color: PADColors.primary,
          fontSize: 48,
        ),
        headline3: GoogleFonts.lato().copyWith(
          color: PADColors.text1,
          fontSize: 25
        ),
        bodyText1: GoogleFonts.lato().copyWith(
          color: PADColors.panel,
        ),
        bodyText2: GoogleFonts.lato().copyWith(
          color: PADColors.primary,
        ),
        subtitle1: GoogleFonts.lato().copyWith(
          color: PADColors.primary,
        ));
  }
}

// RESOURCES
//
// https://www.kodeco.com/16628777-theming-a-flutter-app-getting-started
