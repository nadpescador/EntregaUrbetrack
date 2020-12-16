
class ImagesModel {
        String _id;
        String _author;
        int _width;
        int _height;
        String _url;
        String _downloadUrl;



      String get id => _id;
      String get author => _author;
      String get downloadUrl => _downloadUrl;
      int get width => _width;
      int get height => _height;
      String get url => _url;


      ImagesModel({String id, String author, String downloadUrl, int width, int height, String url}){
        this._id = id;
        this._author = author;
        this._downloadUrl = downloadUrl;
        this._width = width;
        this._height = height;
        this._url = url;

      }


        factory ImagesModel.fromJson(Map<String, dynamic> json){
          return new ImagesModel(
            id          : json['id'],
            author      : json['author'],
            width       : json['width'],
            height      : json['height'],
            url         : json['url'],
            downloadUrl : json['download_url'],
          );
        }
          
        
}
    