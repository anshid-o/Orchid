import 'package:flutter/material.dart';

Color col1(ctx) => Theme.of(ctx).colorScheme.inversePrimary;
const Color color1 = Color.fromARGB(255, 255, 224, 184);
Color kc10 = Colors.brown;
const MaterialColor primaryBlack = MaterialColor(
  _blackPrimaryValue,
  <int, Color>{
    50: Color(0xFF000000),
    100: Color(0xFF000000),
    200: Color(0xFF000000),
    300: Color(0xFF000000),
    400: Color(0xFF000000),
    500: Color(_blackPrimaryValue),
    600: Color(0xFF000000),
    700: Color(0xFF000000),
    800: Color(0xFF000000),
    900: Color(0xFF000000),
  },
);

const textColor = Colors.black;
const textStyleHead = TextStyle(fontSize: 18);
const textStyleSubhead = TextStyle(fontSize: 15);
const subTextStyle = TextStyle(fontSize: 15, fontWeight: FontWeight.bold);

const int _blackPrimaryValue = 0xFF000000;

const MaterialColor primaryWhite = MaterialColor(
  _whitePrimaryValue,
  <int, Color>{
    50: Color(0xFF000000),
    100: Color(0xFF000000),
    200: Color(0xFF000000),
    300: Color(0xFF000000),
    400: Color(0xFF000000),
    500: Color(_whitePrimaryValue),
    600: Color(0xFF000000),
    700: Color(0xFF000000),
    800: Color(0xFF000000),
    900: Color(0xFF000000),
  },
);

const int _whitePrimaryValue = 0xFF000000;
