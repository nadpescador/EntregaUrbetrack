import 'dart:async';
import 'package:rxdart/rxdart.dart';
import 'package:ejercicio_urbetrack/src/blocs/password_validator.dart';

class LoginBloc with PasswordValidator{

    final _passwordController = BehaviorSubject<String>();
    final _usernameController = BehaviorSubject<String>();


  Stream<String> get passwordStream => _passwordController.stream.transform(validPassword);
  Stream<String> get usernameString => _usernameController.stream.transform(validUser);
  Stream<bool>   get validateForm   => Observable.combineLatest2(passwordStream, usernameString, (a, b) => true);


  Function(String) get addPassword => _passwordController.sink.add;
  Function(String) get addUsername => _usernameController.sink.add;

  String get username => _usernameController.value;

  dispose(){
    _passwordController?.close();
    _usernameController?.close();
  }
    

}