import 'package:ejercicio_urbetrack/src/blocs/home_provider.dart';
import 'package:ejercicio_urbetrack/src/blocs/login_provider.dart';
import 'package:ejercicio_urbetrack/src/blocs/theme_changer_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'src/pages/home_page.dart';
import 'src/pages/login_page.dart';



void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

final theme = ThemeChanger(ThemeData(), "Dark");

  @override
  Widget build (BuildContext context){
    return  MultiProvider(
      child:  MaterialAppTheme(),
      providers: [
        ChangeNotifierProvider(
          create: (context) => LoginProvider()),
        ChangeNotifierProvider(
          create: (context)=> HomeProvider()),
        ChangeNotifierProvider(
          create: (_)=> ThemeChanger(ThemeData.light(), "Light"),)
        ],);
  }
}
  
  class MaterialAppTheme extends StatelessWidget{
      @override
        Widget build(BuildContext context) {

          final theme = Provider.of<ThemeChanger>(context);

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
