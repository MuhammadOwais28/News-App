// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

class MyThemes {
  static ThemeData lightTheme(BuildContext context) => ThemeData(
      canvasColor: lightbgColor,
      // ignore: prefer_const_constructors
      accentColor: Color.fromARGB(255, 2, 34, 65),
      cardColor: creamColor,
      buttonColor: darkCreamColor);
  static ThemeData darkTheme(BuildContext context) => ThemeData(
      brightness: Brightness.dark,
      canvasColor: const Color.fromARGB(
        255,
        2,
        34,
        65,
      ),
      accentColor: creamColor,
      cardColor: verydarkBlue,
      buttonColor: Colors.black);

  static Color creamColor = const Color(0xfff5f5f5);
  static Color darkCreamColor = Colors.grey.shade400;
  static Color lightbgColor = const Color(0xffededed);

  
  static Color verydarkBlue = const Color(0xff081735);
}
