import 'package:ejercicio_urbetrack/src/api/picsum_api.dart';
import 'package:ejercicio_urbetrack/src/models/images_model.dart';
import 'package:flutter/material.dart';

class HomeController extends ChangeNotifier {

  var picsumApi = new PicsumApi();

  //DISABLE BACKBUTTON
  Future<bool> backPressed(context){
    return showDialog(
      context: context,
      builder: (context)=>AlertDialog(
        title: Text("No se puede volver."),
        actions: <Widget> [
          FlatButton(
            onPressed: ()=> Navigator.pop(context, false),
           child: Text("Aceptar"))
        ],
      )

    );
  }


  Future <List<ImagesModel>> getPics() {
    try{
      return picsumApi.getData();
    } catch (e){
      return Future.value([]);
    }
  }





}