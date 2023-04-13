import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  bool dark = false;
  toggleTheme() {
    dark = !dark;
    notifyListeners();
  }
}
