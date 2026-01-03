import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  bool isDarkMode = false;

  void toggleTheme(bool value) {
    isDarkMode = value;
    notifyListeners();
  }
}
