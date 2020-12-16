
import 'package:flutter/material.dart';


class ThemeChanger with ChangeNotifier{

ThemeData _themeData;
bool _isDarkTheme = false;

ThemeChanger(this._themeData);

get getTheme {
  return _themeData;
}

void setTheme(ThemeData theme) {
  this._themeData = theme;
  notifyListeners();

}

get getIsDarkTheme => _isDarkTheme;

}