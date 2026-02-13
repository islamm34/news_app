import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier{
  ThemeMode themeMode = ThemeMode.dark;

bool get isLightMode => themeMode == ThemeMode.light;


  changeTheme(ThemeMode newThemeMode) {
    themeMode = newThemeMode;
    notifyListeners();
  }
}