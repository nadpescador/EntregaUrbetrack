import 'package:ejercicio_urbetrack/src/pages/ImagesPage/images_controller.dart';
import 'package:ejercicio_urbetrack/src/models/images_model.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';


class ImagesPageBody extends StatefulWidget {
  const ImagesPageBody({
    Key key,
    @required this.homeController,
    @required TextStyle titleStyle,
    @required MediaQueryData screenSize,
  }) : _titleStyle = titleStyle, _screenSize = screenSize, super(key: key);

  final ImagesController homeController;
  final TextStyle _titleStyle;
  final MediaQueryData _screenSize;

  @override
  _ImagesPageBodyState createState() => _ImagesPageBodyState();
}




class _ImagesPageBodyState extends State<ImagesPageBody> {

  Future<Null> refreshList( ) async {
    await Future.delayed(Duration(seconds: 2));
    }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
            future: widget.homeController.getPics(),
            builder: (_, AsyncSnapshot<List<ImagesModel>> snapshot) { 
              if(snapshot.hasData){
                print(snapshot.data.length);
                return RefreshIndicator(
                  onRefresh: () => refreshList(),
                  child: ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (context, index){
                      return FlipCard(
                        front: frontCard(snapshot, index),
                        back: backCard(snapshot, index),
                      );
                    }),
                );
              } else {
                return Center(child: CircularProgressIndicator());
              }

            }                   
            
            );
  }

  Container backCard(AsyncSnapshot<List<ImagesModel>> snapshot, int index) {
    return Container(
      margin: EdgeInsets.all(50),
      height: 350,                                
      width: 300,
      child: Card(
        child: Column(
          children: [
            Text("Autor: ", style: widget._titleStyle,),
            Text("${snapshot.data[index].author}"),
            Divider(),
            Text("ID:", style: widget._titleStyle,),
            Text("${snapshot.data[index].id}"),
            Divider(),
            Text("Download Url:", style: widget._titleStyle,),
            Text("${snapshot.data[index].downloadUrl}"),
            Divider(),
            Text("Height:", style: widget._titleStyle,),
            Text("${snapshot.data[index].height}"),
            Divider(),
            Text("Width:", style: widget._titleStyle,),
            Text("${snapshot.data[index].width}"),
            Divider(),
            Text("Url:", style: widget._titleStyle,),
            Text("${snapshot.data[index].url}")
          ],
        ),
      ),
    );
  }

  Container frontCard(AsyncSnapshot<List<ImagesModel>> snapshot, int index) {
    return Container(
             padding: EdgeInsets.only(left:30,right: 30, top: 40),
             child: Card(
               elevation: 4,
               child: Column(
                 mainAxisAlignment: MainAxisAlignment.center,
                 crossAxisAlignment: CrossAxisAlignment.center,
                 children: [
                   Container(
                     margin: EdgeInsets.all(20),
                     child: ListTile(
                       leading: Column(
                         children: [
                           Icon(Icons.photo_camera, color: Colors.blueAccent,),
                           Text("PH", style: widget._titleStyle,),
                         ],
                       ),
                       subtitle: Text("Por lorem.picsum", textAlign: TextAlign.center),
                       trailing: Icon(Icons.arrow_forward_ios),
                       title: Text(snapshot.data[index].author, style: widget._titleStyle, textAlign: TextAlign.center,))),
                    Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10.0,right: 10.0, bottom: 5),
                          child: FadeInImage(
                            fit:  BoxFit.contain,
                            placeholder: AssetImage('assets/images/loading.gif'),
                            image: NetworkImage("${snapshot.data[index].downloadUrl}",),
                            height: widget._screenSize.size.height/3.0,
                            width: widget._screenSize.size.width/0.5,
                           ),
                        ),
                      ),
                    ),
                   ],
               )
               ),
             
           );
  }



}

