import 'dart:convert';

import 'package:ejercicio_urbetrack/src/models/images_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CargarImagenes{

  List<Images> imagenes = [];

   Future <List<Images>> getImages() async {
    var data = await http.get("https://picsum.photos/v2/list");
    var jsonData = jsonDecode(data.body);



    for (var i in jsonData) {
      
    }

    return imagenes;  
    }
}

    


 
  
 