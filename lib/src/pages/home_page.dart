import 'package:ejercicio_urbetrack/src/providers/login_provider.dart';
import 'package:ejercicio_urbetrack/src/resources/widgets/drawer_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

  class HomePage extends StatelessWidget {
    const HomePage({Key key}) : super(key: key);
  
    @override
    Widget build(BuildContext context) {

      final loginProvider = Provider.of<LoginProvider>(context);
      loginProvider.setPassword(null);

      return Scaffold(
        appBar: AppBar(
          title: Text("Urbetrack APP"),
        ),
        body: Center(
          child: Text(loginProvider.getUsername.value),
        ),
        drawer: DrawerWidget(),
      );
    }
  }





  
  


  