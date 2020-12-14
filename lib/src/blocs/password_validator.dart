
import 'dart:async';

class PasswordValidator{

  final validPassword = StreamTransformer<String, String>.fromHandlers(
    handleData: (password, sink) {
      if (password == "123456"){
        sink.add( password );
      } else {
        sink.addError("El password es incorrecto");
      }
    }
  );  

  final validUser = StreamTransformer<String,String>.fromHandlers(
    handleData: (username, sink) {
      if(username != null){
        sink.add(username);
      } else {
        sink.addError("Debe introducirse un nombre de usuario.");
      }
    },
  );

}