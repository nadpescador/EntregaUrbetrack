import 'package:dio/dio.dart';
import 'package:ejercicio_urbetrack/src/models/images_model.dart';


class PicsumApi{

  Future <List<ImagesModel>> getData() async {
  final dio = new Dio();
  
  try{
    Response response = await dio.get('https://picsum.photos/v2/list');
    
    List<ImagesModel> imagesList = [];

    for (var p in response.data) {
      imagesList.add(ImagesModel.fromJson(p));
    }
    return imagesList;

  }catch(e){
    throw new Error();
  }

  
  }
}