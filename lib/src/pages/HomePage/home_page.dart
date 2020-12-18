import 'package:ejercicio_urbetrack/src/pages/HomePage/home_controller.dart';
import 'package:ejercicio_urbetrack/src/pages/HomePage/widgets/home_page_body.dart';
import 'package:ejercicio_urbetrack/src/widgets/drawer_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

  class HomePage extends StatelessWidget {
    const HomePage({Key key}) : super(key: key);
  
    @override
    Widget build(BuildContext context) {

      final _homeController =  Provider.of<HomeController>(context);
      final _titleStyle = new TextStyle(fontSize: 19, fontWeight: FontWeight.bold);
      final _screenSize = MediaQuery.of(context);
      

      return WillPopScope(
        onWillPop: () => HomeController().backPressed(context),
        child: SafeArea(
          minimum: EdgeInsets.only(top: 35),
          child: Scaffold(
            appBar: AppBar(
              title: Text("Urbetrack APP"),
              centerTitle: true,
              backgroundColor: Colors.deepPurple,
            ),
            body: HomePageBody(homeController: _homeController, titleStyle: _titleStyle, screenSize: _screenSize),
              drawer: DrawerWidget(),
              )
            ));
            }



    }





  
  


  