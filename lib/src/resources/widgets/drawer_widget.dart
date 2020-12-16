import 'package:ejercicio_urbetrack/src/providers/login_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final _loginProvider = Provider.of<LoginProvider>(context);

    return Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.supervised_user_circle, color: Colors.deepPurpleAccent),
                  SizedBox(width: 10),
                  Text(_loginProvider.getUsername.value, style: TextStyle(fontSize: 35, color: Colors.deepPurpleAccent),),
                ],
              )),
              ListTile(
                title: Text("DarkMode"),
              ),
              Divider(thickness: 0.5),
              ListTile(
                title: Text("Salir de la app"),
                onTap: () {
                  Navigator.pushNamed(context, 'login');
                  _loginProvider.clearPassword();
                  _loginProvider.clearSuccesfullLogin();
                  _loginProvider.clearUsername();
                  
                } 
              ),
          ],
        ));
  }
}