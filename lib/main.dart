import 'package:flutter/material.dart';
import 'package:pick_a_dish/home.dart';
import 'package:pick_a_dish/themes/theme.dart';

void main() {
  runApp(const PickADish());
}

class PickADish extends StatelessWidget {
  const PickADish({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pick A Dish',
      theme: PADTheme.darkTheme,
      home: const Home()
    );
  }
}

