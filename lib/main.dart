import 'package:ejercicio_urbetrack/src/blocs/theme_controller.dart';
import 'package:ejercicio_urbetrack/src/pages/HomePage/home_controller.dart';
import 'package:ejercicio_urbetrack/src/pages/LoginPage/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'src/pages/HomePage/home_page.dart';
import 'src/pages/LoginPage/login_page.dart';



void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

final theme = ThemeController(ThemeData(), "Dark");

  @override
  Widget build (BuildContext context){
    return  MultiProvider(
      child:  MaterialAppTheme(),
      providers: [
        ChangeNotifierProvider(
          create: (context) => LoginController()),
        ChangeNotifierProvider(
          create: (context)=> HomeController()),
        ChangeNotifierProvider(
          create: (_)=> ThemeController(ThemeData.light(), "Light"),)
        ],);
  }
}
  
  class MaterialAppTheme extends StatelessWidget{
      @override
        Widget build(BuildContext context) {

          final theme = Provider.of<ThemeController>(context);

            return MaterialApp(
                home: LoginPage(),
                debugShowCheckedModeBanner: false,
                routes: {
                  'login' : (BuildContext context) => LoginPage(),
                  'home'  : (BuildContext context) => HomePage(),
                },
            theme: theme.getTheme(),
            );
        }
  }
