
import 'package:ejercicio_urbetrack/src/pages/ImagesPage/images_controller.dart';
import 'package:ejercicio_urbetrack/src/pages/ImagesPage/widgets/images_page_body.dart';
import 'package:ejercicio_urbetrack/src/widgets/drawer_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

  class ImagesPage extends StatelessWidget {
    const ImagesPage({Key key}) : super(key: key);
  
    @override
    Widget build(BuildContext context) {

      final _homeController =  Provider.of<ImagesController>(context);
      final _titleStyle = new TextStyle(fontSize: 19, fontWeight: FontWeight.bold);
      final _screenSize = MediaQuery.of(context);
      

      return WillPopScope(
        onWillPop: () => ImagesController().backPressed(context),
        child: SafeArea(
          minimum: EdgeInsets.only(top: 35),
          child: Scaffold(
            appBar: AppBar(
              title: Text("Urbetrack APP"),
              centerTitle: true,
              backgroundColor: Colors.deepPurple,
            ),
            body: ImagesPageBody(homeController: _homeController, titleStyle: _titleStyle, screenSize: _screenSize),
              drawer: DrawerWidget(),
              )
            ));
            }



    }





  
  


  