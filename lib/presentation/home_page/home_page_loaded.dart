import 'package:ejercicio_urbetrack/models/images_model.dart';
import 'package:flutter/material.dart';

class HomePageLoaded extends StatelessWidget {
  const HomePageLoaded({
    Key key,
    @required this.images,
  }) : super(key: key);
  final List<ImagesModel> images;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.5,
            width: MediaQuery.of(context).size.height * 0.5,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: images.length,
              itemBuilder: (_, index) {
                return Container(
                  margin: const EdgeInsets.all(20),
                  child: FadeInImage.assetNetwork(
                      placeholder: 'assets/images/loading.gif',
                      image: images[index].downloadUrl),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
