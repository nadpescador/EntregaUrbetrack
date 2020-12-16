import 'package:ejercicio_urbetrack/src/models/images_model.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class HomeProvider with ChangeNotifier {

  List <Images> _listaImagenes = [];

  Future<Images> dataLorem() async {
    Dio dio = Dio();
    final response = await dio.get("https://picsum.photos/v2/list");
    
    if(response.statusCode == 200){
        print(response.data);
    } else {
      throw Exception("Api no encontrada");
    }

  }

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

}