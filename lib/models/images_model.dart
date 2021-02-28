class ImagesModel {
  String id;
  String author;
  int width;
  int height;
  String url;
  String downloadUrl;

  ImagesModel({
    this.id,
    this.author,
    this.width,
    this.height,
    this.url,
    this.downloadUrl,
  });

  factory ImagesModel.fromJson(Map<String, dynamic> json) {
    return ImagesModel(
      id: json['id'],
      author: json['author'],
      width: json['width'],
      height: json['height'],
      url: json['url'],
      downloadUrl: json['download_url'],
    );
  }
}
