import 'package:ejercicio_urbetrack/src/blocs/login_provider.dart';
import 'package:ejercicio_urbetrack/src/blocs/theme_changer_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final _loginProvider = Provider.of<LoginProvider>(context);
    final _theme         = Provider.of<ThemeChanger>(context);

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
                leading: Icon(Icons.brush),
                title: Text(_theme.darkLight.toString()),
                onTap: () {

                    _theme.changeDarkAndWhite();
                
                }
              ),
              Divider(thickness: 0.5),
              ListTile(
                leading: Icon(Icons.vpn_key),
                title: Text("Salir de la app"),
                onTap: () {
                  Navigator.pushNamedAndRemoveUntil(context, 'login', (route) => false);
                  _loginProvider.clearPassword();
                  _loginProvider.clearSuccesfullLogin();
                  _loginProvider.clearUsername();
                  
                } 
              ),
          ],
        ));
  }
}