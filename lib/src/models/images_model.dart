
class ImagesModel {
  List<Images> items = new List();

  ImagesModel();

  ImagesModel.fromJsonList(List<dynamic> jsonList){
    if (jsonList == null) return;

    for(var item in jsonList){
      final imagen = new Images.fromJsonMap(item);
            items.add(imagen);
          }
        } 
      }
      
      class Images {
        String id;
        String author;
        int width;
        int height;
        String url;
      
        Images({
          this.id,
          this.author,
          this.width,
          this.height,
          this.url,
        });
      
        Images.fromJsonMap(Map<String,dynamic> json){
          id      = json["id"];    
          author  = json["author"];
          url     = json["url"];
          width   = json["width"];
          height  = json["height"];
        }


  }
