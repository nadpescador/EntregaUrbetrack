import 'package:ejercicio_urbetrack/src/blocs/home_provider.dart';
import 'package:ejercicio_urbetrack/src/models/images_model.dart';
import 'package:ejercicio_urbetrack/src/widgets/drawer_widget.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

  class HomePage extends StatelessWidget {
    const HomePage({Key key}) : super(key: key);
  
    @override
    Widget build(BuildContext context) {

      //final theme = Provider.of<ThemeChanger>(context);
      final homeProvider =  Provider.of<HomeProvider>(context);
      //final loginProvider = Provider.of<LoginProvider>(context);

      final _titleStyle = new TextStyle(fontSize: 19, fontWeight: FontWeight.bold);
      final _screenSize = MediaQuery.of(context);
      

      return WillPopScope(
        onWillPop: () => homeProvider.backPressed(context),
        child: SafeArea(
          minimum: EdgeInsets.only(top: 35),
          child: Scaffold(
            appBar: AppBar(
              title: Text("Urbetrack APP"),
              centerTitle: true,
              backgroundColor: Colors.deepPurple,
            ),
            body: FutureBuilder(
                    future: homeProvider.getPics(),
                    builder: (_, AsyncSnapshot<List<ImagesModel>> snapshot) { 
                      if(snapshot.hasData){
                        print(snapshot.data.length);
                        return ListView.builder(
                          itemCount: snapshot.data.length,
                          itemBuilder: (context, index){
                            return FlipCard(
                              front: Card(
                                clipBehavior: Clip.antiAlias,
                                elevation: 5,
                                margin: EdgeInsets.all(40),
                                child: Container(
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
                                              Text("PH", style: _titleStyle,),
                                            ],
                                          ),
                                          trailing: Icon(Icons.arrow_forward_ios),
                                          title: Text(snapshot.data[index].author, style: _titleStyle, textAlign: TextAlign.center,))),
                                       FadeInImage(
                                         fit:  BoxFit.fill,
                                         placeholder:AssetImage("assets/images/25.gif"),
                                         image: NetworkImage("${snapshot.data[index].downloadUrl}",),
                                         height: _screenSize.size.height/3,
                                         width: _screenSize.size.width/0.5,
                                        ),
                                      ],
                                  )
                                  ),
                                
                              ),
                              back: Container(
                                margin: EdgeInsets.all(50),
                                height: 350,                                
                                width: 300,
                                child: Card(
                                  child: Column(
                                    children: [
                                      Text("Autor: ", style: _titleStyle,),
                                      Text("${snapshot.data[index].author}"),
                                      Divider(),
                                      Text("ID:", style: _titleStyle,),
                                      Text("${snapshot.data[index].id}"),
                                      Divider(),
                                      Text("Download Url:", style: _titleStyle,),
                                      Text("${snapshot.data[index].downloadUrl}"),
                                      Divider(),
                                      Text("Height:", style: _titleStyle,),
                                      Text("${snapshot.data[index].height}"),
                                      Divider(),
                                      Text("Width:", style: _titleStyle,),
                                      Text("${snapshot.data[index].width}"),
                                      Divider(),
                                      Text("Url:", style: _titleStyle,),
                                      Text("${snapshot.data[index].url}")

                                    ],
                                  ),
                                ),
                              ),
                            );
                          });
                      } else {
                        return CircularProgressIndicator();
                      }

                    }                   
                    
                    ),
              drawer: DrawerWidget(),
              )
            ));
            }



    }





  
  


  