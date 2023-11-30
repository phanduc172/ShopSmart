import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider with ChangeNotifier {
  static const THEME_STATUS = "THEME_STATUS";
  bool darkTheme = false;
  bool get getIsDartThem => darkTheme;

  ThemeProvider() {
    getTheme();
  }

  setDarkTheme(bool value) async {
    SharedPreferences prefer = await SharedPreferences.getInstance();
    prefer.setBool("key", value);
    darkTheme = value;
    notifyListeners();
  }
  Future<bool> getTheme() async {
    SharedPreferences prefer = await SharedPreferences.getInstance();
    darkTheme = prefer.getBool(THEME_STATUS) ?? false;
    notifyListeners();
    return darkTheme;
  }
}