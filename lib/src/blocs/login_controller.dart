

import 'package:ejercicio_urbetrack/src/models/login_validation_model.dart';
import 'package:flutter/material.dart';

class LoginController with ChangeNotifier {

  LoginValidationModel _username = LoginValidationModel(null, null);
  LoginValidationModel _password = LoginValidationModel(null, null);
  bool _succesfullLogin = false;


//USERNAME
    get getUsername {
    return _username;
  }

  void clearUsername(){
    _username=LoginValidationModel(null, null);
  }

  void setUsername(String username){
    if(username.length >= 3){
      _username=LoginValidationModel(username,null);
    } else {
      _username=LoginValidationModel(null, "El nombre debe tener al menos 3 letras");
    }
    notifyListeners();
  }

  //PASSWORD 
    get getPassword {
    return _password;
  }

  void clearPassword(){
    _password=LoginValidationModel(null,null);
  }

   void setPassword(String password){
    if(password=="123456"){
      _password=LoginValidationModel(password, null);
    } else {
      _password=LoginValidationModel(password, "Password incorrecto, pruebe nuevamente.");
    }
    notifyListeners();
  }
 


//VALIDATE LOGIN

  void clearSuccesfullLogin(){
    _succesfullLogin=false;
  }

  void validatePassword(String password){
    if (password == "123456"){
      _succesfullLogin = true;
    } else {
      _succesfullLogin = false;
    }
    notifyListeners();
  }

  get getSuccesfullLogin {
    return _succesfullLogin;
  }


}