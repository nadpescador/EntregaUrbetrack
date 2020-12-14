import 'package:ejercicio_urbetrack/src/blocs/login_bloc.dart';
import 'package:ejercicio_urbetrack/src/blocs/provider.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(MaterialApp(
    home: HomePage(),
  ));
}

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => new HomePageState();
}

class HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    final _bloc = Provider.of(context);

    return Scaffold(
      appBar: AppBar(backgroundColor:Colors.deepPurpleAccent),
      drawer: _drawer(_bloc),
      body: Text("Hola MUndo"),
    );
    
  }
}


  Widget _drawer(LoginBloc _bloc ){
    return Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.supervised_user_circle, color: Colors.deepPurpleAccent),
                  SizedBox(width: 10),
                  Text(_bloc.username, style: TextStyle(fontSize: 35, color: Colors.deepPurpleAccent),),
                ],
              )),
              ListTile(
                title: Text("DarkMode"),
              ),
              Divider(thickness: 0.5),
              ListTile(
                title: Text("Cerrar Sesión"),
              ),
          ],
        ));
  }


  