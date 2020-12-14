import 'package:ejercicio_urbetrack/src/blocs/provider.dart';
import 'package:flutter/material.dart';
import 'src/pages/home_page.dart';
import 'src/pages/login_page.dart';


void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build (BuildContext context){
    return Provider(
        child: MaterialApp(
        home: LoginPage(),
        debugShowCheckedModeBanner: false,
        routes: {
          'login' : (BuildContext context) => LoginPage(),
          'home'  : (BuildContext context) => HomePage(),
        },
        theme: ThemeData(
          primaryColor: Colors.deepPurple,
        )),
    );
  }
}