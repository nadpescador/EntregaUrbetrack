
import 'package:flutter/material.dart';


class ThemeChanger with ChangeNotifier{

ThemeData _themeData;
String _darkLight = "Light";

ThemeChanger(this._themeData, this._darkLight);

ThemeData get getTheme {
  return _themeData;
}

void setTheme(ThemeData data){
  _themeData = data;
}

  void changeDarkAndWhite(){
     if(_themeData == ThemeData.light()){
         _themeData = ThemeData.dark();
         _darkLight = "Dark";
         print("Deberia ser negro ahora");
       } else if(_themeData==ThemeData.dark()){
         _themeData = ThemeData.light();
         print("Deberia ser blanco ahora");
         _darkLight = "Light";
       }
       notifyListeners();
  }

get darkLight{
  return _darkLight;
}
}
