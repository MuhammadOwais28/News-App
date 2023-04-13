import 'package:flutter/material.dart';

class MyThemes {
  static ThemeData lightTheme(BuildContext context) => ThemeData(
      canvasColor: lightbgColor,
      accentColor: Color.fromARGB(255, 4, 42, 74),
      cardColor: creamColor);
  static ThemeData darkTheme(BuildContext context) => ThemeData(
      brightness: Brightness.dark,
      canvasColor: const Color.fromARGB(
        255,
        2,
        34,
        65,
      ),
      accentColor: creamColor,
      cardColor: verydarkBlue);

  static Color creamColor = const Color(0xfff5f5f5);
  static Color darkCreamColor = Colors.grey.shade400;
  static Color lightbgColor = const Color(0xffededed);

  static Color darkBluishColor = const Color(0xff403b58);
  static Color verydarkBlue = const Color(0xff081735);
}
