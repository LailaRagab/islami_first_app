import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier{
  ThemeMode currentTheme = ThemeMode.light;

  bool get isDarkActive => currentTheme == ThemeMode.dark;

  set newTheme(ThemeMode newTheme){
    currentTheme = newTheme ;
    notifyListeners();
  }
}