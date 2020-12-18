
import 'package:flutter/material.dart';


class ThemeController with ChangeNotifier{

ThemeData _themeData;
String _darkLight;

ThemeController(this._themeData, this._darkLight);

  getTheme () {
  return _themeData;
}

void setTheme(ThemeData data){
  _themeData = data;
  notifyListeners();
}

  void changeDarkAndWhite(context){
     if(_themeData == ThemeData.light()){
         _themeData = ThemeData.dark();
         _darkLight = "Cambiar a modo claro";
         print("Deberia ser negro ahora");
       } else if(_themeData==ThemeData.dark()){
         _themeData = ThemeData.light();
         print("Deberia ser blanco ahora");
         _darkLight = "Cambiar a modo oscuro";
       }
       notifyListeners();
  }

get darkLight{
  return _darkLight;
}

void setDarkLight(String darklight){
  _darkLight=darklight;
  notifyListeners();
}



}
