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


}